from multiprocessing import Process
import subprocess
import re

#run gaussian
#               takes the string of an input file, and returns
#               the string of the gaussian output
def run_gaussian(input_file):
    proc = subprocess.Popen(['g09 2>&1 <<END\n' + input_file + 'END'], shell=True,
                            stdout=subprocess.PIPE, universal_newlines=True)
    stdout_value = str(proc.communicate()[0])
    p_normal = re.compile('Normal termination')
    if re.search(p_normal, str(stdout_value)):
        return stdout_value
    else:
        return 'Fail'

