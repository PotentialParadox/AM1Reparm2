#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.906738    -0.748835     0.037794
6       -0.374939    -1.074572    -0.038599
8       -1.189829     0.015606    -0.020926
6       -0.314851     1.090462    -0.027920
6        0.943793     0.702008     0.018207
1        1.792667     1.327176    -0.006726
1       -0.889415     2.075803     0.019114
1       -0.797134    -2.021796     0.006659
1        1.859797    -1.386543     0.032469

Method=8 CoreType=1 PeptideFC=0.010625 RIJScale=0.540421
****
H
PQN=1 NValence=1 F0ss=0.472155 ZetaOverlap=1.085670 U=-0.421942
Beta=-0.234468 CoreKO=1.134976 KON=0,0,0,1.045867 KON=1,0,1,1.058920
KON=0,1,1,1.058920 KON=2,1,1,1.069769 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.460985
GCore=0.007979,1.512775,2.267671
GCore=0.000353,1.436883,3.477994
GCore=-0.001195,0.560057,3.586132
****
C
PQN=2,2 NValence=4 F0ss=0.449444 F0sp=0.421515 F0pp=0.349759 F2pp=0.187890
G1sp=0.270154
ZetaOverlap=1.808665,1.378117
U=-1.768709,-1.455797
Beta=-0.545325,-0.306313 DDN=0,1,0.747402 DDN=1,1,0.726801
CoreKO=1.135621 KON=0,0,0,1.112428 KON=1,0,1,0.899821 KON=0,1,1,1.112428
KON=2,1,1,0.851640 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.278961
DipHyp=1.647252
GCore=0.000726,1.336158,2.667836
GCore=0.002898,1.400143,3.284071
GCore=-0.001509,1.301766,3.873939
GCore=-0.000103,1.482270,4.674478
****
O
PQN=2,2 NValence=6 F0ss=0.566675 F0sp=0.532130 F0pp=0.482659 F2pp=0.235808
G1sp=0.421698
ZetaOverlap=2.635449,2.496727
U=-3.316999,-1.977929
Beta=-1.157340,-1.299429 DDN=0,1,0.495361 DDN=1,1,0.485232
CoreKO=0.851599 KON=0,0,0,0.882296 KON=1,0,1,0.501954 KON=0,1,1,0.868205
KON=2,1,1,0.506878 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.403168
DipHyp=0.997722
GCore=0.020472,1.400143,1.602333
GCore=0.005153,1.960200,2.730788
****

