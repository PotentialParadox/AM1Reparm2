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

Method=8 CoreType=1 PeptideFC=0.013595 RIJScale=0.459840
****
H
PQN=1 NValence=1 F0ss=0.435964 ZetaOverlap=1.374154 U=-0.442120
Beta=-0.298320 CoreKO=1.278058 KON=0,0,0,0.987164 KON=1,0,1,1.106663
KON=0,1,1,0.864938 KON=2,1,1,1.329870 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.799139
GCore=0.007581,1.582091,2.229431
GCore=0.000386,1.485404,2.709935
GCore=-0.001595,0.349341,2.648858
****
C
PQN=2,2 NValence=4 F0ss=0.326899 F0sp=0.456068 F0pp=0.373147 F2pp=0.129001
G1sp=0.263764
ZetaOverlap=2.009621,1.271191
U=-1.765519,-1.689082
Beta=-0.492547,-0.353952 DDN=0,1,0.789947 DDN=1,1,0.761103
CoreKO=1.066060 KON=0,0,0,1.275208 KON=1,0,1,0.821970 KON=0,1,1,0.912687
KON=2,1,1,0.755941 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.147993
DipHyp=1.640260
GCore=0.000894,1.732790,2.573509
GCore=0.003064,1.079812,3.623512
GCore=-0.001374,1.348740,2.725008
GCore=-0.000084,1.629944,5.202913
****
O
PQN=2,2 NValence=6 F0ss=0.643571 F0sp=0.592245 F0pp=0.341377 F2pp=0.180193
G1sp=0.409099
ZetaOverlap=3.293383,2.575730
U=-6.315328,-2.358116
Beta=-1.049173,-1.209369 DDN=0,1,0.503170 DDN=1,1,0.435079
CoreKO=0.892190 KON=0,0,0,0.941005 KON=1,0,1,0.429907 KON=0,1,1,1.078572
KON=2,1,1,0.497989 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.090586
DipHyp=1.071216
GCore=0.018589,1.385060,1.554456
GCore=0.006714,2.366716,2.308857
****

