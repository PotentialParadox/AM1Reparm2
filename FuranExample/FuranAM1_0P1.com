#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.956964    -0.759088     0.025294
6       -0.322072    -1.079623     0.043319
8       -1.192880    -0.033001    -0.010488
6       -0.336686     1.096219    -0.002612
6        0.946202     0.674706    -0.026290
1        1.855969     1.349918    -0.009277
1       -0.800417     2.033663    -0.009819
1       -0.835706    -2.058670     0.048253
1        1.817870    -1.399457    -0.022759

Method=8 CoreType=1 PeptideFC=0.013595 RIJScale=0.377125
****
H
PQN=1 NValence=1 F0ss=0.446797 ZetaOverlap=1.374154 U=-0.442120
Beta=-0.254936 CoreKO=1.278058 KON=0,0,0,0.987164 KON=1,0,1,1.106663
KON=0,1,1,0.781763 KON=2,1,1,1.180996 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.799139
GCore=0.007581,1.582091,2.053305
GCore=0.000386,1.485404,3.492576
GCore=-0.001595,0.349341,2.648858
****
C
PQN=2,2 NValence=4 F0ss=0.345481 F0sp=0.456068 F0pp=0.373147 F2pp=0.129001
G1sp=0.297173
ZetaOverlap=2.009621,1.173901
U=-1.765519,-1.934465
Beta=-0.492547,-0.413235 DDN=0,1,0.697809 DDN=1,1,0.689622
CoreKO=1.100733 KON=0,0,0,1.275208 KON=1,0,1,0.821970 KON=0,1,1,0.961924
KON=2,1,1,0.755941 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.147993
DipHyp=1.640260
GCore=0.000893,1.978732,2.573509
GCore=0.003471,1.079812,3.368405
GCore=-0.001573,1.534141,2.725008
GCore=-0.000084,1.540324,4.727051
****
O
PQN=2,2 NValence=6 F0ss=0.596246 F0sp=0.579552 F0pp=0.396455 F2pp=0.164673
G1sp=0.409099
ZetaOverlap=3.089585,2.575730
U=-5.958971,-2.358116
Beta=-0.929948,-1.209369 DDN=0,1,0.513019 DDN=1,1,0.435079
CoreKO=0.892190 KON=0,0,0,0.868892 KON=1,0,1,0.429907 KON=0,1,1,1.078572
KON=2,1,1,0.381794 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=1.869335
DipHyp=1.071216
GCore=0.018589,1.385060,1.554456
GCore=0.007263,2.114473,2.308857
****

