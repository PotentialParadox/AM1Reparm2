#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.954661    -0.688042    -0.007884
6       -0.374578    -1.078835    -0.017255
8       -1.160414    -0.043382    -0.021097
6       -0.322080     1.122755     0.018393
6        0.950935     0.709821    -0.024550
1        1.818028     1.367301    -0.004215
1       -0.810170     2.012950     0.037361
1       -0.851789    -2.083855     0.006747
1        1.778971    -1.389932     0.031342

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

