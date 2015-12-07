import re
from gene import Gene


class Job:

    def __init__(self, file_name, number_steps=100,
                 mutation_rate=0.1, percent_change=0.1, nproc=1,
                 ngeom=4, geo_prtb=0.1):
        self.file_name = file_name
        self.original_am1 = Gene(file_name + 'AM1')
        self.original_dft = file_name + 'DFT'
        self.dft_input = file_name + 'DFT.com'
        self.dft_output = file_name + 'DFT.log'
        self.dft_header = self.read_dft_header()
        self.raw_fitness = []
        self.coordinates = []
        self.geom_genes = []
        self.pop_params = []
        self.number_steps = number_steps
        self.mutation_rate = mutation_rate
        self.percent_change = percent_change
        self.nproc = nproc
        self.ngeom = ngeom
        self.geo_prtb = geo_prtb  # percent variation of geometry pertubation
        # Current_best is a list of the best Genes(refer to class)
        # made by the threads

    def init_genes(self):
        for i in range(self.ngeom):
            coord_name = self.file_name + "AM1_" + str(i)
            self.geom_genes.append(Gene(coord_name))

    def read_dft_header(self):
        p_blank = re.compile('^\s*$')
        blank_count = 0
        header_lines = ''
        f = open(self.dft_input, 'r')
        for line in f:
            if blank_count < 2:
                header_lines += line
            if re.search(p_blank, line):
                blank_count += 1
            if blank_count == 2:
                break
        f.close()
        return header_lines
