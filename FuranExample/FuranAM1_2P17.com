#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.970555    -0.681579    -0.031361
6       -0.308035    -1.136746     0.016317
8       -1.155297     0.030588     0.002333
6       -0.388303     1.093600    -0.005405
6        0.910694     0.711780    -0.032200
1        1.841396     1.411490     0.045277
1       -0.856168     2.082999     0.016413
1       -0.792516    -2.084852    -0.027806
1        1.769276    -1.324372    -0.007634

Method=8 CoreType=1 PeptideFC=0.015075 RIJScale=0.377125
****
H
PQN=1 NValence=1 F0ss=0.446797 ZetaOverlap=1.374154 U=-0.471047
Beta=-0.208927 CoreKO=1.278058 KON=0,0,0,1.074837 KON=1,0,1,1.106663
KON=0,1,1,0.781763 KON=2,1,1,1.329870 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.869365
GCore=0.007581,1.309404,2.141131
GCore=0.000386,1.485404,3.038310
GCore=-0.001595,0.349341,2.703101
****
C
PQN=2,2 NValence=4 F0ss=0.339790 F0sp=0.456068 F0pp=0.373147 F2pp=0.129001
G1sp=0.314852
ZetaOverlap=2.236326,1.355533
U=-1.502236,-1.689082
Beta=-0.492547,-0.413235 DDN=0,1,0.781060 DDN=1,1,0.773709
CoreKO=0.944943 KON=0,0,0,1.275208 KON=1,0,1,0.917343 KON=0,1,1,0.961924
KON=2,1,1,0.755941 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.221870
DipHyp=1.702530
GCore=0.000893,2.279790,2.573509
GCore=0.003471,1.079812,3.368405
GCore=-0.001374,1.348740,2.582286
GCore=-0.000084,1.792751,5.202913
****
O
PQN=2,2 NValence=6 F0ss=0.692883 F0sp=0.579552 F0pp=0.396455 F2pp=0.146533
G1sp=0.409099
ZetaOverlap=3.293383,2.256513
U=-5.958971,-2.273465
Beta=-0.929948,-1.209369 DDN=0,1,0.513019 DDN=1,1,0.474407
CoreKO=0.892190 KON=0,0,0,0.795550 KON=1,0,1,0.429907 KON=0,1,1,1.078572
KON=2,1,1,0.384481 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.149379
DipHyp=0.919299
GCore=0.018589,1.385060,1.554456
GCore=0.005921,2.114473,2.163283
****

