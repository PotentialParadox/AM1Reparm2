#P AM1(Input,print) CIS(Singlets,NStates=15) pop(full) force

AM1-Reparam Input

0   1
6        0.955475   -0.715963    0.000000
6       -0.345627   -1.092818    0.000000
8       -1.157305    0.000000    0.000000
6       -0.345627    1.092818    0.000000
6        0.955475    0.715963    0.000000
1        1.810438    1.369382    0.000000
1       -0.840307    2.046884    0.000000
1       -0.840307   -2.046884    0.000000
1        1.810438   -1.369382    0.000000

Method=8 CoreType=1 PeptideFC=0.010875371179558259 RIJScale=0.5545008776788697
****
H
PQN=1 NValence=1 F0ss=0.46813002003129073 ZetaOverlap=1.1988483625269795 U=-0.4536567276161101
Beta=-0.2315023459958073 CoreKO=1.0013357500981432 KON=0,0,0,1.0365782609202339 KON=1,0,1,1.0589979680333443
KON=0,1,1,1.0154735653195894 KON=2,1,1,0.9690131094317345 EISol=-0.4188110042 EHeat=0.0830298228
Alpha=1.5064210023145777
GCore=0.008353555055343445,1.4309930313109378,2.2756273413015076
GCore=0.000353481,1.4173295985939829,3.3342676123210544
GCore=-0.0011930630197846325,0.5600570362,3.864399262368866
****
C
PQN=2,2 NValence=4 F0ss=0.4585464123921133 F0sp=0.4215147623 F0pp=0.36982976787853244 F2pp=0.1898715146
G1sp=0.26858837246373346
ZetaOverlap=1.7467394075517868,1.7223405170534025
U=-1.8757284858520127,-1.4952169445657038
Beta=-0.5684576095667948,-0.3124321142329198 DDN=0,1,0.8293553639230464 DDN=1,1,0.7505034070428481
CoreKO=1.1539409445380866 KON=0,0,0,1.1124284736 KON=1,0,1,0.8388880311944289 KON=0,1,1,1.0642467389317745
KON=2,1,1,0.8431849133375297 EISol=-4.4398989268 EHeat=0.2723305520 Alpha=1.404974774703682
DipHyp=1.675529910270996
GCore=0.0007765240638577356,1.4059353611040302,3.1193971048548303
GCore=0.0030303114563799264,1.3403896587760264,3.3947388589744945
GCore=-0.001477136387129234,1.4145657733999217,3.8062782427404476
GCore=-8.755289747372657e-05,1.3361740600270107,5.406035428897837
****
O
PQN=2,2 NValence=6 F0ss=0.5819363257478573 F0sp=0.5261954113026639 F0pp=0.4711845117951219 F2pp=0.24747408846914543
G1sp=0.4343770262
ZetaOverlap=3.088197638300777,2.333672862647134
U=-3.5951865036,-2.8577642296105443
Beta=-1.0677740860651919,-1.0949978276559895 DDN=0,1,0.5061066820979983 DDN=1,1,0.4679233614748122
CoreKO=0.8801897962457335 KON=0,0,0,0.834988495456317 KON=1,0,1,0.49203052291882393 KON=0,1,1,0.8822957477
KON=2,1,1,0.5438026447733721 EISol=-11.6164441184 EHeat=0.0949133088 Alpha=2.3318994329457374
DipHyp=0.9977372124205051
GCore=0.020671579543789488,1.3906077839974886,1.616555786955923
GCore=0.0056550009,2.0024321961732428,2.790610206271281
****