import re


class Parameters:
    def __init__(self, from_parameter_string=None):
        if from_parameter_string:
            self.lables = self.__find_labels(from_parameter_string)
            self.p_floats = self.__extract_floats()

    def __find_labels(self, parameter_string):
        p_label = re.compile("(\S+\s)|\n")
        m = re.findall(p_label, parameter_string)
        if m:
            return m
        return None

    def __extract_floats(self):
        p_float = re.compile("-?\\d+\\.\\d+")
        p_not_label = re.compile("-?\\d+\\.\\d+.*\n*")
        p_eisol = re.compile("EISol")
        p_eheat = re.compile("EHeat")
        p_newline = re.compile("\n")
        p_floats = []
        line_count = 0
        for i, label in enumerate(self.lables):
            if not re.search(p_eheat, label) and not re.search(p_eisol, label):
                m = re.findall(p_float, label)
                for j, floater in enumerate(m):
                    p_floats.append(floater)
                    p_floats.append(i)
                    p_floats.append(j)
                    p_floats.append(line_count)
                self.lables[i] = re.sub(p_not_label, "", label)
            if re.search(p_newline, label):
                line_count += 1
        return p_floats

    def str(self):
        parameters = list(self.lables)
        p = self.p_floats
        for i in range(0, len(self.p_floats), 4):
            ss = ""
            if p[i+2] is 0:
                ss += str(p[i])
            else:
                ss += "," + str(p[i])
            if i >= len(self.p_floats) - 4:
                ss += "\n"
            elif p[i+7] > p[i+3]:
                ss += "\n"
            elif p[i+1] < p[i+5]:
                ss += " "
            parameters[p[i+1]] += ss
        parameter_string = ""
        for i in parameters:
            parameter_string += i
        return parameter_string

    def get_floats(self):
        return self.p_floats[0::4]

    def set_floats(self, updated_floats):
        self.p_floats[0::4] = updated_floats