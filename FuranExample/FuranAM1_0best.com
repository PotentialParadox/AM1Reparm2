#P AM1(Input,print) opt

AM1-Reparam Input

0   1
6        0.978959    -0.717454     0.029704
6       -0.369572    -1.047486    -0.024220
8       -1.125458     0.009435    -0.042080
6       -0.394168     1.071384    -0.016084
6        1.001621     0.734900     0.003615
1        1.804946     1.349317     0.016339
1       -0.889930     2.072109     0.038583
1       -0.829777    -2.065046    -0.010801
1        1.840118    -1.377623     0.031069

Method=8 CoreType=1 PeptideFC=0.011451 RIJScale=0.523165
****
H
PQN=1 NValence=1 F0ss=0.472155 ZetaOverlap=1.239722 U=-0.418811
Beta=-0.226883 CoreKO=1.094041 KON=0,0,0,1.058920 KON=1,0,1,1.058920
KON=0,1,1,1.058920 KON=2,1,1,1.060753 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.525260
GCore=0.008144,1.400143,2.271761
GCore=0.000369,1.369896,3.476287
GCore=-0.001273,0.560057,3.785600
****
C
PQN=2,2 NValence=4 F0ss=0.444329 F0sp=0.412832 F0pp=0.388065 F2pp=0.192841
G1sp=0.277224
ZetaOverlap=1.808665,1.690018
U=-1.912044,-1.455797
Beta=-0.585051,-0.297562 DDN=0,1,0.878829 DDN=1,1,0.726801
CoreKO=1.112428 KON=0,0,0,1.112428 KON=1,0,1,0.821970 KON=0,1,1,1.142154
KON=2,1,1,0.761680 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.401406
DipHyp=1.648288
GCore=0.000806,1.429597,3.023562
GCore=0.003189,1.258508,3.430820
GCore=-0.001338,1.400143,3.873939
GCore=-0.000088,1.468858,5.007774
****
O
PQN=2,2 NValence=6 F0ss=0.566675 F0sp=0.531015 F0pp=0.495871 F2pp=0.234313
G1sp=0.434377
ZetaOverlap=3.014233,2.524039
U=-3.595187,-2.908318
Beta=-1.075755,-1.075755 DDN=0,1,0.498890 DDN=1,1,0.475282
CoreKO=0.882296 KON=0,0,0,0.882296 KON=1,0,1,0.501954 KON=0,1,1,0.884563
KON=2,1,1,0.551558 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.418858
DipHyp=0.997722
GCore=0.019334,1.354698,1.537906
GCore=0.005655,1.960200,2.814578
****
