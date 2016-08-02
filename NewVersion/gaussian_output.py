import re


class GaussianOutput:
    def __init__(self, output_string=None):
        self.ground_energy = find_ground_energy(output_string)
        self.dipole = find_dipole(output_string)


# find_ground_energy
#               takes a string of the gaussian output and returns a integer
#               of the ground energy
def find_ground_energy(file_string):
    p_float = re.compile('\-?\d+\.\d+,?')
    p_energy = re.compile('SCF Done.*')
    m = re.findall(p_energy, file_string)
    final_line = m[-1]
    m = re.search(p_float, final_line)
    return float(m.group(0))


# find_dipole
#               takes a string of the gaussian output and returns a list
#               of the dipole moment
def find_dipole(file_string):
    p_float = re.compile('\-?\d+\.\d+,?')
    p_dipole = re.compile('Dipole moment \(field-independent'
                          + ' basis, Debye\)\:\n.+')
    m = re.findall(p_dipole, file_string)
    dipole = []
    for i in m:
        n = re.findall(p_float, i)
        for j in n:
            dipole.append(float(j))
    dipole = dipole[-4:-1]
    return dipole