#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.906946    -0.765733     0.002229
6       -0.309815    -1.100827    -0.010638
8       -1.184065    -0.032097    -0.004452
6       -0.352461     1.059009     0.040034
6        0.984734     0.682890     0.046241
1        1.760921     1.384623    -0.033405
1       -0.820712     2.000993    -0.033865
1       -0.826806    -2.082259    -0.018456
1        1.781664    -1.408137     0.022833

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

