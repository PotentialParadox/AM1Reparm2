#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.948337    -0.732153    -0.009651
6       -0.370382    -1.140231    -0.008986
8       -1.132037     0.001318    -0.027477
6       -0.323307     1.119870    -0.031727
6        0.918939     0.706384    -0.002893
1        1.785880     1.322327    -0.013450
1       -0.869935     2.051088    -0.019024
1       -0.864904    -2.068469     0.034737
1        1.789228    -1.409724     0.030576

Method=8 CoreType=1 PeptideFC=0.010625 RIJScale=0.540421
****
H
PQN=1 NValence=1 F0ss=0.472155 ZetaOverlap=1.085670 U=-0.385849
Beta=-0.226883 CoreKO=1.035442 KON=0,0,0,1.045867 KON=1,0,1,1.058920
KON=0,1,1,1.143888 KON=2,1,1,1.058920 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.404664
GCore=0.008528,1.512775,2.267671
GCore=0.000353,1.436883,3.477994
GCore=-0.001301,0.560057,3.586132
****
C
PQN=2,2 NValence=4 F0ss=0.449444 F0sp=0.426142 F0pp=0.349759 F2pp=0.187890
G1sp=0.270154
ZetaOverlap=1.808665,1.378117
U=-1.674141,-1.455797
Beta=-0.545325,-0.283678 DDN=0,1,0.747402 DDN=1,1,0.796436
CoreKO=1.112428 KON=0,0,0,1.112428 KON=1,0,1,0.815968 KON=0,1,1,1.112428
KON=2,1,1,0.851640 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.365347
DipHyp=1.650880
GCore=0.000789,1.336158,2.667836
GCore=0.003189,1.400143,3.204545
GCore=-0.001509,1.382732,3.873939
GCore=-0.000103,1.270078,4.608813
****
O
PQN=2,2 NValence=6 F0ss=0.666625 F0sp=0.532130 F0pp=0.495871 F2pp=0.235808
G1sp=0.434377
ZetaOverlap=2.733668,2.524039
U=-3.595187,-1.832360
Beta=-1.157340,-1.248189 DDN=0,1,0.495361 DDN=1,1,0.521107
CoreKO=0.851599 KON=0,0,0,0.882296 KON=1,0,1,0.501954 KON=0,1,1,0.867153
KON=2,1,1,0.551558 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.403168
DipHyp=0.997722
GCore=0.020472,1.264029,1.602333
GCore=0.005279,1.960200,2.576167
****
