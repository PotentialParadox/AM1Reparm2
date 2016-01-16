import re
import os.path
from gene import Gene


class Job:

    def __init__(self, file_name, number_steps=100,
                 mutation_rate=0.1, percent_change=0.1, nproc=1,
                 ngeom=4, geo_prtb=0.1, population=1, survival_chance=0.5,
                 elites=0, hl='B3LYP/3-21G', excited_states=10):
        self.hl = hl  # The name of the high level of theory
        self.running_opt = False
        self.excited_states = excited_states
        self.file_name = file_name
        self.original_am1 = Gene(file_name + 'AM1')
        self.original_am1.header = self.set_am1_header()
        self.original_dft = file_name + 'DFT'
        self.dft_input = file_name + 'DFT.com'
        self.dft_output = file_name + 'DFT.log'
        self.dft_header = self.set_dft_header()
        self.raw_fitness = []
        self.coordinates = []
        self.genes = []
        self.pop_params = []
        self.number_steps = number_steps
        self.mutation_rate = mutation_rate
        self.percent_change = percent_change
        self.nproc = nproc
        self.ngeom = ngeom
        self.population = population
        self.survival_chance = survival_chance
        self.best_gene = Gene(file_name + 'AM1')
        self.elites = elites
        self.geo_prtb = geo_prtb  # percent variation of geometry pertubation
        # Current_best is a list of the best Genes(refer to class)
        # made by the threads

    def init_genes(self):
        for i in range(self.population):
            duplicate = []
            for j in range(self.ngeom):
                coord_name = self.file_name + "AM1_" + str(j) \
                    + "P" + str(i)
                duplicate.append(Gene(coord_name))
            self.genes.append(duplicate)

    def check_dft(self):
        if not os.path.exists(self.dft_input):
            return False
        else:
            expected_header = ("#P " + self.hl + " CIS(Singlets,NStates="
                               + self.excited_states + ") pop(full) force")
            p_header = re.compile(expected_header)
            fin = open(self.dft_input, 'r')
            f = fin.read()
            if re.search(p_header, f):
                return True
            else:
                return False

    def set_gene_p_floats(self, i, j, p):
        self.genes[i][j].set_p_floats(p)

    def set_dft_header(self):
        expected_header = ("#P " + self.hl + " CIS(Singlets,NStates="
                           + str(self.excited_states) + ") pop(full) force\n\n"
                           + self.file_name + " at " + self.hl + "\n\n")
        return expected_header

    def set_am1_header(self):
        expected_header = ("#P AM1(Input,print) CIS(Singlets,NStates="
                           + str(self.excited_states) + ") pop(full) force\n\n"
                           + self.file_name + " at AM1\n\n")
        return expected_header
