from multiprocessing import Process
import subprocess
import re

#run gaussian
#               takes the string of an input file, and returns
#               the string of the gaussian output
def run_gaussian(input_file):
    proc = subprocess.Popen(['#!/bin/sh\ng09 2>&1 <<END\n', input_file, 'END'],
                            stderr=subprocess.PIPE,)
    stdout_value = proc.communicate()[1]
    p_normal = re.compile('Normal termination')
    if re.search(p_normal, str(stdout_value)):
        return stdout_value
    else:
        return 'Fail'