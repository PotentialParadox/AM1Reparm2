#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.981105    -0.735630    -0.005265
6       -0.315431    -1.136730    -0.045373
8       -1.186923    -0.041656    -0.023046
6       -0.344364     1.100424     0.010188
6        0.909916     0.729240    -0.018030
1        1.858518     1.370973     0.006705
1       -0.848465     2.077061     0.027750
1       -0.864620    -2.073627    -0.009403
1        1.783192    -1.332620    -0.039475

Method=8 CoreType=1 PeptideFC=0.010625 RIJScale=0.540421
****
H
PQN=1 NValence=1 F0ss=0.472155 ZetaOverlap=1.085670 U=-0.418626
Beta=-0.226883 CoreKO=1.035442 KON=0,0,0,1.045867 KON=1,0,1,0.980252
KON=0,1,1,1.058920 KON=2,1,1,1.069769 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.460985
GCore=0.008528,1.512775,2.267671
GCore=0.000353,1.455164,3.477994
GCore=-0.001301,0.560057,3.835853
****
C
PQN=2,2 NValence=4 F0ss=0.449444 F0sp=0.426142 F0pp=0.349759 F2pp=0.189872
G1sp=0.270154
ZetaOverlap=1.808665,1.378117
U=-1.858607,-1.455797
Beta=-0.545325,-0.306313 DDN=0,1,0.785936 DDN=1,1,0.726801
CoreKO=1.135621 KON=0,0,0,1.112428 KON=1,0,1,0.899821 KON=0,1,1,1.101204
KON=2,1,1,0.778393 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.275624
DipHyp=1.647252
GCore=0.000789,1.400143,2.667836
GCore=0.003505,1.400143,3.310654
GCore=-0.001509,1.301766,3.873939
GCore=-0.000103,1.400143,4.608813
****
O
PQN=2,2 NValence=6 F0ss=0.566675 F0sp=0.532130 F0pp=0.495871 F2pp=0.235808
G1sp=0.421698
ZetaOverlap=2.635449,2.524039
U=-3.595187,-2.034589
Beta=-1.157340,-1.299429 DDN=0,1,0.495361 DDN=1,1,0.508206
CoreKO=0.882296 KON=0,0,0,0.889146 KON=1,0,1,0.501954 KON=0,1,1,0.868205
KON=2,1,1,0.551558 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.358355
DipHyp=0.997722
GCore=0.020472,1.264029,1.602333
GCore=0.005655,1.960200,2.730788
****

