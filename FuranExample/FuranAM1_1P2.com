#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.975639    -0.668440     0.044435
6       -0.352946    -1.052150    -0.044642
8       -1.169008     0.008370     0.001692
6       -0.367658     1.065478     0.024677
6        0.949033     0.736479     0.015427
1        1.771752     1.339605     0.013397
1       -0.849328     2.039065     0.029177
1       -0.792227    -2.075653     0.021419
1        1.858570    -1.403878     0.035276

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

