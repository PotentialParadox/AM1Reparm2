#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.977613    -0.704060     0.029521
6       -0.376517    -1.058079     0.007668
8       -1.110617    -0.011197     0.049687
6       -0.361124     1.091768    -0.005023
6        0.939092     0.764749     0.000770
1        1.801021     1.333287    -0.043332
1       -0.816375     2.052504     0.044180
1       -0.806289    -2.031435     0.007730
1        1.844830    -1.324207     0.035304

Method=8 CoreType=1 PeptideFC=0.010625 RIJScale=0.540421
****
H
PQN=1 NValence=1 F0ss=0.472155 ZetaOverlap=0.983567 U=-0.418811
Beta=-0.226883 CoreKO=1.134976 KON=0,0,0,1.058920 KON=1,0,1,1.058920
KON=0,1,1,1.139695 KON=2,1,1,1.058920 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.585301
GCore=0.008213,1.512775,2.267671
GCore=0.000353,1.436883,3.477994
GCore=-0.001301,0.560057,3.549214
****
C
PQN=2,2 NValence=4 F0ss=0.449444 F0sp=0.421515 F0pp=0.376803 F2pp=0.187890
G1sp=0.256894
ZetaOverlap=1.808665,1.378117
U=-1.756176,-1.484770
Beta=-0.545325,-0.333690 DDN=0,1,0.747402 DDN=1,1,0.785254
CoreKO=1.112428 KON=0,0,0,1.112428 KON=1,0,1,0.899821 KON=0,1,1,1.038239
KON=2,1,1,0.851640 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.365347
DipHyp=1.647252
GCore=0.000789,1.400143,2.667836
GCore=0.002898,1.340321,3.048043
GCore=-0.001509,1.400143,3.873939
GCore=-0.000103,1.269324,4.608813
****
O
PQN=2,2 NValence=6 F0ss=0.566675 F0sp=0.532130 F0pp=0.495871 F2pp=0.235808
G1sp=0.447353
ZetaOverlap=2.733668,2.507905
U=-3.630905,-2.153517
Beta=-1.157340,-1.299429 DDN=0,1,0.495361 DDN=1,1,0.485232
CoreKO=0.851599 KON=0,0,0,0.882296 KON=1,0,1,0.468544 KON=0,1,1,0.867153
KON=2,1,1,0.551558 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.403168
DipHyp=1.009936
GCore=0.019512,1.264029,1.602333
GCore=0.005153,1.960200,2.730788
****

