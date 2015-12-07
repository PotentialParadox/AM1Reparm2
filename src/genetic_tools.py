import re
# from gene import Gene
import subprocess
import random


def build_input(file_name, header, coordinates,
                parameter_list, parameter_floats, dft="No"):
    p_float = re.compile('\-?\d+\.\d+,?')
    p_eheat = re.compile('EHeat')
    p_EISol = re.compile('EISol')
    f = open(file_name, 'w')
    f.write(header)
    f.write(coordinates[0])
    for i, j in enumerate(coordinates[1]):
        s_coordinates = str(int(j))
        if coordinates[2][i*3] < 0:
            s_coordinates += 7 * " " + "{0:.6f}".format(coordinates[2][i*3])
        else:
            s_coordinates += 8 * " " + "{0:.6f}".format(coordinates[2][i*3])
        if coordinates[2][i*3 + 1] < 0:
            s_coordinates += 4 * " " + "{0:.6f}".format(coordinates[2][i*3+1])
        else:
            s_coordinates += 5 * " " + "{0:.6f}".format(coordinates[2][i*3+1])
        if coordinates[2][i*3 + 2] < 0:
            s_coordinates += 4 * " " + "{0:.6f}".format(coordinates[2][i*3+2])
        else:
            s_coordinates += 5 * " " + "{0:.6f}".format(coordinates[2][i*3+2])
        s_coordinates += '\n'
        f.write(s_coordinates)
    if dft == "No":
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
                    parameter_string += '{0:f}'.format(parameter_floats[i])
                else:
                    parameter_string += ',' + '{0:f}'.format(parameter_floats[i])
            float_count += params[2]

        f.write(parameter_string)
    f.write("\n\n")
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


def find_force_fitness(job_data):
    total_fitness = 0
    for i in range(job_data.ngeom):
        AM1_file = job_data.file_name + "AM1_" + str(i) + ".log"
        DFT_file = job_data.file_name + "DFT_" + str(i) + ".log"
        AM1_forces = find_forces(AM1_file)
        DFT_forces = find_forces(DFT_file)
        element_fitness = 0
        for j, k in enumerate(AM1_forces):
            element_fitness += pow(k - DFT_forces[j], 2)
        total_fitness += element_fitness
    return total_fitness


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


def find_energy_fitness(job_data):
    total_fitness = 0
    for i in range(job_data.ngeom):
        AM1_file = job_data.file_name + "AM1_" + str(i) + ".log"
        DFT_file = job_data.file_name + "DFT_" + str(i) + ".log"
        AM1_energies = find_energies(AM1_file)
        DFT_energies = find_energies(DFT_file)
        element_fitness = 0
        for j, k in enumerate(AM1_energies):
            element_fitness += pow(k - DFT_energies[j], 2)
        total_fitness += element_fitness
    return total_fitness


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


def find_ground_fitness(job_data):
    average_difference = 0
    for i in range(job_data.ngeom):
        AM1_file = job_data.file_name + "AM1_" + str(i) + ".log"
        DFT_file = job_data.file_name + "DFT_" + str(i) + ".log"
        AM1_energy = find_ground_energy(AM1_file)
        DFT_energy = find_ground_energy(DFT_file)
        average_difference += (AM1_energy - DFT_energy) / job_data.ngeom
    total_fitness = 0
    for i in range(job_data.ngeom):
        AM1_file = job_data.file_name + "AM1_" + str(i) + ".log"
        DFT_file = job_data.file_name + "DFT_" + str(i) + ".log"
        AM1_energy = find_ground_energy(AM1_file)
        DFT_energy = find_ground_energy(DFT_file)
        total_fitness += pow((AM1_energy - DFT_energy) - average_difference, 2)
    return total_fitness


# Use the fitness value from the original files,
# they will be used to normalize. If applying to the original
# file, simply ignore the last argument
def find_fitness(job_data, initial="no"):
    fout = open(job_data.file_name + ".out", "a")
    raw_fitness = []
    # raw_fitness.append(find_force_fitness(job_data))
    raw_fitness.append(find_ground_fitness(job_data))
    raw_fitness.append(find_energy_fitness(job_data))
    if initial == "yes":
        fout.write('updating raw_fitness ')
        fout.write(str(raw_fitness)+"\n")
        job_data.raw_fitness = raw_fitness
        # fout.write(str(raw_fitness[0]/job_data.raw_fitness[0])+"\n")
    else:
        fitness = 0
        num_fitness_params = len(raw_fitness)
        # fout.write(str(raw_fitness[0])+"\n")
        if len(raw_fitness) == len(job_data.raw_fitness):
            for i in range(num_fitness_params):
                fitness += (raw_fitness[i] / job_data.raw_fitness[i]) \
                    / num_fitness_params
        else:
            fout.write("Gaussian Failure Found")
            fitness = 1000
        return fitness
    fout.close()


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


def build_geometries(job):
    original = job.original_am1
    for i in range(job.ngeom):
        perturbed_values = []
        for element in original.coordinates[2]:
            low_value = element - job.geo_prtb
            high_value = element + job.geo_prtb
            random_value = random.uniform(low_value, high_value)
            perturbed_values.append(random_value)
        old_spin = original.coordinates[0]
        old_av = original.coordinates[1]
        new_gemetry = perturbed_values
        new_coordinates = (old_spin, old_av, new_gemetry)
        job.coordinates.append(new_coordinates)
        file_name = original.file_name + "_" + str(i) + ".com"
        dft_name = job.original_dft + "_" + str(i) + ".com"
        build_input(file_name, original.header, new_coordinates,
                    original.params, original.p_floats)
        build_input(dft_name, job.dft_header, new_coordinates,
                    original.params, original.p_floats, "yes")


def run_gaussian(file_name):
    p_normal = re.compile('Normal termination')
    input_file = file_name + '.com'
    output_file = file_name + '.log'
    proc = subprocess.Popen(['g09', input_file, output_file],
                            stderr=subprocess.PIPE,)
    stdout_value = proc.communicate()[1]
    if re.search(p_normal, str(stdout_value)):
        return stdout_value
    else:
        return 'Fail'


def init_run(job_data, geometry_number):
    fout = open(job_data.file_name + ".out", "a")
    AM1_file_name = job_data.file_name + "AM1_" + str(geometry_number)
    fout.write('running ' + AM1_file_name + '\n')
    result = run_gaussian(AM1_file_name)
    if result == 'fail':
        fout.write("Gaussian Failuer")
    DFT_file_name = job_data.file_name + "DFT_" + str(geometry_number)
    fout.write('running ' + DFT_file_name + '\n')
    result = run_gaussian(DFT_file_name)
    if result == 'fail':
        fout.write("Gaussian Failuer")
    fout.close()
    return 0


def mutate(job_data, geometry_number):
    fout = open(job_data.file_name + ".out", "a")
    file_name = job_data.file_name + "AM1_" + str(geometry_number)
    # fout.write('running' + file_name + '\n')
    gausReturn = run_gaussian(file_name)
    fout.close()
    return gausReturn


def cleanup(job_data):
    ngeom = job_data.ngeom
    for i in range(ngeom):
        # Delete the obsolete files
        am1 = job_data.file_name + "AM1_" + str(i)
        dft = job_data.file_name + "DFT_" + str(i)
        inputAM1 = am1 + ".com"
        outputAM1 = am1 + ".log"
        inputDFT = dft + ".com"
        outputDFT = dft + ".log"
        subprocess.call(["rm", inputAM1])
        subprocess.call(["rm", outputAM1])
        subprocess.call(["rm", inputDFT])
        subprocess.call(["rm", outputDFT])
        # Upload the best input as a string
        bestInput = job_data.file_name + "AM1_" + str(i) + "best.com"
        fin = open(bestInput, 'r')
        p_firstLine = re.compile('#P')
        inputString = ""
        if i < 9:
            for line in fin:
                # Modify the first line
                if re.search(p_firstLine, line):
                    optHeader = '#P AM1(Input,print) Opt Freq\n'
                    inputString += optHeader
                else:
                    inputString += line
            outFile = job_data.file_name + "AM1Best" + str(i) + ".com"
            fout = open(outFile, 'w')
            fout.write(inputString)
        subprocess.call(["rm", bestInput])
    if ngeom > 8:
        ngeom = 8
    for i in range(ngeom):
        result = run_gaussian(job_data.file_name + "AM1Best" + str(i))
        if result == 'fail':
            fout.write("Gaussian Failuer")
