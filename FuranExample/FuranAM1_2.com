#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.997011    -0.748681    -0.013348
6       -0.324597    -1.056812    -0.002437
8       -1.199696    -0.020730    -0.020254
6       -0.384589     1.142392     0.017330
6        0.952307     0.739674     0.023107
1        1.843336     1.327804     0.033538
1       -0.826249     2.068945    -0.028176
1       -0.817267    -2.044503    -0.046824
1        1.776756    -1.415623     0.031084

Method=8 CoreType=1 PeptideFC=0.011451 RIJScale=0.529177
****
H
PQN=1 NValence=1 F0ss=0.513874 ZetaOverlap=1.082674 U=-0.439547
Beta=-0.211876 CoreKO=0.973002 KON=0,0,0,0.973002 KON=1,0,1,1.058920
KON=0,1,1,0.973002 KON=2,1,1,1.058920 EISol=-0.4395468110 EHeat=0.0830298228
Alpha=1.623706
GCore=0.007145,1.652651,2.220451
GCore=0.004484,1.797183,3.663130
GCore=-0.002477,0.785405,3.092636
****
C
PQN=2,2 NValence=4 F0ss=0.479694 F0sp=0.416546 F0pp=0.372381 F2pp=0.187909
G1sp=0.171122
ZetaOverlap=1.850188,1.768301
U=-1.900879,-1.448191
Beta=-0.568120,-0.302671 DDN=0,1,0.796757 DDN=1,1,0.692611
CoreKO=1.042332 KON=0,0,0,1.042332 KON=1,0,1,0.980891 KON=0,1,1,1.042332
KON=2,1,1,0.755886 EISol=-4.3315453857 EHeat=0.2723305520 Alpha=1.477897
DipHyp=1.593423
GCore=0.005182,1.607144,1.972817
GCore=0.000817,1.938922,3.139961
GCore=0.002584,1.753424,3.083253
GCore=-0.000188,2.520267,5.282879
****
O
PQN=2,2 NValence=6 F0ss=0.514580 F0sp=0.549632 F0pp=0.484499 F2pp=0.220786
G1sp=0.433514
ZetaOverlap=3.179369,2.553619
U=-3.562828,-2.862439
Beta=-1.097005,-1.071280 DDN=0,1,0.488670 DDN=1,1,0.479611
CoreKO=0.971667 KON=0,0,0,0.971667 KON=1,0,1,0.496741 KON=0,1,1,0.971667
KON=2,1,1,0.558456 EISol=-11.4672725099 EHeat=0.0949133088 Alpha=2.207710
DipHyp=0.977284
GCore=0.016038,1.461269,1.707624
GCore=0.004069,2.080424,2.867747
****

