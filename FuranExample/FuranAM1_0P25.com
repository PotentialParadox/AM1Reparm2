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

Method=8 CoreType=1 PeptideFC=0.011817 RIJScale=0.421219
****
H
PQN=1 NValence=1 F0ss=0.528591 ZetaOverlap=1.374154 U=-0.442120
Beta=-0.229145 CoreKO=1.176897 KON=0,0,0,1.234444 KON=1,0,1,1.106663
KON=0,1,1,0.781763 KON=2,1,1,1.180996 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.799139
GCore=0.008126,1.574107,2.541127
GCore=0.000385,1.527954,3.305616
GCore=-0.001595,0.349341,3.256270
****
C
PQN=2,2 NValence=4 F0ss=0.375604 F0sp=0.477810 F0pp=0.373147 F2pp=0.129001
G1sp=0.327598
ZetaOverlap=2.268459,1.355533
U=-1.765519,-1.689082
Beta=-0.492547,-0.420963 DDN=0,1,0.789947 DDN=1,1,0.771553
CoreKO=1.100733 KON=0,0,0,1.257415 KON=1,0,1,0.825599 KON=0,1,1,0.961924
KON=2,1,1,0.755941 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.142632
DipHyp=1.849503
GCore=0.000876,1.732790,2.573509
GCore=0.003645,1.079812,3.130894
GCore=-0.001463,1.348740,2.956517
GCore=-0.000084,2.114662,5.137223
****
O
PQN=2,2 NValence=6 F0ss=0.643571 F0sp=0.579552 F0pp=0.459637 F2pp=0.180193
G1sp=0.412815
ZetaOverlap=3.293383,2.340072
U=-6.101029,-2.273465
Beta=-1.009789,-1.360454 DDN=0,1,0.503170 DDN=1,1,0.474407
CoreKO=0.892190 KON=0,0,0,0.868684 KON=1,0,1,0.429907 KON=0,1,1,1.085573
KON=2,1,1,0.384481 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=1.672532
DipHyp=1.016235
GCore=0.018589,1.548535,1.554456
GCore=0.006536,2.366716,2.308857
****

