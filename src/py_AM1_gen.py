from gene import Gene
from job_data import Job
import genetic_tools as gt
import re
import os.path
import numpy as np
import matplotlib.pyplot as plt
import time
import threading
from queue import Queue

def run_genetic_algorithm(job_data):
    print('*********** Running Genetic Algorithm ***********')
    for i in range(job_data.nproc):
        gt.thread_evolve(job_data, i)
    print(job_data.file_name)
    print(job_data.current_best_fitness[0])
    print(job_data.current_best_fitness[1])

file_name = 'Furan'
ji = Job(file_name, number_steps=10, nproc=4)

print_lock = threading.Lock()

def exampleJob(worker, thread_number):
    time.sleep(0.5)
    print(thread_number)

def threader(thread_number):
    while True:
        job_data = q.get()
        gt.thread_evolve(job_data, thread_number)
        q.task_done()

q = Queue()

for x in range(4):
    t = threading.Thread(target = threader, args=(x,))
    t.daemon = True
    t.start()

start = time.time()

for _ in range(4):
    q.put(ji)

q.join()

print('Entire job took:', time.time() - start)





