from job_data import Job
from threader import Thread
import time


def run_genetic_algorithm(job_data):
    print('*********** Running Genetic Algorithm ***********')
    job = Thread(job_data)
    job.thread_evolve(job_data)
    print(job_data.current_best_fitness[0])
    print(job_data.current_best_fitness[1])

start = time.time()
file_name = 'Furan'
ji = Job(file_name, number_steps=100, nproc=2,
         mutation_rate=.10, percent_change=.05)
run_genetic_algorithm(ji)
print('Run time:', time.time() - start)
