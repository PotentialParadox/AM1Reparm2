#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.989694    -0.686478     0.043436
6       -0.316428    -1.128044    -0.026857
8       -1.182175    -0.016365     0.047865
6       -0.301816     1.069697     0.025668
6        0.925104     0.698931     0.011520
1        1.787915     1.410795     0.011865
1       -0.828230     2.077168    -0.008101
1       -0.802272    -2.011079    -0.017392
1        1.792849    -1.408507     0.007959

Method=8 CoreType=1 PeptideFC=0.010625 RIJScale=0.540421
****
H
PQN=1 NValence=1 F0ss=0.508594 ZetaOverlap=1.085670 U=-0.418626
Beta=-0.226883 CoreKO=1.035442 KON=0,0,0,1.045867 KON=1,0,1,0.980252
KON=0,1,1,1.058920 KON=2,1,1,1.069769 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.460985
GCore=0.008528,1.488224,2.267671
GCore=0.000353,1.455164,3.345589
GCore=-0.001301,0.560057,3.498980
****
C
PQN=2,2 NValence=4 F0ss=0.449444 F0sp=0.426142 F0pp=0.338809 F2pp=0.187890
G1sp=0.270154
ZetaOverlap=1.808665,1.378117
U=-1.768709,-1.455797
Beta=-0.545325,-0.333690 DDN=0,1,0.747402 DDN=1,1,0.726801
CoreKO=1.145413 KON=0,0,0,1.112428 KON=1,0,1,0.847351 KON=0,1,1,1.112428
KON=2,1,1,0.851640 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.291465
DipHyp=1.647252
GCore=0.000789,1.336158,2.667836
GCore=0.002898,1.296849,3.284071
GCore=-0.001509,1.382732,3.510424
GCore=-0.000085,1.465094,4.608813
****
O
PQN=2,2 NValence=6 F0ss=0.566675 F0sp=0.532130 F0pp=0.495871 F2pp=0.235808
G1sp=0.421698
ZetaOverlap=2.635449,2.737922
U=-3.595187,-2.034589
Beta=-1.157340,-1.299429 DDN=0,1,0.495361 DDN=1,1,0.485232
CoreKO=0.851599 KON=0,0,0,0.820868 KON=1,0,1,0.501954 KON=0,1,1,0.868205
KON=2,1,1,0.551558 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.403168
DipHyp=0.997722
GCore=0.020472,1.264029,1.602333
GCore=0.005429,1.960200,2.730788
****

