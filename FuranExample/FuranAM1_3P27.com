#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.918849    -0.760767    -0.008496
6       -0.300155    -1.128205     0.004534
8       -1.157509     0.035618    -0.039177
6       -0.322273     1.129487     0.021236
6        0.983295     0.687086     0.024486
1        1.793990     1.356733    -0.028934
1       -0.834503     2.026513     0.001354
1       -0.873835    -2.032627     0.007242
1        1.769000    -1.326640     0.030682

Method=8 CoreType=1 PeptideFC=0.011817 RIJScale=0.421219
****
H
PQN=1 NValence=1 F0ss=0.528591 ZetaOverlap=1.374154 U=-0.471047
Beta=-0.208927 CoreKO=1.278058 KON=0,0,0,1.054290 KON=1,0,1,1.154782
KON=0,1,1,1.052168 KON=2,1,1,1.161178 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.799139
GCore=0.007581,1.413646,2.229431
GCore=0.000385,1.527954,3.492576
GCore=-0.001595,0.349341,2.550225
****
C
PQN=2,2 NValence=4 F0ss=0.345481 F0sp=0.477810 F0pp=0.373147 F2pp=0.129001
G1sp=0.278597
ZetaOverlap=2.047041,1.293519
U=-1.765519,-1.689082
Beta=-0.573118,-0.413235 DDN=0,1,0.789947 DDN=1,1,0.773709
CoreKO=1.246638 KON=0,0,0,1.275208 KON=1,0,1,0.825599 KON=0,1,1,0.961924
KON=2,1,1,0.755941 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.142632
DipHyp=1.849503
GCore=0.000941,1.828223,2.573509
GCore=0.003471,1.079812,3.130894
GCore=-0.001357,1.534141,2.956517
GCore=-0.000084,1.792751,5.128017
****
O
PQN=2,2 NValence=6 F0ss=0.643571 F0sp=0.579552 F0pp=0.396455 F2pp=0.164673
G1sp=0.409099
ZetaOverlap=3.293383,2.376837
U=-5.958971,-2.238114
Beta=-1.058423,-1.209369 DDN=0,1,0.503170 DDN=1,1,0.435079
CoreKO=1.015847 KON=0,0,0,0.953228 KON=1,0,1,0.429907 KON=0,1,1,0.747596
KON=2,1,1,0.398537 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=1.672532
DipHyp=0.919299
GCore=0.018589,1.385060,1.554456
GCore=0.006536,2.366716,2.741663
****

