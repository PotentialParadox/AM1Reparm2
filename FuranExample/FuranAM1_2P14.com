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

Method=8 CoreType=1 PeptideFC=0.011817 RIJScale=0.377125
****
H
PQN=1 NValence=1 F0ss=0.512287 ZetaOverlap=1.370611 U=-0.421673
Beta=-0.298320 CoreKO=1.278058 KON=0,0,0,1.004973 KON=1,0,1,1.106663
KON=0,1,1,0.864938 KON=2,1,1,1.161178 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.952574
GCore=0.007581,1.338173,2.473804
GCore=0.000359,1.485404,3.038310
GCore=-0.001595,0.349341,2.648858
****
C
PQN=2,2 NValence=4 F0ss=0.339790 F0sp=0.456068 F0pp=0.373147 F2pp=0.129001
G1sp=0.278597
ZetaOverlap=2.236326,1.355533
U=-1.765519,-1.689082
Beta=-0.492547,-0.413235 DDN=0,1,0.789947 DDN=1,1,0.865968
CoreKO=1.246638 KON=0,0,0,1.180269 KON=1,0,1,0.812321 KON=0,1,1,1.252576
KON=2,1,1,0.755941 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.221870
DipHyp=1.889786
GCore=0.000894,2.095471,2.573509
GCore=0.003471,1.079812,3.368405
GCore=-0.001403,1.348740,2.725008
GCore=-0.000084,2.513556,5.202913
****
O
PQN=2,2 NValence=6 F0ss=0.692883 F0sp=0.579552 F0pp=0.396455 F2pp=0.204745
G1sp=0.469760
ZetaOverlap=3.293383,2.575730
U=-5.958971,-2.358116
Beta=-0.929948,-1.209369 DDN=0,1,0.503170 DDN=1,1,0.435079
CoreKO=0.892190 KON=0,0,0,0.953228 KON=1,0,1,0.429907 KON=0,1,1,1.078572
KON=2,1,1,0.497989 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=1.869335
DipHyp=0.919299
GCore=0.019628,1.479134,1.554456
GCore=0.005921,2.366716,2.308857
****

