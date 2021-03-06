import re


class Coordinates:
    def __init__(self, from_coordinate_string=None):
        if from_coordinate_string:
            self.find_spins(from_coordinate_string)
            self.find_coordinates(from_coordinate_string)

    def find_spins(self, coordinate_string):
        p_spins = re.compile("(\\d+)\\s+(\\d+)\\s*\n")
        m = re.search(p_spins, coordinate_string)
        self.charge = int(m.group(1))
        self.multiplicity = int(m.group(2))

    def find_coordinates(self, coordinate_string):
        p_coord = re.compile("(\\S+)\\s+(-?\\d+\\.\\d+\\s+)(-?\\d+\\.\\d+\\s+)(-?\\d+\\.\\d+\\s*)")
        m = re.findall(p_coord, coordinate_string)
        coords = []
        for line in m:
            n = [
                    int(line[0]),
                    float(line[1]),
                    float(line[2]),
                    float(line[3])
                ]
            coords.append(n)
        self.coordinates = coords

    def str(self):
        coord_str = str(self.charge) + " " + str(self.multiplicity) + "\n"
        for i in self.coordinates:
            coord_str += str(i[0])
            for j in range(1, 4):
                if i[j] < 0:
                    coord_str += 7 * " " + "{0:.6f}".format(i[j])
                else:
                    coord_str += 8 * " " + "{0:.6f}".format(i[j])
            coord_str += "\n"
        coord_str += "\n"
        return coord_str
