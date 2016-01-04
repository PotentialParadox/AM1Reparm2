import matplotlib.pyplot as plt
import numpy as np
import re
import math


fin = open("FuranExample_3/Furan.out", "r")
outfile = fin.read()
p_new_best = re.compile("Starting Step (\d+)\s+"
                        "New Best Found : (\d+\.\d+)\s+"
                        "With raw values: \[(\d+\.\d+)\, (\d+\.\d+)\,"
                        " (\d+\.\d+)\]")
m = re.findall(p_new_best, outfile)
data_0 = np.array(m)

fin = open("FuranExample_1/Furan.out", "r")
outfile = fin.read()
m = re.findall(p_new_best, outfile)
data_1 = np.array(m)

fin = open("FuranExample_2/Furan.out", "r")
outfile = fin.read()
m = re.findall(p_new_best, outfile)
data_2 = np.array(m)

# Plot fitness vs time
x_0 = data_0[:, 0]
y_0 = data_0[:, 1]
plt.scatter(x_0, y_0, color="red", label="Test 0")
x_1 = data_1[:, 0]
y_1 = data_1[:, 1]
plt.scatter(x_1, y_1, color="green", label="Test 1")
x_2 = data_2[:, 0]
y_2 = data_2[:, 1]
plt.scatter(x_2, y_2, color="blue", label="Test 2")
plt.xlabel("Step")
plt.ylabel("Fitness")
plt.title("Fitness")
plt.legend()
plt.show()

# Plot force fitness vs time
x_0 = data_0[:, 0]
y_0 = data_0[:, 2]
plt.scatter(x_0, y_0, color="red", label="Test 0")
x_1 = data_1[:, 0]
y_1 = data_1[:, 2]
plt.scatter(x_1, y_1, color="green", label="Test 1")
x_2 = data_2[:, 0]
y_2 = data_2[:, 2]
plt.scatter(x_2, y_2, color="blue", label="Test 2")
plt.xlabel("Step")
plt.ylabel("Fitness")
plt.title("Force Fitness")
plt.legend()
plt.show()

# Plot ground fitness vs time
x_0 = data_0[:, 0]
y_0 = data_0[:, 3]
plt.scatter(x_0, y_0, color="red", label="Test 0")
x_1 = data_1[:, 0]
y_1 = data_1[:, 3]
plt.scatter(x_1, y_1, color="green", label="Test 1")
x_2 = data_2[:, 0]
y_2 = data_2[:, 3]
plt.scatter(x_2, y_2, color="blue", label="Test 2")
plt.xlabel("Step")
plt.ylabel("Fitness")
plt.title("Ground Fitness")
plt.legend()
plt.show()

# Plot excited state fitness vs time
x_0 = data_0[:, 0]
y_0 = data_0[:, 4]
plt.scatter(x_0, y_0, color="red", label="Test 0")
x_1 = data_1[:, 0]
y_1 = data_1[:, 4]
plt.scatter(x_1, y_1, color="green", label="Test 1")
x_2 = data_2[:, 0]
y_2 = data_2[:, 4]
plt.scatter(x_2, y_2, color="blue", label="Test 2")
plt.xlabel("Step")
plt.ylabel("Fitness")
plt.title("Excited State Fitness")
plt.legend()
plt.show()

# ********** Find Optimized Fitness *************

p_coord = re.compile("\n\s*(\d+)\s+"
                     "\d+\s+"
                     "\d+\s+"
                     "(\-?\d+\.\d+)\s+(\-?\d+\.\d+)"
                     "\s+(\-?\d+\.\d*)")

# Find DFT Values
fin = open("FuranExample_0/FuranDFTSpec.log", "r")
dft = fin.read()
fin.close()
coord_dft = re.findall(p_coord, dft)
number_atoms = int(coord_dft[-1][0])
coord_dft = coord_dft[-number_atoms:]
# Find AM1 Values
fin = open("FuranExample_0/FuranBestInput.log", "r")
am1_0 = fin.read()
fin.close()
coord_am1_0 = re.findall(p_coord, am1_0)
coord_am1_0 = coord_am1_0[-number_atoms:]
# Calculate Distance
rms = 0
for i, _ in enumerate(coord_dft):
    diff_x = float(coord_dft[i][1]) + float(coord_am1_0[i][3])
    diff_y = float(coord_dft[i][2]) + float(coord_am1_0[i][1])
    diff_z = float(coord_dft[i][3]) + float(coord_am1_0[i][2])
    s = pow(diff_x, 2) + pow(diff_y, 2) + pow(diff_z, 2)
    d = math.sqrt(s)
    rms += d/len(coord_dft)
print(rms)
