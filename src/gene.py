import re


class Gene:

    def __init__(self, file_name):
        self.file_name = file_name
        self.input_file = file_name + '.com'
        self.output_file = file_name + '.log'
        self.coordinates = self.read_coordinates()
        # Params are the chunks of text including the parameter values,
        # and remains constant throughout the program
        self.params = self.read_parameters()
        # p_floats are the parameter values which will vary among the genes
        self.p_floats = self.extract_floats()


    def read_coordinates(self):
        # Patterns
        p_blank = re.compile('^\s*$')
        p_float = re.compile('\-?\d+\.\d+')
        p_integer = re.compile("\\b(\d)\s")
        blank_count = 0
        lines = ''
        f = open(self.input_file, 'r')
        for line  in f:
            if blank_count < 3:
                lines += line
            if re.search(p_blank, line):
                blank_count += 1
            if blank_count == 3:
                break
        f.close()
        lines = lines[:-1]
        return lines

    # read_parameters returns a list of [parameter word, line_number, and number of float parameters]
    def read_parameters(self):
        # Patterns
        p_blank = re.compile('^\s*$')
        p_param = re.compile('\S+')
        p_float = re.compile('\-?\d+\.\d+')
        p_eheat = re.compile('EHeat')
        p_EISol = re.compile('EISol')

        blank_count = 0
        am1_params = []
        f = open(self.input_file, 'r')
        for i, line in enumerate(f):
            if re.search(p_blank, line):
                blank_count += 1
            if blank_count >= 3:
                m = re.findall(p_param, line)
                for element in m:
                    l_floats = re.findall(p_float, element)
                    if re.search(p_eheat, element) or re.search(p_EISol, element):
                        l_floats = []
                    am1_params.append([element, i, len(l_floats)])
        return am1_params

    def extract_floats(self):
        # Patterns
        p_float = re.compile('\-?\d+\.\d+')

        parameter_floats = []
        for parameter in self.params:
            if parameter[2] > 0:
                m = re.findall(p_float, parameter[0])
                for element in m:
                    parameter_floats.append(float(element))

        return parameter_floats