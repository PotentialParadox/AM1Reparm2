#P AM1(Input,print) Opt Freq

AM1-Reparam Input

0   1
6        0.961043    -0.717636    -0.024522
6       -0.317193    -1.104077    -0.011991
8       -1.194638    -0.017923     0.029283
6       -0.371999     1.062707     0.001393
6        0.944268     0.699000     0.032407
1        1.856992     1.408242     0.026513
1       -0.885276     2.033782     0.041072
1       -0.855512    -2.007400     0.010309
1        1.762640    -1.405311     0.004554

Method=8 CoreType=1 PeptideFC=0.010557 RIJScale=0.489911
****
H
PQN=1 NValence=1 F0ss=0.457729 ZetaOverlap=1.065978 U=-0.388032
Beta=-0.238136 CoreKO=1.114435 KON=0,0,0,1.018616 KON=1,0,1,1.055769
KON=0,1,1,1.072593 KON=2,1,1,1.159083 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.525260
GCore=0.009935,1.398624,2.146190
GCore=0.000363,1.541567,2.717103
GCore=-0.001253,0.508830,4.203930
****
C
PQN=2,2 NValence=4 F0ss=0.426336 F0sp=0.458086 F0pp=0.326162 F2pp=0.203609
G1sp=0.207313
ZetaOverlap=2.101620,1.858719
U=-1.901808,-1.455797
Beta=-0.479256,-0.270063 DDN=0,1,0.803486 DDN=1,1,0.759154
CoreKO=1.132551 KON=0,0,0,1.199625 KON=1,0,1,0.843706 KON=0,1,1,1.047855
KON=2,1,1,0.816811 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.438197
DipHyp=1.587166
GCore=0.000826,1.479874,2.838462
GCore=0.003148,1.667534,3.811620
GCore=-0.001156,1.502971,3.905992
GCore=-0.000092,1.175440,4.852098
****
O
PQN=2,2 NValence=6 F0ss=0.541391 F0sp=0.514548 F0pp=0.509147 F2pp=0.217594
G1sp=0.430262
ZetaOverlap=3.329635,2.524039
U=-3.334320,-2.985424
Beta=-0.908274,-1.134031 DDN=0,1,0.498890 DDN=1,1,0.520627
CoreKO=0.968890 KON=0,0,0,0.897651 KON=1,0,1,0.518676 KON=0,1,1,0.827421
KON=2,1,1,0.531543 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.372200
DipHyp=0.983053
GCore=0.021248,1.174758,1.649954
GCore=0.006405,2.109670,2.714863
****

