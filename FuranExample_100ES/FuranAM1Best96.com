#P AM1(Input,print) Opt

AM1-Reparam Input

0   1
6        0.926215    -0.737146     0.021672
6       -0.308425    -1.107518     0.036479
8       -1.147187    -0.039340    -0.016026
6       -0.302472     1.044676    -0.032533
6        0.985968     0.688567     0.047686
1        1.825045     1.399555     0.043861
1       -0.872425     2.061536     0.039852
1       -0.869296    -2.036180    -0.005693
1        1.787986    -1.352666    -0.036395

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

