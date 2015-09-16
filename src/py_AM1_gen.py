__author__ = 'dustin'
import re

def read_coordinates(file_name):
    # Patterns
    p_blank = re.compile('^\s*$')
    p_float = re.compile('\-?\d+\.\d+')
    p_integer = re.compile("\\b(\d)\s")
    blank_count = 0
    lines = ''
    f = open(file_name, 'r')
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
def read_parameters(file_name):
    # Patterns
    p_blank = re.compile('^\s*$')
    p_param = re.compile('\S+')
    p_float = re.compile('\-?\d+\.\d+')
    p_element = re.compile('(\S+)\-?\d+\.\d+')

    blank_count = 0
    am1_params = []
    f = open(file_name, 'r')
    for i, line in enumerate(f):
        if re.search(p_blank, line):
            blank_count += 1
        if blank_count >= 3:
            m = re.findall(p_param, line)
            for element in m:
                l_floats = re.findall(p_float, element)
                am1_params.append([element, i, len(l_floats)])
    return am1_params

def extract_floats(am1_parameters):
    # Patterns
    p_float = re.compile('\-?\d+\.\d+')

    parameter_floats = []
    for parameter in am1_parameters:
        if parameter[2] > 0:
            m = re.findall(p_float, parameter[0])
            for element in m:
                parameter_floats.append(float(element))

    return parameter_floats

def build_input(file_name, coordinates, parameter_list, parameter_floats):
    p_float = re.compile('\-?\d+\.\d+,?')
    f = open(file_name, 'w')
    f.write(coordinates)
    line_number = 0
    parameter_string = ''
    float_count = 0
    for params in parameter_list:
        if params[1] > line_number:
            parameter_string += '\n'
        else:
            parameter_string += ' '
        line_number = params[1]
        parameter_string += re.sub(p_float, '', params[0])
        for i in range(float_count, float_count + params[2]):
            if i == float_count:
                parameter_string += str(parameter_floats[i])
            else:
                parameter_string += ',' + str(parameter_floats[i])
        float_count += params[2]

    f.write(parameter_string)
    f.close()

coordinates = read_coordinates('FuranAM1.com')
params = read_parameters('FuranAM1.com')
param_floats = extract_floats(params)
build_input('FuranAM1.test', coordinates, params, param_floats)

