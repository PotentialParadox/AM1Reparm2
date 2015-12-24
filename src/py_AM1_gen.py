from job_data import Job
from gene import Gene
import genetic_tools as gt
from threader import Thread
import time


def run_genetic_algorithm(job_data):
    fout = open(job_data.file_name + ".out", "w")
    fout.write('*********** Running Genetic Algorithm ***********\n')
    fout.close()

    # Build and run the original geometries and parameters
    gt.build_geometries(job_data)
    initialRun = Thread(job_data)
    initialRun.thread_init(job_data)

    # Find the original fitnesses and store for reference
    gt.find_fitness(job_data, initial=True)

    # Create init files for each population
    gt.duplicate_geometries(job_data)
    job_data.init_genes()

    best_fitness = 1
    # Run number_steps of generations
    for i in range(job_data.number_steps):
        fout = open(job_data.file_name + ".out", "a")
        fout.write("Starting Step " + str(i) + "\n")
        # For each member of the population, mutate the parameters
        # run gaussian and store fitness.
        populationFitnesses = []
        for p in range(job_data.population):
            # Build mutated genes
            # The gene_0 term is used to make sure all the geometries
            # have the same mutations withing a group.
            # There will be at least one gene_0, so we are using that
            # as a p_float updater
            gene_0 = job_data.genes[p][0]
            if p >= job_data.elites:
                perturbed_values = gt.perturb_parameters(gene_0.p_floats, \
                    job_data.mutation_rate, job_data.percent_change)
            else:
                perturbed_values = gene_0.p_floats
            for g in range(job_data.ngeom):
                file_name = job_data.file_name + "AM1_" + str(g) \
                    + "P" + str(p)
                gene = job_data.genes[p][g]
                gt.build_input(file_name + ".com", gene.header,
                               gene.coordinates, gene.params, perturbed_values)
                job_data.genes[p][g] = Gene(file_name)
            # Run the jobs in parallel
            evThread = Thread(job_data)
            evThread.thread_evolve(job_data, p)
            (fitness, raw_fitness) = gt.find_fitness(job_data, False, p)
            if fitness < best_fitness:
                best_fitness = fitness
                fout.write("New Best Found "
                           + ": " + str(fitness) + "\n")
                fout.write("With raw values: " + str(raw_fitness) + "\n")
                job_data.best_gene = job_data.genes[p][0]
            populationFitnesses.append((p, fitness))
        fitnessValues = []
        for v in populationFitnesses:
            fitnessValues.append(v[1])
        average_fit = sum(fitnessValues)/len(fitnessValues)
        fout.write("AVERAGE FITNESS: " + str(average_fit) + "\n")
        print("AVERAGE FITNESS: " + str(average_fit))
        # Both elites and peasant are tuples of (popIndex, fitness)
        print("Population")
        print(populationFitnesses)
        print("**********")
        (elites, peasants) = gt.wealthGap(job_data, populationFitnesses)
        elites = gt.clone(job_data, elites)
        peasants = gt.survivor(job_data, peasants)
        gt.breed(job_data, elites, peasants)
        fout.close()


start = time.time()
file_name = 'Furan'
ji = Job(file_name, number_steps=10, ngeom=4, nproc=4,
         mutation_rate=.10, percent_change=.20, geo_prtb=0.025, population=12,
         survival_chance=0.50, elites=2)
run_genetic_algorithm(ji)
fout = open(file_name + '.out', 'a')
fout.write('Optimize best\n')
gt.runBest(ji)
fout.write('Cleaning up\n')
gt.cleanup(ji)
fout.write('Run time:' + str(time.time() - start))
