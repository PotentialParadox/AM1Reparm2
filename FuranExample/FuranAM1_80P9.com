#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.916703    -0.764854    -0.036692
6       -0.385303    -1.079104    -0.027434
8       -1.145823     0.009348    -0.034570
6       -0.297599     1.049894    -0.027661
6        0.997519     0.703933     0.015072
1        1.851758     1.407431    -0.043834
1       -0.864870     2.064606     0.002045
1       -0.821943    -2.045380    -0.034806
1        1.850922    -1.385324     0.035456

Method=8 CoreType=1 PeptideFC=0.010625 RIJScale=0.540421
****
H
PQN=1 NValence=1 F0ss=0.498012 ZetaOverlap=1.085670 U=-0.376823
Beta=-0.226883 CoreKO=1.035442 KON=0,0,0,1.045867 KON=1,0,1,1.058920
KON=0,1,1,1.058920 KON=2,1,1,1.069769 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.460985
GCore=0.008528,1.512775,2.267671
GCore=0.000353,1.455164,3.477994
GCore=-0.001190,0.560057,3.586132
****
C
PQN=2,2 NValence=4 F0ss=0.449444 F0sp=0.421515 F0pp=0.349759 F2pp=0.187890
G1sp=0.270154
ZetaOverlap=1.808665,1.378117
U=-1.792389,-1.455797
Beta=-0.545325,-0.306313 DDN=0,1,0.747402 DDN=1,1,0.726801
CoreKO=1.112428 KON=0,0,0,1.172310 KON=1,0,1,0.899821 KON=0,1,1,1.101204
KON=2,1,1,0.778393 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.275624
DipHyp=1.647252
GCore=0.000789,1.209540,2.667836
GCore=0.002898,1.400143,3.284071
GCore=-0.001379,1.301766,3.873939
GCore=-0.000103,1.400143,4.608813
****
O
PQN=2,2 NValence=6 F0ss=0.531064 F0sp=0.532130 F0pp=0.495871 F2pp=0.254343
G1sp=0.401324
ZetaOverlap=2.635449,2.524039
U=-3.595187,-2.034589
Beta=-1.157340,-1.299429 DDN=0,1,0.495361 DDN=1,1,0.508206
CoreKO=0.851599 KON=0,0,0,0.882296 KON=1,0,1,0.501954 KON=0,1,1,0.867153
KON=2,1,1,0.551558 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.403168
DipHyp=0.997722
GCore=0.020472,1.264029,1.602333
GCore=0.005153,1.960200,2.730788
****

