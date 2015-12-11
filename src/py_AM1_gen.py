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

    # Run number_steps of generations
    for i in range(job_data.number_steps):
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
            perturbed_values = gt.perturb_parameters(gene_0.p_floats,
                                                     job_data.mutation_rate,
                                                     job_data.percent_change)
            for g in range(job_data.ngeom):
                file_name = job_data.file_name + "AM1_" + str(g) \
                    + "P" + str(p)
                gene = job_data.genes[p][g]
                gt.build_input(file_name + ".com", gene.header,
                               gene.coordinates, gene.params, perturbed_values)
                job_data.genes[p][g] = Gene(file_name)
            # Run the jobs in parallel
            fout = open(job_data.file_name + ".out", "a")
            evThread = Thread(job_data)
            evThread.thread_evolve(job_data, p)
            fitness = gt.find_fitness(job_data, False, p)
            fout.write("Finished parameter set " + str(p) + " Fitness: "
                       + str(fitness) + "\n")
            populationFitnesses.append(fitness)
            fout.close()
        survivors = gt.survivor(job_data, populationFitnesses)
        gt.breed(job_data, survivors)


start = time.time()
file_name = 'Furan'
ji = Job(file_name, number_steps=50, ngeom=4, nproc=4,
         mutation_rate=.10, percent_change=.15, geo_prtb=0.05, population=32,
         survival_chance=0.25)
run_genetic_algorithm(ji)
# fout = open(file_name + '.out', 'a')
# fout.write('Cleaning up and creating optimized bests\n')
# gt.cleanup(ji)
# fout.write('Run time:' + str(time.time() - start))
