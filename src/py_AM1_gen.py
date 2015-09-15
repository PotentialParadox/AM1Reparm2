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
    return lines

def read_parameters(file_name):


A = read_coordinates('FuranAM1.com')
print(A)
