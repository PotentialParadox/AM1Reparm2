#P AM1(Input,print) Opt

AM1-Reparam Input

0   1
6        0.930371    -0.703595    -0.030684
6       -0.317448    -1.060264    -0.034556
8       -1.179377     0.037973     0.017741
6       -0.334231     1.137533    -0.015406
6        0.982090     0.701746    -0.044244
1        1.792475     1.392916     0.035551
1       -0.796514     2.043449     0.039554
1       -0.867245    -2.006684    -0.024881
1        1.815832    -1.323768     0.037928

Method=8 CoreType=1 PeptideFC=0.010380 RIJScale=0.435251
****
H
PQN=1 NValence=1 F0ss=0.474121 ZetaOverlap=1.374206 U=-0.484772
Beta=-0.171490 CoreKO=1.253841 KON=0,0,0,1.152466 KON=1,0,1,1.029894
KON=0,1,1,0.930261 KON=2,1,1,0.916190 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.616063
GCore=0.007430,1.396171,2.245487
GCore=0.000352,1.747793,3.670840
GCore=-0.001345,0.576391,3.629508
****
C
PQN=2,2 NValence=4 F0ss=0.442769 F0sp=0.385518 F0pp=0.335880 F2pp=0.213758
G1sp=0.363863
ZetaOverlap=1.710119,1.459211
U=-1.872193,-1.455797
Beta=-0.592474,-0.370986 DDN=0,1,0.757067 DDN=1,1,0.917493
CoreKO=1.220776 KON=0,0,0,1.010899 KON=1,0,1,0.836633 KON=0,1,1,1.202958
KON=2,1,1,0.724276 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.363717
DipHyp=1.391573
GCore=0.000658,1.190771,2.638310
GCore=0.003715,1.253547,4.177862
GCore=-0.001330,1.325391,3.888639
GCore=-0.000090,1.467575,4.821587
****
O
PQN=2,2 NValence=6 F0ss=0.514136 F0sp=0.530961 F0pp=0.504577 F2pp=0.229152
G1sp=0.418621
ZetaOverlap=2.610149,2.212970
U=-3.649817,-3.113798
Beta=-1.040248,-1.124368 DDN=0,1,0.437803 DDN=1,1,0.566876
CoreKO=0.963828 KON=0,0,0,0.907328 KON=1,0,1,0.465466 KON=0,1,1,0.898508
KON=2,1,1,0.611757 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.327520
DipHyp=1.143261
GCore=0.018976,1.299316,1.488247
GCore=0.004234,1.846445,2.524691
****

