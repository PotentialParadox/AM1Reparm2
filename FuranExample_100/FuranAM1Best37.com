#P AM1(Input,print) Opt

AM1-Reparam Input

0   1
6        1.005430    -0.675659     0.019678
6       -0.296263    -1.050159    -0.031162
8       -1.194045    -0.019246     0.038946
6       -0.390606     1.095264     0.041564
6        0.953614     0.738714     0.018520
1        1.854747     1.332613    -0.037170
1       -0.865742     2.090497     0.046555
1       -0.830220    -2.052650    -0.040534
1        1.825063    -1.405800    -0.044465

Method=8 CoreType=1 PeptideFC=0.016629 RIJScale=0.611941
****
H
PQN=1 NValence=1 F0ss=0.415077 ZetaOverlap=1.081058 U=-0.428688
Beta=-0.286989 CoreKO=1.211480 KON=0,0,0,1.102519 KON=1,0,1,1.107492
KON=0,1,1,1.091654 KON=2,1,1,1.058920 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.503003
GCore=0.007112,1.120797,2.700567
GCore=0.000323,1.422246,3.401507
GCore=-0.001338,0.440599,4.448129
****
C
PQN=2,2 NValence=4 F0ss=0.420250 F0sp=0.426369 F0pp=0.342446 F2pp=0.197713
G1sp=0.274658
ZetaOverlap=1.749831,1.388139
U=-1.794425,-1.454500
Beta=-0.521499,-0.374658 DDN=0,1,0.823434 DDN=1,1,0.755995
CoreKO=1.200220 KON=0,0,0,1.169441 KON=1,0,1,0.909642 KON=0,1,1,0.937092
KON=2,1,1,0.520169 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.394751
DipHyp=1.908287
GCore=0.000878,1.268397,2.409067
GCore=0.003472,1.409627,3.657461
GCore=-0.001406,1.454240,3.315488
GCore=-0.000100,1.476696,5.066166
****
O
PQN=2,2 NValence=6 F0ss=0.567246 F0sp=0.568116 F0pp=0.489821 F2pp=0.270359
G1sp=0.416905
ZetaOverlap=2.726360,1.850527
U=-3.524193,-3.023876
Beta=-0.977265,-1.188660 DDN=0,1,0.580761 DDN=1,1,0.452110
CoreKO=0.992576 KON=0,0,0,0.835535 KON=1,0,1,0.545483 KON=0,1,1,0.837855
KON=2,1,1,0.501763 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.262797
DipHyp=1.109060
GCore=0.022571,1.284920,1.751940
GCore=0.005487,1.799171,2.833477
****

