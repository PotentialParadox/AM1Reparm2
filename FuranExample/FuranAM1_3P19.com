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

Method=8 CoreType=1 PeptideFC=0.011645 RIJScale=0.459840
****
H
PQN=1 NValence=1 F0ss=0.528591 ZetaOverlap=1.374154 U=-0.471047
Beta=-0.313824 CoreKO=1.176897 KON=0,0,0,1.234444 KON=1,0,1,1.106663
KON=0,1,1,1.052168 KON=2,1,1,1.225922 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.799139
GCore=0.008126,1.582091,2.324769
GCore=0.000385,1.527954,2.619230
GCore=-0.001595,0.349341,3.256270
****
C
PQN=2,2 NValence=4 F0ss=0.296971 F0sp=0.456068 F0pp=0.373147 F2pp=0.129001
G1sp=0.327598
ZetaOverlap=2.047041,1.355533
U=-1.765519,-1.706576
Beta=-0.534163,-0.444634 DDN=0,1,0.789947 DDN=1,1,0.716384
CoreKO=1.246638 KON=0,0,0,1.438409 KON=1,0,1,0.825599 KON=0,1,1,1.400873
KON=2,1,1,0.755941 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.142632
DipHyp=1.849503
GCore=0.000951,2.307553,2.573509
GCore=0.004317,1.079812,3.130894
GCore=-0.001310,1.348740,2.632687
GCore=-0.000084,2.114662,4.307413
****
O
PQN=2,2 NValence=6 F0ss=0.643571 F0sp=0.579552 F0pp=0.396455 F2pp=0.180193
G1sp=0.412815
ZetaOverlap=3.293383,2.575730
U=-6.101029,-2.273465
Beta=-1.058423,-1.360454 DDN=0,1,0.503170 DDN=1,1,0.465803
CoreKO=0.940817 KON=0,0,0,0.845558 KON=1,0,1,0.429907 KON=0,1,1,1.085573
KON=2,1,1,0.384481 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.134511
DipHyp=0.919299
GCore=0.018589,1.548535,1.554456
GCore=0.006463,1.745527,2.308857
****

