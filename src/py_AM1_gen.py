from job_data import Job
# from gene import Gene
import genetic_tools as gt
# from threader import Thread
import time


def run_genetic_algorithm(job_data):
    fout = open(job_data.file_name + ".out", "w")
    fout.write('*********** Running Genetic Algorithm ***********\n')
    fout.close()

    # Build and run the original geometries and parameters
    gt.build_geometries(job_data)
    # initialRun = Thread(job_data)
    # initialRun.thread_init(job_data)

    # Find the original fitnesses and store for reference
    # gt.find_fitness(job_data, initial=True)

    # Create init files for each population
    gt.duplicate_geometries(job_data)
    job_data.init_genes()

    # For each member of the population, mutate the parameters
    # run gaussian and store fitness.
    for p in range(job_data.population):
        # Build mutated genes
        # The gene_0 term is used to make sure al the geometries
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
            gt.build_input(file_name + ".com", gene.header, gene.coordinates,
                           gene.params, perturbed_values)


start = time.time()
file_name = 'Furan'
ji = Job(file_name, number_steps=50, ngeom=4, nproc=4,
         mutation_rate=.10, percent_change=.10, geo_prtb=0.05, population=2)
run_genetic_algorithm(ji)
# fout = open(file_name + '.out', 'a')
# fout.write('Cleaning up and creating optimized bests\n')
# gt.cleanup(ji)
# fout.write('Run time:' + str(time.time() - start))
