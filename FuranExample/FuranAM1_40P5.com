#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.927166    -0.687706     0.012885
6       -0.386786    -1.122751    -0.035244
8       -1.146026     0.030634     0.041487
6       -0.358111     1.123416     0.031710
6        0.907536     0.674202     0.001240
1        1.784357     1.330512    -0.024162
1       -0.853376     2.062978     0.005566
1       -0.876825    -2.081689     0.010361
1        1.849051    -1.338008     0.010722

Method=8 CoreType=1 PeptideFC=0.011159 RIJScale=0.540421
****
H
PQN=1 NValence=1 F0ss=0.498012 ZetaOverlap=1.085670 U=-0.418626
Beta=-0.226883 CoreKO=1.035442 KON=0,0,0,1.045867 KON=1,0,1,1.087931
KON=0,1,1,1.058920 KON=2,1,1,1.069769 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.460985
GCore=0.008528,1.512775,2.267671
GCore=0.000353,1.455164,3.477994
GCore=-0.001301,0.560057,3.586132
****
C
PQN=2,2 NValence=4 F0ss=0.449444 F0sp=0.421515 F0pp=0.349759 F2pp=0.189872
G1sp=0.270154
ZetaOverlap=1.808665,1.378117
U=-1.768709,-1.455797
Beta=-0.501233,-0.306313 DDN=0,1,0.747402 DDN=1,1,0.726801
CoreKO=1.135621 KON=0,0,0,1.096610 KON=1,0,1,0.899821 KON=0,1,1,1.112428
KON=2,1,1,0.795791 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.275624
DipHyp=1.647252
GCore=0.000789,1.400143,2.667836
GCore=0.002898,1.400143,3.284071
GCore=-0.001393,1.301766,3.763412
GCore=-0.000085,1.400143,4.674478
****
O
PQN=2,2 NValence=6 F0ss=0.559626 F0sp=0.532130 F0pp=0.495871 F2pp=0.254343
G1sp=0.421698
ZetaOverlap=2.635449,2.496727
U=-3.316999,-2.034589
Beta=-1.157340,-1.194497 DDN=0,1,0.495361 DDN=1,1,0.508206
CoreKO=0.882296 KON=0,0,0,0.882296 KON=1,0,1,0.501954 KON=0,1,1,0.787588
KON=2,1,1,0.551558 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.367736
DipHyp=0.997722
GCore=0.020523,1.264029,1.602333
GCore=0.005655,1.960200,2.730788
****

