import os
from gene import Gene
import genetic_tools as gt

class Job:

    def __init__(self, file_name, number_steps=100,
                 mutation_rate=0.1, percent_change=0.1, nproc=1):
        self.file_name = file_name
        self.original_am1 = Gene(file_name + 'AM1')
        self.original_dft = file_name + 'DFT'
        self.dft_input = file_name + 'DFT.com'
        self.dft_output = file_name + 'DFT.log'
        self.raw_fitness = self.find_raw_fitness()
        self.number_steps = number_steps
        self.mutation_rate = mutation_rate
        self.percent_change = percent_change
        self.nproc = nproc
        # Current_best is a list of the best Genes(refer to class) made by the threads
        self.current_best = self.initialize_current_best_list()
        self.current_best_fitness = self.initialize_current_best_fitness()
        self.fitness_record = []



    def find_raw_fitness(self):
        if not os.path.isfile('./' + self.dft_output):
            gt.run_gaussian(self.original_dft)
        else:
            print('DFT.log file already found and is being loaded.\n'
                  '"If this is unintentional, please delete the current log file"')
        print('DFT file successfully loaded')
        # Determining the initial fitness
        return gt.find_fitness(self.original_am1.output_file, self.dft_output)

    def initialize_current_best_list(self):
        records = []
        for i in range(self.nproc):
            records.append(self.original_am1)
        return records

    def initialize_current_best_fitness(self):
        records = []
        for i in range(self.nproc):
            records.append(1.0)
        return records
