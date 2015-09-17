import re
import subprocess
import multiprocessing
import math
import random
import os.path
import numpy as np
import matplotlib.pyplot as plt
import time

def read_coordinates(file_name):
    # Patterns
    p_blank = re.compile('^\s*$')
    p_float = re.compile('\-?\d+\.\d+')
    p_integer = re.compile("\\b(\d)\s")
    blank_count = 0
    lines = ''
    f = open(file_name, 'r')
    for line  in f:
        if blank_count < 3:
            lines += line
        if re.search(p_blank, line):
            blank_count += 1
        if blank_count == 3:
            break
    f.close()
    lines = lines[:-1]
    return lines

# read_parameters returns a list of [parameter word, line_number, and number of float parameters]
def read_parameters(file_name):
    # Patterns
    p_blank = re.compile('^\s*$')
    p_param = re.compile('\S+')
    p_float = re.compile('\-?\d+\.\d+')
    p_element = re.compile('(\S+)\-?\d+\.\d+')

    blank_count = 0
    am1_params = []
    f = open(file_name, 'r')
    for i, line in enumerate(f):
        if re.search(p_blank, line):
            blank_count += 1
        if blank_count >= 3:
            m = re.findall(p_param, line)
            for element in m:
                l_floats = re.findall(p_float, element)
                am1_params.append([element, i, len(l_floats)])
    return am1_params

def extract_floats(am1_parameters):
    # Patterns
    p_float = re.compile('\-?\d+\.\d+')

    parameter_floats = []
    for parameter in am1_parameters:
        if parameter[2] > 0:
            m = re.findall(p_float, parameter[0])
            for element in m:
                parameter_floats.append(float(element))

    return parameter_floats

def build_input(file_name, coordinates, parameter_list, parameter_floats):
    p_float = re.compile('\-?\d+\.\d+,?')
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
        parameter_string += re.sub(p_float, '', params[0])
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
    return forces

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

# Use the fitness value from the original files, they will be used to normalize. If applying to the original
# file, simply put 0 for both
def find_fitness(am1_file_name, dft_file_name, initial="initial"):
    am1_forces = find_forces(am1_file_name)
    dft_forces = find_forces(dft_file_name)
    am1_energies = find_energies(am1_file_name)
    dft_energies = find_energies(dft_file_name)
    raw_values = []

    force_fitness = 0
    for i, element in enumerate(am1_forces):
        difference = element - dft_forces[i]
        force_fitness += math.pow(difference, 2)
    raw_values.append(force_fitness)

    energy_fitness = 0
    for i, element in enumerate(am1_energies):
        difference = element - dft_energies[i]
        energy_fitness += math.pow(difference, 2)
    raw_values.append(energy_fitness)

    if initial == "initial":
        return raw_values
    else:
        fitness_value = 0
        for i, _ in enumerate(initial):
            fitness_value += raw_values[i]/(initial[i] * len(initial))
        return fitness_value

def perturb_parameters(parameters, mutation_rate, percent_change):
    pertubed_values = []
    for element in parameters:
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
    output_file = file_name + str(i) + '.log'
    proc = subprocess.Popen(['g09', input_file, output_file], stderr=subprocess.PIPE,)
    stdout_value = proc.communicate()[1]
    if re.search(p_segfault, str(stdout_value)):
        return 'Fail'
    else:
        return stdout_value

def run_genetic_algorithm(file_name, number_steps, mutation_rate, percent_change):
    print('*********** Running Genetic Algorithm ***********')

    # Read and run the initial AM1 file
    am1_orginal = file_name + 'AM1'
    am1_input_file = am1_orginal + '.com'
    coordinates = read_coordinates(am1_input_file)
    initial_am1_params = read_parameters(am1_input_file)
    initial_gene = extract_floats(initial_am1_params)
    run_gaussian(am1_orginal)
    print('Original AM1 successfully loaded')

    # Read and run the initial DFT file
    dft_file = file_name + 'DFT'
    dft_input_file = dft_file + '.com'
    dft_output_file = dft_file + '.log'
    if not os.path.isfile('./' + dft_output_file):
        run_gaussian(dft_file)
    else:
        print('DFT.log file already found and is being loaded.\n'
              '"If this is unintentional, please delete the current log file"')
    print('DFT file successfully loaded')

    # Determining the initial fitness
    am1_output_file = am1_orginal + '.log'
    raw_fitness = find_fitness(am1_output_file, dft_output_file)

    # Begin loop
    current_best_gene = initial_gene
    current_best_fitness = find_fitness(am1_output_file, dft_output_file, raw_fitness)
    fitness_record = []
    print('Current fitness is:', current_best_fitness)
    for i, _ in enumerate(range(0, number_steps)):
        new_gene = perturb_parameters(current_best_gene, mutation_rate, percent_change)
        new_file = file_name + 'AM1Test'
        build_input(new_file + '.com', coordinates, initial_am1_params, new_gene)
        if run_gaussian(new_file) == 'Fail':
            print('Gaussian Failed to run')
        else:
            p_success = re.compile('Normal termination')
            output = new_file + '.log'
            f = open(output, 'r').read()
            if re.search(p_success, f):
                fitness = find_fitness(output, dft_output_file, raw_fitness)
                if fitness < current_best_fitness:
                    print('New fitness:', fitness)
                    record = [i, fitness]
                    fitness_record.append(record)
                    current_best_fitness = fitness
                    current_best_gene = new_gene
    build_input('best_input.com', coordinates, initial_am1_params, current_best_gene)
    run_gaussian('best_input')
    return fitness_record


def genetic_thread_loop(file_name, dft_output_file, params, coordinates, inital_gene, initial_best_fitness,
                        mutation_rate, percent_change, iterations, raw_fitness):
    current_best_gene = inital_gene
    current_best_fitness = 1
    thread_fitness_record = []
    for i in range(iterations):
        new_gene = perturb_parameters(inital_gene, mutation_rate, percent_change)
        new_file = file_name + 'AM1Test'
        build_input(new_file + '.com', coordinates, params, new_gene)
        if run_gaussian(new_file) == 'Fail':
            print('Gaussian Failed to run')
        else:
            p_success = re.compile('Normal termination')
            output = new_file + '.log'
            f = open(output, 'r').read()
            if re.search(p_success, f):
                fitness = find_fitness(output, dft_output_file, raw_fitness)
                if fitness < current_best_fitness:
                    print('New fitness:', fitness)
                    record = [i, fitness]
                    thread_fitness_record.append(record)
                    current_best_fitness = fitness
                    current_best_gene = new_gene
    build_input('best_input.com', coordinates, params, current_best_gene)
    run_gaussian('best_input')
    print(thread_fitness_record)


if __name__ == '__main__':
jobs = []
start = time.time()
for i in range(100):
    p = multiprocessing.Process(target=genetic_thread_loop, args=('FuranAM1', 'FuranDFT.log', ))
    jobs.append(p)
    if i%10 == 0:
        print(i)
    p.start()
end = time.time()
print(end - start)

'''
history = run_genetic_algorithm('Furan', 100, 0.1, 0.2)
record_history = np.array(history)
plt.plot(record_history[:,0], record_history[:,1], '-o')
plt.show()
'''



