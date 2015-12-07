from job_data import Job
from gene import Gene
import genetic_tools as gt
from threader import Thread
import time


def run_genetic_algorithm(job_data):
    fout = open(job_data.file_name + ".out", "w")
    fout.write('*********** Running Genetic Algorithm ***********\n')
    fout.close()
    gt.build_geometries(job_data)
    job_data.init_genes()
    thread = Thread(job_data)

    # Determine the starting values
    thread.thread_init(job_data)
    gt.find_fitness(job_data, initial="yes")
    fitness = gt.find_fitness(job_data)
    print("Original Fitness: ")
    print(job_data.raw_fitness[0])
    print("\n")

    # Evolve
    best_fitness = 1
    for i in range(job_data.number_steps):
        # Build Mutated Genes
        # The gene_0 term is used to make sure all the geometries
        # have the same mutations, there will be at least one geometry
        # so geom_0 is being used as a p_floats updater
        gene_0 = job_data.geom_genes[0]
        perturbed_values = gt.perturb_parameters(gene_0.p_floats,
                                                 job_data.mutation_rate,
                                                 job_data.percent_change)
        for j in range(job_data.ngeom):
            file_name = job_data.file_name + "AM1_" + str(j)
            gene = job_data.geom_genes[j]
            gt.build_input(file_name + ".com", gene.header, gene.coordinates,
                           gene.params, perturbed_values)

        # Run and Test
        fout = open(job_data.file_name + ".out", "a")
        evThread = Thread(job_data)
        evThread.thread_evolve(job_data)
        fout.write("Finished evolution " + str(i) + ",  finding fitness: ")
        fitness = gt.find_fitness(job_data)
        fout.write(str(fitness) + '\n')
        if fitness < best_fitness:
            best_fitness = fitness
            fout.write('found new best: ' + str(best_fitness) + '\n')
            for j in range(job_data.ngeom):
                file_name = job_data.file_name + "AM1_" + str(j)
                job_data.geom_genes[j] = Gene(file_name)
        fout.close()

    # Create inputs for the best
    for i in range(job_data.ngeom):
        file_name = job_data.file_name + "AM1_" + str(i) + "best.com"
        header = job_data.original_am1.header
        geometry_gene = job_data.geom_genes[i]
        coordinates = geometry_gene.coordinates
        params = geometry_gene.params
        p_floats = geometry_gene.p_floats
        gt.build_input(file_name, header, coordinates,
                       params, p_floats)


start = time.time()
file_name = 'Furan'
ji = Job(file_name, number_steps=50, ngeom=4, nproc=4,
         mutation_rate=.10, percent_change=.10, geo_prtb=0.05)
run_genetic_algorithm(ji)
fout = open(file_name + '.out', 'a')
fout.write('Cleaning up and creating optimized bests\n')
gt.cleanup(ji)
fout.write('Run time:' + str(time.time() - start))
