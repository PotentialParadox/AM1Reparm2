import re
from threader import Thread
from gene import Gene
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
            if not re.search(p_eheat, params[0]):
                # or re.search(p_EISol, params[0])):
                parameter_string += re.sub(p_float, '', params[0])
            else:
                parameter_string += params[0]
            for i in range(float_count, float_count + params[2]):
                if i == float_count:
                    parameter_string += '{0:f}'.format(parameter_floats[i])
                else:
                    parameter_string += ',' \
                        + '{0:f}'.format(parameter_floats[i])
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


def find_force_fitness(job_data, initial, group):
    total_fitness = 0
    if initial:
        for i in range(job_data.ngeom):
            AM1_file = job_data.file_name + "AM1_" + str(i) + ".log"
            DFT_file = job_data.file_name + "DFT_" + str(i) + ".log"
            AM1_forces = find_forces(AM1_file)
            DFT_forces = find_forces(DFT_file)
            element_fitness = 0
            for j, k in enumerate(AM1_forces):
                element_fitness += pow(k - DFT_forces[j], 2)
            if len(AM1_forces) == len(DFT_forces):
                total_fitness += element_fitness
            else:
                total_fitness += 99999
    else:
        for i in range(job_data.ngeom):
            AM1_file = job_data.file_name + "AM1_" + str(i) \
                + "P" + str(group) + ".log"
            DFT_file = job_data.file_name + "DFT_" + str(i) + ".log"
            AM1_forces = find_forces(AM1_file)
            DFT_forces = find_forces(DFT_file)
            element_fitness = 0
            for j, k in enumerate(AM1_forces):
                element_fitness += pow(k - DFT_forces[j], 2)
            if len(AM1_forces) == len(DFT_forces):
                total_fitness += element_fitness
            else:
                total_fitness += 99999
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


def find_energy_fitness(job_data, initial, group):
    if initial:
        total_fitness = 0
        for i in range(job_data.ngeom):
            AM1_file = job_data.file_name + "AM1_" + str(i) + ".log"
            DFT_file = job_data.file_name + "DFT_" + str(i) + ".log"
            AM1_energies = find_energies(AM1_file)
            DFT_energies = find_energies(DFT_file)
            element_fitness = 0
            for j, k in enumerate(AM1_energies):
                element_fitness += pow(k - DFT_energies[j], 2)
            if len(AM1_energies) == len(DFT_energies):
                total_fitness += element_fitness
            else:
                total_fitness += 99999
        return total_fitness
    else:
        total_fitness = 0
        for i in range(job_data.ngeom):
            AM1_file = job_data.file_name + "AM1_" + str(i) \
                + "P" + str(group) + ".log"
            DFT_file = job_data.file_name + "DFT_" + str(i) + ".log"
            AM1_energies = find_energies(AM1_file)
            DFT_energies = find_energies(DFT_file)
            element_fitness = 0
            for j, k in enumerate(AM1_energies):
                element_fitness += pow(k - DFT_energies[j], 2)
            if len(AM1_energies) == len(DFT_energies):
                total_fitness += element_fitness
            else:
                total_fitness += 99999
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


def find_ground_fitness(job_data, initial, group):
    if initial:
        # In order to keep scale, we measure the energies as
        # the value away from their averages
        averageAM1 = 0
        averageDFT = 0
        for i in range(job_data.ngeom):
            AM1_file = job_data.file_name + "AM1_" + str(i) + ".log"
            DFT_file = job_data.file_name + "DFT_" + str(i) + ".log"
            averageAM1 += find_ground_energy(AM1_file)/job_data.ngeom
            averageDFT += find_ground_energy(DFT_file)/job_data.ngeom
        AM1Energies = []
        DFTEnergies = []
        for i in range(job_data.ngeom):
            AM1_file = job_data.file_name + "AM1_" + str(i) + ".log"
            DFT_file = job_data.file_name + "DFT_" + str(i) + ".log"
            AM1Energies.append(find_ground_energy(AM1_file) - averageAM1)
            DFTEnergies.append(find_ground_energy(DFT_file) - averageDFT)
        totalFitness = 0
        for i in range(job_data.ngeom):
            totalFitness += pow(AM1Energies[i] - DFTEnergies[i], 2)
        if totalFitness == 0:
            totalFitness = 1000
        return totalFitness
    else:
        averageAM1 = 0
        averageDFT = 0
        for i in range(job_data.ngeom):
            AM1_file = job_data.file_name + "AM1_" + str(i) \
                + "P" + str(group) + ".log"
            DFT_file = job_data.file_name + "DFT_" + str(i) + ".log"
            averageAM1 += find_ground_energy(AM1_file)/job_data.ngeom
            averageDFT += find_ground_energy(DFT_file)/job_data.ngeom
        AM1Energies = []
        DFTEnergies = []
        for i in range(job_data.ngeom):
            AM1_file = job_data.file_name + "AM1_" + str(i) \
                + "P" + str(group) + ".log"
            DFT_file = job_data.file_name + "DFT_" + str(i) + ".log"
            AM1Energies.append(find_ground_energy(AM1_file) - averageAM1)
            DFTEnergies.append(find_ground_energy(DFT_file) - averageDFT)
        totalFitness = 0
        for i in range(job_data.ngeom):
            totalFitness += pow(AM1Energies[i] - DFTEnergies[i], 2)
        if totalFitness == 0:
            totalFitness = 1000
        return totalFitness


# Use the fitness value from the original files,
# they will be used to normalize. If applying to the original
# file, simply ignore the last argument
def find_fitness(job_data, initial=False, group=0):
    fout = open(job_data.file_name + ".out", "a")
    if initial:
        raw_fitness = []
        raw_fitness.append(find_force_fitness(job_data, initial, group))
        raw_fitness.append(find_ground_fitness(job_data, initial, group))
        raw_fitness.append(find_energy_fitness(job_data, initial, group))
        fout.write('updating raw_fitness ')
        fout.write(str(raw_fitness)+"\n")
        job_data.raw_fitness = raw_fitness
        # fout.write(str(raw_fitness[0]/job_data.raw_fitness[0])+"\n")
    else:
        raw_fitness = []
        raw_fitness.append(find_force_fitness(job_data, initial, group))
        raw_fitness.append(find_ground_fitness(job_data, initial, group))
        raw_fitness.append(find_energy_fitness(job_data, initial, group))
        fitness = 0
        num_fitness_params = len(raw_fitness)
        # fout.write(str(num_fitness_params) + "\n")
        # fout.write(str(job_data.raw_fitness) + "\n")
        # fout.write(str(raw_fitness[0]) + " " + str(raw_fitness[1]) + "\n")
        weights = [10, 1, 5]
        normalizer = sum(weights)
        if len(raw_fitness) == len(job_data.raw_fitness):
            for i in range(num_fitness_params):
                fitness += (raw_fitness[i] * weights[i] / job_data.raw_fitness[i]) \
                    / normalizer
        else:
            # fout.write("Gaussian Failure Found")
            fitness = 1000
        for i in range(len(raw_fitness)):
            raw_fitness[i] = raw_fitness[i] / job_data.raw_fitness[i]
        return (fitness, raw_fitness)
    fout.close()


def perturb_parameters(p_floats, mutation_rate, percent_change):
    pertubed_values = []
    for element in p_floats:
        if random.uniform(0, 1) < mutation_rate:
            # low_value = (1 - percent_change) * element
            # high_value = (1 + percent_change) * element
            # random_value = random.uniform(low_value, high_value)
            stdev = element * percent_change
            random_value = random.gauss(element, stdev)
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
        fout.write("Gaussian Failure")
    DFT_file_name = job_data.file_name + "DFT_" + str(geometry_number)
    fout.write('running ' + DFT_file_name + '\n')
    result = run_gaussian(DFT_file_name)
    if result == 'fail':
        fout.write("Gaussian Failure")
    fout.close()
    return 0


def mutate(job_data, geometry_number, group):
    fout = open(job_data.file_name + ".out", "a")
    file_name = job_data.file_name + "AM1_" + str(geometry_number) \
        + "P" + str(group)
    # fout.write('running' + file_name + '\n')
    gausReturn = run_gaussian(file_name)
    fout.close()
    return gausReturn


def duplicate_geometries(job_data):
    ngeom = job_data.ngeom
    population = job_data.population
    for i in range(ngeom):
        for j in range(population):
            am1O = job_data.file_name + "AM1_" + str(i) + ".com"
            am1C = job_data.file_name + "AM1_" + str(i) \
                + "P" + str(j) + ".com"
            subprocess.call(["cp", am1O, am1C])
    return 0


# Split the population into the elites, who can clone themselves, abiet
# with minor mutations and the peasants, who must fight to the
# death to determine who remains
def wealthGap(job_data, popfits):
    nElites = job_data.elites
    sortedPop = sorted(popfits, key=lambda x: x[1])
    # Determine the elites
    elites = sortedPop[:nElites]
    peasants = sortedPop[nElites:]
    return (elites, peasants)


# The elite clone themselves, but it backfires, and the slightly mutated
# clones attempt to kill their creators. Only the strongest survive.
def clone(job_data, elites):
    new_elites = elites
    print("Old Elite")
    print(new_elites)
    print("************")
    for i, p in enumerate(elites):
        gene_0 = job_data.genes[p[0]][0]
        old_fitness = p[1]
        mutation_rate = job_data.mutation_rate * 2
        percent_change = job_data.percent_change / 5
        perturbed_values = perturb_parameters(gene_0.p_floats,
                                              mutation_rate,
                                              percent_change)
        for g in range(job_data.ngeom):
            file_name = job_data.file_name + "AM1_" + str(g) \
                + "P" + str(p[0])
            gene = job_data.genes[p[0]][g]
            build_input(file_name + ".com", gene.header,
                        gene.coordinates, gene.params, perturbed_values)
            job_data.genes[p[0]][g] = Gene(file_name)
        # Run the jobs in parallel
        evThread = Thread(job_data)
        evThread.thread_evolve(job_data, p[0])
        (fitness, raw_fitness) = find_fitness(job_data, False, p[0])
        # Either the clone or host survives
        if fitness > old_fitness:
            job_data.genes[p[0]][0] = gene_0
            for g in range(job_data.ngeom):
                file_name = job_data.file_name + "AM1_" + str(g) \
                    + "P" + str(p[0])
                gene = job_data.genes[p[0]][g]
                build_input(file_name + ".com", gene.header,
                            gene.coordinates, gene.params, gene.p_floats)
                job_data.genes[p[0]][g] = Gene(file_name)
        else:
            new_elites[i] = (p[0], fitness)
    print("New Elites")
    print(new_elites)
    print("***********")
    return sorted(new_elites, key=lambda x: x[1])


# Converts the array of population fitnesses into an
# array corresponding to the chance of survial
# [0, %chance of P0, %chance of P1, ... 1-%chance of PN]
def fit2Survival(pop):
    normalizer = 0
    for p in pop:
        normalizer += 1/pow(p, 3)
    rankings = [0]
    for i in range(len(pop) - 1):
        chance = (1 / (pow(pop[i], 3))) / normalizer
        rankings.append(chance + rankings[i])
    return rankings


# Peasant fight for surivor, randomly select the survivors
# weighted by their fitness
def survivor(job_data, peasants):
    pop = []
    for p in peasants:
        pop.append(p[1])
    nSurvivors = int(len(pop)*job_data.survival_chance)
    rankings = fit2Survival(pop)
    survivors = []
    for i in range(nSurvivors):
        found = False
        while not found:
            r = random.uniform(0, 1)
            for j, p in enumerate(rankings):
                if p >= r and peasants[j-1] not in survivors:
                    survivor = peasants[j-1]
                    survivors.append(survivor)
                    found = True
                    break
            if not found and (len(rankings)-1) not in survivors:
                survivor = peasants[len(rankings)-1]
                survivors.append(survivor)
                found = True
    return sorted(survivors, key=lambda x: x[1])


# Mixe the parameters from population a and population b
def mate(job_data, a, b):
    pFloatsA = job_data.genes[a][0].p_floats
    pFloatsB = job_data.genes[b][0].p_floats
    new_p_floats = []
    for i in range(len(pFloatsA)):
        r = random.randint(0, 1)
        if r == 0:
            new_p_floats.append(pFloatsA[i])
        else:
            new_p_floats.append(pFloatsB[i])
    return new_p_floats


def select_parent(parents):
    selected = 0
    pop = []
    for p in parents:
        pop.append(p[1])
    rankings = fit2Survival(pop)
    r = random.uniform(0, 1)
    for i, rank in enumerate(rankings):
        if rank >= r:
            selected = i - 1
            break
    return selected


# Let the populations breed with one another to create a new
# generation
def breed(job_data, elites, peasants):
    new_genes = []
    parents = elites + peasants
    print("Parents")
    print(parents)
    print("************")
    # The elite get to pass their genes directly
    for e in elites:
        file_name = job_data.genes[e[0]][0].file_name
        # file_name = 'test'
        gene = Gene(file_name)
        new_genes.append(gene)
    # Now let everyone randomly mate with one another,
    # using the fitness as the chance of mating
    for i in range(job_data.population - job_data.elites):
        file_name = job_data.genes[0][0].file_name
        gene = Gene(file_name)
        r1 = select_parent(parents)
        different = False
        while not different:
            r2 = select_parent(parents)
            if r2 != r1:
                different = True
        parent1 = parents[r1]
        parent2 = parents[r2]
        p_floats = mate(job_data, parent1[0], parent2[0])
        gene.p_floats = p_floats
        new_genes.append(gene)
    # Update the naming
    for i, n in enumerate(new_genes):
        n.file_name = job_data.file_name + "AM1_0P" + str(i)
        build_input(n.file_name + ".com", n.header, n.coordinates,
                    n.params, n.p_floats)
    for i in range(job_data.population):
        file_name = job_data.file_name + "AM1_0P" + str(i)
        job_data.genes[i][0] = Gene(file_name)


# Optimize the best gene
def runBest(job_data):
    gene = job_data.best_gene
    bestInput = job_data.file_name + "BestInput.com"
    build_input(bestInput, gene.header,
                gene.coordinates, gene.params, gene.p_floats)
    fin = open(bestInput, "r")
    p_firstLine = re.compile('#P')
    inputString = ""
    for line in fin:
        # Modify the first line
        if re.search(p_firstLine, line):
            optHeader = '#P AM1(Input,print) Opt Freq\n'
            inputString += optHeader
        else:
            inputString += line
    fin.close()
    fout = open(bestInput, 'w')
    fout.write(inputString)
    fout.close()
    run_gaussian(job_data.file_name + "BestInput")
    subprocess.call(["rm", bestInput])


# Delete the obsolete files
def cleanup(job_data):
    ngeom = job_data.ngeom
    npop = job_data.population
    # Original Files
    for i in range(ngeom):
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
    # GA Files
        for j in range(npop):
            am1 = job_data.file_name + "AM1_" + str(i) \
                + "P" + str(j)
            inputAM1 = am1 + ".com"
            outputAM1 = am1 + ".log"
            subprocess.call(["rm", inputAM1])
            subprocess.call(["rm", outputAM1])
