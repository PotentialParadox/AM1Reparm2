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

Method=8 CoreType=1 PeptideFC=0.012879 RIJScale=0.377125
****
H
PQN=1 NValence=1 F0ss=0.484676 ZetaOverlap=1.374154 U=-0.482300
Beta=-0.313824 CoreKO=1.244105 KON=0,0,0,0.927044 KON=1,0,1,1.106663
KON=0,1,1,1.146699 KON=2,1,1,1.161178 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.952574
GCore=0.007581,1.435324,1.997040
GCore=0.000359,1.485404,2.897138
GCore=-0.001595,0.367470,3.256270
****
C
PQN=2,2 NValence=4 F0ss=0.339790 F0sp=0.456068 F0pp=0.373147 F2pp=0.129001
G1sp=0.278597
ZetaOverlap=2.236326,1.271191
U=-1.765519,-1.558262
Beta=-0.492547,-0.413235 DDN=0,1,0.781060 DDN=1,1,0.755054
CoreKO=1.066060 KON=0,0,0,1.257415 KON=1,0,1,0.917343 KON=0,1,1,0.961924
KON=2,1,1,0.755941 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.221870
DipHyp=1.657296
GCore=0.000993,2.095471,2.884472
GCore=0.003471,1.079812,3.368405
GCore=-0.001374,1.348740,2.725008
GCore=-0.000084,1.629944,5.202913
****
O
PQN=2,2 NValence=6 F0ss=0.692883 F0sp=0.579552 F0pp=0.396455 F2pp=0.180193
G1sp=0.409099
ZetaOverlap=3.293383,2.256513
U=-5.958971,-2.273465
Beta=-0.929948,-1.209369 DDN=0,1,0.513019 DDN=1,1,0.435079
CoreKO=0.892190 KON=0,0,0,0.953228 KON=1,0,1,0.487108 KON=0,1,1,1.078572
KON=2,1,1,0.497989 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=1.869335
DipHyp=0.919299
GCore=0.018589,1.385060,1.554456
GCore=0.005921,2.366716,2.371550
****

