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

Method=8 CoreType=1 PeptideFC=0.015075 RIJScale=0.421219
****
H
PQN=1 NValence=1 F0ss=0.446797 ZetaOverlap=1.374154 U=-0.471047
Beta=-0.227712 CoreKO=0.964854 KON=0,0,0,1.234444 KON=1,0,1,1.106663
KON=0,1,1,0.781763 KON=2,1,1,1.099762 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.799139
GCore=0.007581,1.582091,2.055746
GCore=0.000381,1.462922,3.492576
GCore=-0.001595,0.349341,2.550225
****
C
PQN=2,2 NValence=4 F0ss=0.345481 F0sp=0.411659 F0pp=0.373147 F2pp=0.145003
G1sp=0.278597
ZetaOverlap=2.009621,1.173901
U=-1.765519,-1.689082
Beta=-0.573118,-0.420963 DDN=0,1,0.697809 DDN=1,1,0.678464
CoreKO=1.088883 KON=0,0,0,1.275208 KON=1,0,1,0.821970 KON=0,1,1,0.961924
KON=2,1,1,0.781830 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.142632
DipHyp=1.657296
GCore=0.000893,1.828223,2.573509
GCore=0.003471,0.857114,3.137724
GCore=-0.001542,1.608695,2.725008
GCore=-0.000084,1.792751,5.128017
****
O
PQN=2,2 NValence=6 F0ss=0.692883 F0sp=0.579552 F0pp=0.396455 F2pp=0.164673
G1sp=0.455409
ZetaOverlap=3.416080,2.376837
U=-5.958971,-2.273465
Beta=-1.058423,-1.209369 DDN=0,1,0.552148 DDN=1,1,0.435079
CoreKO=1.015847 KON=0,0,0,0.868892 KON=1,0,1,0.440509 KON=0,1,1,0.854808
KON=2,1,1,0.384481 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.149379
DipHyp=0.945961
GCore=0.018589,1.385060,1.554456
GCore=0.005921,2.114473,2.163283
****

