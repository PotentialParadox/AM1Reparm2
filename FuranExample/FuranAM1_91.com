#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        1.002809    -0.694310     0.004349
6       -0.364552    -1.086932    -0.041773
8       -1.133550     0.007953    -0.010640
6       -0.357061     1.088564     0.029703
6        0.959577     0.748228     0.030637
1        1.770993     1.353893     0.009179
1       -0.836333     2.004427     0.013983
1       -0.804269    -2.085446    -0.011493
1        1.794385    -1.391061    -0.018532

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

