from job_data import Job
from gene import Gene
import genetic_tools as gt
from threader import Thread
import time


def run_genetic_algorithm(job_data):
    print('*********** Running Genetic Algorithm ***********')
    gt.build_geometries(job_data)
    job_data.init_genes()
    thread = Thread(job_data)

    # Determine the starting values
    thread.thread_init(job_data)
    gt.find_fitness(job_data, initial="yes")
    # fitness = gt.find_fitness(job_data)
    print(job_data.raw_fitness[0])

    # Evolve
    best_fitness = 1
    for i in range(job_data.number_steps):
        thread.thread_evolve(job_data)
        fitness = gt.find_fitness(job_data)
        print(fitness)
        if fitness < best_fitness:
            best_fitness = fitness
            print('found new best', best_fitness)
            for j in range(job_data.ngeom):
                file_name = job_data.file_name + "AM1_" + str(j)
                job_data.geom_genes[j] = Gene(file_name)

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
ji = Job(file_name, number_steps=500, ngeom=4, nproc=4,
         mutation_rate=.10, percent_change=.05, geo_prtb=0.05)
run_genetic_algorithm(ji)
print('Run time:', time.time() - start)
