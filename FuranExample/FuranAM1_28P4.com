#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.942933    -0.717648    -0.018785
6       -0.394170    -1.102515     0.046626
8       -1.206924    -0.014102     0.007182
6       -0.320508     1.053065    -0.035282
6        0.967938     0.720553     0.033679
1        1.790418     1.402801     0.028512
1       -0.800439     2.039772    -0.014174
1       -0.807545    -2.096595    -0.000425
1        1.838171    -1.359869    -0.013112

Method=8 CoreType=1 PeptideFC=0.010836 RIJScale=0.540421
****
H
PQN=1 NValence=1 F0ss=0.472155 ZetaOverlap=1.085670 U=-0.418811
Beta=-0.226883 CoreKO=1.035442 KON=0,0,0,1.045867 KON=1,0,1,1.058920
KON=0,1,1,1.058920 KON=2,1,1,1.069769 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.460985
GCore=0.008528,1.400143,2.267671
GCore=0.000353,1.436883,3.477994
GCore=-0.001190,0.560057,3.586132
****
C
PQN=2,2 NValence=4 F0ss=0.449444 F0sp=0.426142 F0pp=0.349759 F2pp=0.187890
G1sp=0.250301
ZetaOverlap=1.863247,1.404090
U=-1.721563,-1.455797
Beta=-0.545325,-0.306313 DDN=0,1,0.747402 DDN=1,1,0.726801
CoreKO=1.043636 KON=0,0,0,1.112428 KON=1,0,1,0.899821 KON=0,1,1,1.112428
KON=2,1,1,0.851640 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.498915
DipHyp=1.647252
GCore=0.000789,1.336158,2.667836
GCore=0.002898,1.400143,3.721733
GCore=-0.001393,1.382732,3.873939
GCore=-0.000103,1.400143,4.608813
****
O
PQN=2,2 NValence=6 F0ss=0.566675 F0sp=0.577226 F0pp=0.495871 F2pp=0.235808
G1sp=0.421001
ZetaOverlap=2.635449,2.524039
U=-3.595187,-2.476600
Beta=-1.157340,-1.299429 DDN=0,1,0.495361 DDN=1,1,0.485232
CoreKO=0.851599 KON=0,0,0,0.925695 KON=1,0,1,0.501954 KON=0,1,1,0.859309
KON=2,1,1,0.551558 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.403168
DipHyp=0.997722
GCore=0.020472,1.264029,1.602333
GCore=0.004701,1.865901,2.730788
****

