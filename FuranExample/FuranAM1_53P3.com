#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.998562    -0.732196    -0.036436
6       -0.365105    -1.069955    -0.049218
8       -1.128138     0.022932    -0.014658
6       -0.385074     1.058698    -0.028299
6        0.910625     0.749940     0.009836
1        1.790703     1.348906    -0.048334
1       -0.887424     2.056323     0.034230
1       -0.883111    -2.080180    -0.017144
1        1.781028    -1.348077     0.027058

Method=8 CoreType=1 PeptideFC=0.011159 RIJScale=0.540421
****
H
PQN=1 NValence=1 F0ss=0.498012 ZetaOverlap=1.085670 U=-0.418626
Beta=-0.213180 CoreKO=1.035442 KON=0,0,0,1.045867 KON=1,0,1,1.087469
KON=0,1,1,1.058920 KON=2,1,1,1.069769 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.576074
GCore=0.008528,1.512775,2.267671
GCore=0.000353,1.465090,3.477994
GCore=-0.001301,0.560057,3.498980
****
C
PQN=2,2 NValence=4 F0ss=0.449444 F0sp=0.421515 F0pp=0.349759 F2pp=0.189339
G1sp=0.270154
ZetaOverlap=1.808665,1.257280
U=-1.768709,-1.455797
Beta=-0.548584,-0.306313 DDN=0,1,0.747402 DDN=1,1,0.726801
CoreKO=1.112428 KON=0,0,0,1.010555 KON=1,0,1,0.864619 KON=0,1,1,1.101204
KON=2,1,1,0.851640 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.275624
DipHyp=1.647252
GCore=0.000789,1.336158,2.667836
GCore=0.002904,1.400143,3.284071
GCore=-0.001509,1.251085,3.873939
GCore=-0.000085,1.400143,4.674478
****
O
PQN=2,2 NValence=6 F0ss=0.559626 F0sp=0.532130 F0pp=0.484501 F2pp=0.254343
G1sp=0.455939
ZetaOverlap=2.635449,2.496727
U=-3.595187,-2.034589
Beta=-1.157340,-1.299429 DDN=0,1,0.495361 DDN=1,1,0.486762
CoreKO=0.882296 KON=0,0,0,0.882296 KON=1,0,1,0.501954 KON=0,1,1,0.868205
KON=2,1,1,0.551558 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.403168
DipHyp=0.997722
GCore=0.020523,1.400143,1.602333
GCore=0.005655,1.960200,2.730788
****

