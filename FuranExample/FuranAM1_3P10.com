#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.935729    -0.747767    -0.009093
6       -0.359315    -1.090047     0.025316
8       -1.194027    -0.024511    -0.048899
6       -0.364510     1.053205    -0.006016
6        0.930998     0.721467    -0.020599
1        1.853896     1.319870     0.006451
1       -0.848899     2.036573    -0.019050
1       -0.851710    -2.077152     0.034686
1        1.817605    -1.375887    -0.040862

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

