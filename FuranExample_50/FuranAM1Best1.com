#P AM1(Input,print) Opt

AM1-Reparam Input

0   1
6        0.963276    -0.765007    -0.012685
6       -0.349435    -1.058302     0.047510
8       -1.198789    -0.034433    -0.043262
6       -0.381184     1.046114    -0.024521
6        0.942693     0.753506    -0.007755
1        1.826249     1.404780    -0.044122
1       -0.874147     2.070841    -0.020932
1       -0.835915    -2.013341    -0.048211
1        1.844585    -1.356337    -0.035126

Method=8 CoreType=1 PeptideFC=0.012575 RIJScale=0.566673
****
H
PQN=1 NValence=1 F0ss=0.432238 ZetaOverlap=1.188078 U=-0.418811
Beta=-0.215648 CoreKO=1.138545 KON=0,0,0,1.058920 KON=1,0,1,1.129045
KON=0,1,1,1.170666 KON=2,1,1,1.058920 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.525260
GCore=0.008469,1.338394,2.267671
GCore=0.000353,1.353366,3.666716
GCore=-0.001171,0.611538,4.321293
****
C
PQN=2,2 NValence=4 F0ss=0.446682 F0sp=0.406664 F0pp=0.376803 F2pp=0.189872
G1sp=0.267903
ZetaOverlap=1.808665,1.784075
U=-1.912018,-1.595662
Beta=-0.562950,-0.303168 DDN=0,1,0.763232 DDN=1,1,0.784758
CoreKO=1.112428 KON=0,0,0,1.088937 KON=1,0,1,0.821970 KON=0,1,1,0.989302
KON=2,1,1,0.778393 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.370206
DipHyp=1.647252
GCore=0.000832,1.465424,2.880659
GCore=0.002789,1.324569,3.243841
GCore=-0.001293,1.284602,4.092296
GCore=-0.000088,1.495878,4.951205
****
O
PQN=2,2 NValence=6 F0ss=0.566675 F0sp=0.506047 F0pp=0.495871 F2pp=0.215059
G1sp=0.418106
ZetaOverlap=3.308609,2.596061
U=-3.858644,-2.874327
Beta=-1.162776,-1.105656 DDN=0,1,0.467682 DDN=1,1,0.485232
CoreKO=1.032669 KON=0,0,0,0.882296 KON=1,0,1,0.501954 KON=0,1,1,0.882296
KON=2,1,1,0.540695 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.259205
DipHyp=1.074385
GCore=0.020269,1.400143,1.612749
GCore=0.005655,2.084487,2.760004
****

