#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.951197    -0.719232     0.028147
6       -0.381139    -1.129248    -0.024124
8       -1.111905    -0.020725     0.026095
6       -0.344915     1.081151     0.023481
6        0.921535     0.758186     0.035971
1        1.807970     1.327512    -0.040335
1       -0.869302     2.014904    -0.018529
1       -0.823689    -2.053414    -0.020512
1        1.800998    -1.336511     0.043865

Method=8 CoreType=1 PeptideFC=0.011817 RIJScale=0.377125
****
H
PQN=1 NValence=1 F0ss=0.512374 ZetaOverlap=1.374154 U=-0.482300
Beta=-0.277147 CoreKO=1.184727 KON=0,0,0,1.234444 KON=1,0,1,1.116147
KON=0,1,1,0.784106 KON=2,1,1,1.180996 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.952574
GCore=0.007581,1.435324,2.324769
GCore=0.000386,1.485404,3.038310
GCore=-0.001595,0.333133,2.648858
****
C
PQN=2,2 NValence=4 F0ss=0.382648 F0sp=0.456068 F0pp=0.373147 F2pp=0.137312
G1sp=0.278597
ZetaOverlap=2.236326,1.355533
U=-1.765519,-1.710617
Beta=-0.492547,-0.413235 DDN=0,1,0.781060 DDN=1,1,0.755054
CoreKO=1.031194 KON=0,0,0,1.275208 KON=1,0,1,0.917343 KON=0,1,1,0.961924
KON=2,1,1,0.781830 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.142632
DipHyp=1.657296
GCore=0.000951,1.944760,2.573509
GCore=0.003528,0.860116,3.368405
GCore=-0.001463,1.348740,2.725008
GCore=-0.000084,1.792751,5.202913
****
O
PQN=2,2 NValence=6 F0ss=0.692883 F0sp=0.579251 F0pp=0.396455 F2pp=0.180193
G1sp=0.409099
ZetaOverlap=3.416080,2.256513
U=-5.258088,-2.273465
Beta=-1.058423,-1.355712 DDN=0,1,0.513019 DDN=1,1,0.386433
CoreKO=0.892190 KON=0,0,0,0.795550 KON=1,0,1,0.429907 KON=0,1,1,0.854808
KON=2,1,1,0.396662 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=1.869335
DipHyp=0.919299
GCore=0.018589,1.385060,1.554456
GCore=0.005921,2.430972,2.308857
****

