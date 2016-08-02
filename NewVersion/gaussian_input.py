import re
from header import Header
from coordinates import Coordinates
from parameters import Parameters


class GaussianInput:
    def __init__(self, input_string=None, header=None, coordinates=None, parameters=None):
        if input_string:
            self.header = find_header(input_string)
            self.coordinates = find_coordinates(input_string)
            self.parameters = find_parameters(input_string)
        else:
            self.header = header
            self.coordinates = coordinates
            self.parameters = parameters

    def str(self):
        return self.header.str() + self.coordinates.str() + self.parameters.str()


def find_header(file_string):
    p_header = re.compile('^(.+\n)+\n(.+\n)')
    m = re.search(p_header, file_string)
    if not m:
        return None
    header_string = m.group(0)
    return Header(from_header_string=header_string)


def find_coordinates(file_string):
    p_coordinates = re.compile("\n\\s*\\d+\\s+\\d+\\s*\n(\\s*\\S+\\s+-?\\d+\\..+)+")
    m = re.search(p_coordinates, file_string)
    if not m:
        return None
    coordinate_string = m.group(0)
    return Coordinates(from_coordinate_string=coordinate_string)


def find_parameters(file_string):
    p_parameters = re.compile("Method=(.|\n)*(?=--Link1)")
    m = re.search(p_parameters, file_string)
    if not m:
        p_parameters = re.compile("Method=(.|\n)*")
        m = re.search(p_parameters, file_string)
    if not m:
        return None
    parameter_string = m.group(0)
    return Parameters(from_parameter_string=parameter_string)