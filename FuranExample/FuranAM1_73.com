#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.954969    -0.742605    -0.005942
6       -0.391483    -1.084273    -0.021952
8       -1.154264     0.021184     0.047076
6       -0.364013     1.111690    -0.000629
6        0.922241     0.756863    -0.022733
1        1.763988     1.366614    -0.031031
1       -0.851715     2.051497    -0.019389
1       -0.808683    -2.067763    -0.032601
1        1.840769    -1.414950    -0.039133

Method=8 CoreType=1 PeptideFC=0.011451 RIJScale=0.529177
****
H
PQN=1 NValence=1 F0ss=0.472155 ZetaOverlap=1.188078 U=-0.418811
Beta=-0.226883 CoreKO=1.058920 KON=0,0,0,1.058920 KON=1,0,1,1.058920
KON=0,1,1,1.058920 KON=2,1,1,1.058920 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.525260
GCore=0.008528,1.400143,2.267671
GCore=0.000353,1.400143,3.401507
GCore=-0.001273,0.560057,3.968425
****
C
PQN=2,2 NValence=4 F0ss=0.449444 F0sp=0.421515 F0pp=0.376803 F2pp=0.189872
G1sp=0.267903
ZetaOverlap=1.808665,1.685116
U=-1.912018,-1.455797
Beta=-0.577544,-0.283678 DDN=0,1,0.823674 DDN=1,1,0.726801
CoreKO=1.112428 KON=0,0,0,1.112428 KON=1,0,1,0.821970 KON=0,1,1,1.112428
KON=2,1,1,0.778393 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.401406
DipHyp=1.647252
GCore=0.000789,1.400143,3.023562
GCore=0.003189,1.400143,3.495993
GCore=-0.001393,1.400143,3.873939
GCore=-0.000088,1.400143,5.007774
****
O
PQN=2,2 NValence=6 F0ss=0.566675 F0sp=0.532130 F0pp=0.495871 F2pp=0.235808
G1sp=0.434377
ZetaOverlap=3.108032,2.524039
U=-3.595187,-2.876090
Beta=-1.075755,-1.075755 DDN=0,1,0.498890 DDN=1,1,0.485232
CoreKO=0.882296 KON=0,0,0,0.882296 KON=1,0,1,0.501954 KON=0,1,1,0.882296
KON=2,1,1,0.551558 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.357681
DipHyp=0.997722
GCore=0.019512,1.400143,1.602333
GCore=0.005655,1.960200,2.730788
****

