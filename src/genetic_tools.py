import re
import math
import subprocess
import random


def build_input(file_name, coordinates, parameter_list, parameter_floats):
    p_float = re.compile('\-?\d+\.\d+,?')
    p_eheat = re.compile('EHeat')
    p_EISol = re.compile('EISol')
    f = open(file_name, 'w')
    f.write(coordinates)
    line_number = 0
    parameter_string = ''
    float_count = 0
    for params in parameter_list:
        if params[1] > line_number:
            parameter_string += '\n'
        else:
            parameter_string += ' '
        line_number = params[1]
        if not (re.search(p_eheat, params[0])
                or re.search(p_EISol, params[0])):
            parameter_string += re.sub(p_float, '', params[0])
        else:
            parameter_string += params[0]
        for i in range(float_count, float_count + params[2]):
            if i == float_count:
                parameter_string += str(parameter_floats[i])
            else:
                parameter_string += ',' + str(parameter_floats[i])
        float_count += params[2]

    f.write(parameter_string)
    f.close()


def find_forces(file_name):
    p_float = re.compile('\-?\d+\.\d+,?')
    p_forces = re.compile('\(Hartrees/Bohr\)')
    p_dash = re.compile('---')

    forces = []
    f = open(file_name, 'r')
    force_found = 0
    dash_found = 0
    for line in f:
        if re.search(p_forces, line):
            force_found = 1
        if re.search(p_dash, line) and force_found == 1:
            dash_found += 1
        if force_found == 1 and dash_found < 2:
            m = re.findall(p_float, line)
            for element in m:
                forces.append(float(element))
    f.close()
    return forces


def find_ground_energy(file_name):
    p_float = re.compile('\-?\d+\.\d+,?')
    p_ground = re.compile('SCF Done')
    f = open(file_name, 'r')
    ground_energy = 0
    for line in f:
        if re.search(p_ground, line):
            m = re.findall(p_float, line)
            ground_energy = float(m[0])
    f.close()
    return ground_energy


def find_energies(file_name):
    p_float = re.compile('\-?\d+\.\d+,?')
    p_excited = re.compile('Excited\s*State')
    f = open(file_name, 'r')
    energies = []
    for line in f:
        if re.search(p_excited, line):
            m = re.findall(p_float, line)
            energies.append(float(m[0]))
    return energies

'''
 Use the fitness value from the original files,
 they will be used to normalize. If applying to the original
 file, simply ignore the last argument
 '''


def find_fitness(am1_file_name, dft_file_name, initial="initial"):
    am1_forces = find_forces(am1_file_name)
    dft_forces = find_forces(dft_file_name)
    am1_ground = find_ground_energy(am1_file_name)
    dft_ground = find_ground_energy(dft_file_name)
    am1_energies = find_energies(am1_file_name)
    dft_energies = find_energies(dft_file_name)
    raw_values = []

    force_fitness = 0.0
    for i, element in enumerate(am1_forces):
        difference = element - dft_forces[i]
        force_fitness += math.pow(difference, 2)
    raw_values.append(force_fitness)

    if initial == "initial":
        raw_values.append(am1_ground - dft_ground)
    else:
        i = len(raw_values)
        x = initial[i] - (am1_ground - dft_ground)
        ground_fitness = 1/(1-x)
        if ground_fitness > 0:
            raw_values.append(ground_fitness)
        else:
            raw_values.append(10000)

    energy_fitness = 0.0
    for i, element in enumerate(am1_energies):
        difference = element - dft_energies[i]
        energy_fitness += math.pow(difference, 2)
    raw_values.append(energy_fitness)

    if initial == "initial":
        return raw_values
    else:
        fitness_value = 0.0
        for i, _ in enumerate(initial):
            fitness_value += raw_values[i]/(initial[i] * len(initial))
        return fitness_value


def perturb_parameters(p_floats, mutation_rate, percent_change):
    pertubed_values = []
    for element in p_floats:
        if random.uniform(0, 1) < mutation_rate:
            low_value = (1 - percent_change) * element
            high_value = (1 + percent_change) * element
            random_value = random.uniform(low_value, high_value)
            pertubed_values.append(random_value)
        else:
            pertubed_values.append(element)
    return pertubed_values


def run_gaussian(file_name):
    p_segfault = re.compile('segmentation')
    input_file = file_name + '.com'
    output_file = file_name + '.log'
    proc = subprocess.Popen(['g09', input_file, output_file],
                            stderr=subprocess.PIPE,)
    stdout_value = proc.communicate()[1]
    if re.search(p_segfault, str(stdout_value)):
        return 'Fail'
    else:
        return stdout_value


def mutate(job_data, thread_number):
    print('Beginning thread:', thread_number)
    current_p_floats = job_data.current_best[thread_number].p_floats
    current_parameters = job_data.current_best[thread_number].params
    coordinates = job_data.original_am1.coordinates
    current_fitness = find_fitness(job_data.original_am1.output_file,
                                   job_data.dft_output, job_data.raw_fitness)
    current_file = job_data.file_name + 'AM1Test_' + str(thread_number)
    for i in range(job_data.number_steps):
        p_floats = perturb_parameters(current_p_floats, job_data.mutation_rate,
                                      job_data.percent_change)
        build_input(current_file + '.com', coordinates, current_parameters,
                    p_floats)
        run_gaussian(current_file)
        fitness = find_fitness(current_file+'.log', job_data.dft_output,
                               job_data.raw_fitness)
        if fitness < current_fitness and fitness != 0:
            current_fitness = fitness
            current_p_floats = p_floats
            print(current_fitness)
    best_file = 'best_input' + str(thread_number)
    build_input(best_file + '.com', coordinates, current_parameters,
                current_p_floats)
    run_gaussian(best_file)
    job_data.current_best_fitness[thread_number] = current_fitness
    job_data.current_best[thread_number].p_floats = current_p_floats
