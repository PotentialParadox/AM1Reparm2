from gene import Gene
from job_data import Job
import genetic_tools as gt
import re
import multiprocessing
import os.path
import numpy as np
import matplotlib.pyplot as plt
import time

def run_genetic_algorithm(file_name, number_steps, mutation_rate, percent_change):
    print('*********** Running Genetic Algorithm ***********')
    ji = Job(file_name, number_steps=10)
    print(ji.original_am1.file_name)
    gt.thread_evolve(ji)
    print(ji.original_am1.file_name)

history = run_genetic_algorithm('Furan', 10, 0.1, 0.2)


