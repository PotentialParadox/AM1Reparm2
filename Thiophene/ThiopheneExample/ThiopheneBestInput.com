#P AM1(Input,print) Opt Freq

AM1-Reparam Input

0   1
6        0.955475    -0.715963     0.000000
6       -0.345627    -1.092818     0.000000
16       -1.157305     0.000000     0.000000
6       -0.345627     1.092818     0.000000
6        0.955475     0.715963     0.000000
1        1.810438     1.369382     0.000000
1       -0.840307     2.046884     0.000000
1       -0.840307    -2.046884     0.000000
1        1.810438    -1.369382     0.000000

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
S
PQN=3,3 NValence=6 F0ss=0.433140 F0sp=0.318364 F0pp=0.313627 F2pp=0.345692
G1sp=0.279163
ZetaOverlap=2.366515,1.667263,1.000000
U=-2.083468,-1.790319
Beta=-0.144078,-0.290514 DDN=0,1,0.900427 DDN=1,1,1.003633
CoreKO=1.154303 KON=0,0,0,1.154303 KON=1,0,1,0.846437 KON=0,1,1,1.154303
KON=2,1,1,0.774600 EISol=-7.0460287497 EHeat=0.1058151363 Alpha=1.302648
DipHyp=1.800749
GCore=-0.035362,1.286364,1.456346
GCore=-0.000824,1.642572,2.840850
GCore=0.000857,3.796441,3.796787
****
