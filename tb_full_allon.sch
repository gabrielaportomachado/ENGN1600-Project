v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -370 -30 -370 0 {lab=RSTn}
N -445 -100 -420 -100 {lab=MODE}
N -320 -105 -280 -105 {lab=MODE_cfg}
N -320 -85 -280 -85 {lab=MODE_cfgb}
N -470 -80 -420 -80 {lab=clk}
N -380 -190 -380 -160 {lab=vdd}
N -450 0 -450 25 {lab=GND}
C {DFF/DFF.sym} -400 -50 0 0 {name=x_modedff}
C {gnd.sym} -450 25 0 0 {name=l1 lab=GND}
C {vdd.sym} -380 -190 0 0 {name=l2 lab=vdd}
C {lab_wire.sym} -360 -185 2 0 {name=p13 sig_type=std_logic lab=GND}
C {lab_wire.sym} -305 -105 2 0 {name=p2 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} -305 -85 2 0 {name=p3 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} -445 -100 0 0 {name=p_MODE_in sig_type=std_logic lab=MODE}
C {lab_wire.sym} -370 0 1 0 {name=p_RSTn_in sig_type=std_logic lab=RSTn}
C {lab_wire.sym} -470 -80 0 0 {name=p_clk_in sig_type=std_logic lab=clk}
C {vsource.sym} -700 -100 0 0 {name=V_RSTn value=0 savecurrent=false}
C {gnd.sym} -700 -70 0 0 {name=l_RSTn lab=GND}
C {lab_wire.sym} -700 -130 3 0 {name=p_RSTn sig_type=std_logic lab=RSTn}
C {vsource.sym} -800 -100 0 0 {name=V_clk value=0 savecurrent=false}
C {gnd.sym} -800 -70 0 0 {name=l_clk lab=GND}
C {lab_wire.sym} -800 -130 3 0 {name=p_clk sig_type=std_logic lab=clk}
C {vsource.sym} -900 -100 0 0 {name=V_MODE value=0 savecurrent=false}
C {gnd.sym} -900 -70 0 0 {name=l_MODE lab=GND}
C {lab_wire.sym} -900 -130 3 0 {name=p_MODE sig_type=std_logic lab=MODE}
C {vsource.sym} -1000 -100 0 0 {name=V_vdd value=3.3 savecurrent=false}
C {gnd.sym} -1000 -70 0 0 {name=l_vdd lab=GND}
C {lab_wire.sym} -1000 -130 3 0 {name=p_vdd sig_type=std_logic lab=vdd}
C {row.sym} 95 -80 0 0 {name=x1}
C {row.sym} 95 185 0 0 {name=x3}
C {row.sym} 95 455 0 0 {name=x4}
C {row.sym} 95 720 0 0 {name=x5}
C {row.sym} 95 995 0 0 {name=x6}
C {row.sym} 95 1260 0 0 {name=x7}
C {row.sym} 95 1530 0 0 {name=x8}
C {row.sym} 95 1795 0 0 {name=x9}
C {row.sym} 95 2115 0 0 {name=x10}
C {row.sym} 95 2380 0 0 {name=x11}
C {row.sym} 95 2650 0 0 {name=x12}
C {row.sym} 95 2915 0 0 {name=x13}
C {row.sym} 95 3210 0 0 {name=x14}
C {row.sym} 95 3475 0 0 {name=x15}
C {row.sym} 95 3745 0 0 {name=x16}
C {row.sym} 95 4010 0 0 {name=x17}
C {lab_wire.sym} 50 -155 0 0 {name=p_mc0 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 -155 0 0 {name=p_rs0 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 -155 0 0 {name=p_ck0 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 -155 0 0 {name=p_mb0 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 110 0 0 {name=p_mc1 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 110 0 0 {name=p_rs1 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 110 0 0 {name=p_ck1 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 110 0 0 {name=p_mb1 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 380 0 0 {name=p_mc2 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 380 0 0 {name=p_rs2 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 380 0 0 {name=p_ck2 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 380 0 0 {name=p_mb2 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 645 0 0 {name=p_mc3 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 645 0 0 {name=p_rs3 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 645 0 0 {name=p_ck3 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 645 0 0 {name=p_mb3 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 920 0 0 {name=p_mc4 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 920 0 0 {name=p_rs4 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 920 0 0 {name=p_ck4 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 920 0 0 {name=p_mb4 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 1185 0 0 {name=p_mc5 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 1185 0 0 {name=p_rs5 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 1185 0 0 {name=p_ck5 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 1185 0 0 {name=p_mb5 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 1455 0 0 {name=p_mc6 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 1455 0 0 {name=p_rs6 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 1455 0 0 {name=p_ck6 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 1455 0 0 {name=p_mb6 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 1720 0 0 {name=p_mc7 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 1720 0 0 {name=p_rs7 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 1720 0 0 {name=p_ck7 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 1720 0 0 {name=p_mb7 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 2040 0 0 {name=p_mc8 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 2040 0 0 {name=p_rs8 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 2040 0 0 {name=p_ck8 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 2040 0 0 {name=p_mb8 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 2305 0 0 {name=p_mc9 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 2305 0 0 {name=p_rs9 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 2305 0 0 {name=p_ck9 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 2305 0 0 {name=p_mb9 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 2575 0 0 {name=p_mc10 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 2575 0 0 {name=p_rs10 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 2575 0 0 {name=p_ck10 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 2575 0 0 {name=p_mb10 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 2840 0 0 {name=p_mc11 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 2840 0 0 {name=p_rs11 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 2840 0 0 {name=p_ck11 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 2840 0 0 {name=p_mb11 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 3135 0 0 {name=p_mc12 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 3135 0 0 {name=p_rs12 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 3135 0 0 {name=p_ck12 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 3135 0 0 {name=p_mb12 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 3400 0 0 {name=p_mc13 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 3400 0 0 {name=p_rs13 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 3400 0 0 {name=p_ck13 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 3400 0 0 {name=p_mb13 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 3670 0 0 {name=p_mc14 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 3670 0 0 {name=p_rs14 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 3670 0 0 {name=p_ck14 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 3670 0 0 {name=p_mb14 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} 50 3935 0 0 {name=p_mc15 sig_type=std_logic lab=MODE_cfg}
C {lab_wire.sym} 80 3935 0 0 {name=p_rs15 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 120 3935 0 0 {name=p_ck15 sig_type=std_logic lab=clk}
C {lab_wire.sym} 150 3935 0 0 {name=p_mb15 sig_type=std_logic lab=MODE_cfgb}
C {lab_wire.sym} -20 -65 0 0 {name=pE0_at_row sig_type=std_logic lab=E0}
C {lab_wire.sym} -20 -105 0 0 {name=pEN0_at_row sig_type=std_logic lab=EN0}
C {lab_wire.sym} 220 -125 0 0 {name=pIPG0_at_row sig_type=std_logic lab=IPG0}
C {lab_wire.sym} 220 -25 0 0 {name=pREC0_at_row sig_type=std_logic lab=REC0}
C {lab_wire.sym} -20 200 0 0 {name=pE1_at_row sig_type=std_logic lab=E1}
C {lab_wire.sym} -20 160 0 0 {name=pEN1_at_row sig_type=std_logic lab=EN1}
C {lab_wire.sym} 220 140 0 0 {name=pIPG1_at_row sig_type=std_logic lab=IPG1}
C {lab_wire.sym} 220 240 0 0 {name=pREC1_at_row sig_type=std_logic lab=REC1}
C {lab_wire.sym} -20 470 0 0 {name=pE2_at_row sig_type=std_logic lab=E2}
C {lab_wire.sym} -20 430 0 0 {name=pEN2_at_row sig_type=std_logic lab=EN2}
C {lab_wire.sym} 220 410 0 0 {name=pIPG2_at_row sig_type=std_logic lab=IPG2}
C {lab_wire.sym} 220 510 0 0 {name=pREC2_at_row sig_type=std_logic lab=REC2}
C {lab_wire.sym} -20 735 0 0 {name=pE3_at_row sig_type=std_logic lab=E3}
C {lab_wire.sym} -20 695 0 0 {name=pEN3_at_row sig_type=std_logic lab=EN3}
C {lab_wire.sym} 220 675 0 0 {name=pIPG3_at_row sig_type=std_logic lab=IPG3}
C {lab_wire.sym} 220 775 0 0 {name=pREC3_at_row sig_type=std_logic lab=REC3}
C {lab_wire.sym} -20 1010 0 0 {name=pE4_at_row sig_type=std_logic lab=E4}
C {lab_wire.sym} -20 970 0 0 {name=pEN4_at_row sig_type=std_logic lab=EN4}
C {lab_wire.sym} 220 950 0 0 {name=pIPG4_at_row sig_type=std_logic lab=IPG4}
C {lab_wire.sym} 220 1050 0 0 {name=pREC4_at_row sig_type=std_logic lab=REC4}
C {lab_wire.sym} -20 1275 0 0 {name=pE5_at_row sig_type=std_logic lab=E5}
C {lab_wire.sym} -20 1235 0 0 {name=pEN5_at_row sig_type=std_logic lab=EN5}
C {lab_wire.sym} 220 1215 0 0 {name=pIPG5_at_row sig_type=std_logic lab=IPG5}
C {lab_wire.sym} 220 1315 0 0 {name=pREC5_at_row sig_type=std_logic lab=REC5}
C {lab_wire.sym} -20 1545 0 0 {name=pE6_at_row sig_type=std_logic lab=E6}
C {lab_wire.sym} -20 1505 0 0 {name=pEN6_at_row sig_type=std_logic lab=EN6}
C {lab_wire.sym} 220 1485 0 0 {name=pIPG6_at_row sig_type=std_logic lab=IPG6}
C {lab_wire.sym} 220 1585 0 0 {name=pREC6_at_row sig_type=std_logic lab=REC6}
C {lab_wire.sym} -20 1810 0 0 {name=pE7_at_row sig_type=std_logic lab=E7}
C {lab_wire.sym} -20 1770 0 0 {name=pEN7_at_row sig_type=std_logic lab=EN7}
C {lab_wire.sym} 220 1750 0 0 {name=pIPG7_at_row sig_type=std_logic lab=IPG7}
C {lab_wire.sym} 220 1850 0 0 {name=pREC7_at_row sig_type=std_logic lab=REC7}
C {lab_wire.sym} -20 2130 0 0 {name=pE8_at_row sig_type=std_logic lab=E8}
C {lab_wire.sym} -20 2090 0 0 {name=pEN8_at_row sig_type=std_logic lab=EN8}
C {lab_wire.sym} 220 2070 0 0 {name=pIPG8_at_row sig_type=std_logic lab=IPG8}
C {lab_wire.sym} 220 2170 0 0 {name=pREC8_at_row sig_type=std_logic lab=REC8}
C {lab_wire.sym} -20 2395 0 0 {name=pE9_at_row sig_type=std_logic lab=E9}
C {lab_wire.sym} -20 2355 0 0 {name=pEN9_at_row sig_type=std_logic lab=EN9}
C {lab_wire.sym} 220 2335 0 0 {name=pIPG9_at_row sig_type=std_logic lab=IPG9}
C {lab_wire.sym} 220 2435 0 0 {name=pREC9_at_row sig_type=std_logic lab=REC9}
C {lab_wire.sym} -20 2665 0 0 {name=pE10_at_row sig_type=std_logic lab=E10}
C {lab_wire.sym} -20 2625 0 0 {name=pEN10_at_row sig_type=std_logic lab=EN10}
C {lab_wire.sym} 220 2605 0 0 {name=pIPG10_at_row sig_type=std_logic lab=IPG10}
C {lab_wire.sym} 220 2705 0 0 {name=pREC10_at_row sig_type=std_logic lab=REC10}
C {lab_wire.sym} -20 2930 0 0 {name=pE11_at_row sig_type=std_logic lab=E11}
C {lab_wire.sym} -20 2890 0 0 {name=pEN11_at_row sig_type=std_logic lab=EN11}
C {lab_wire.sym} 220 2870 0 0 {name=pIPG11_at_row sig_type=std_logic lab=IPG11}
C {lab_wire.sym} 220 2970 0 0 {name=pREC11_at_row sig_type=std_logic lab=REC11}
C {lab_wire.sym} -20 3225 0 0 {name=pE12_at_row sig_type=std_logic lab=E12}
C {lab_wire.sym} -20 3185 0 0 {name=pEN12_at_row sig_type=std_logic lab=EN12}
C {lab_wire.sym} 220 3165 0 0 {name=pIPG12_at_row sig_type=std_logic lab=IPG12}
C {lab_wire.sym} 220 3265 0 0 {name=pREC12_at_row sig_type=std_logic lab=REC12}
C {lab_wire.sym} -20 3490 0 0 {name=pE13_at_row sig_type=std_logic lab=E13}
C {lab_wire.sym} -20 3450 0 0 {name=pEN13_at_row sig_type=std_logic lab=EN13}
C {lab_wire.sym} 220 3430 0 0 {name=pIPG13_at_row sig_type=std_logic lab=IPG13}
C {lab_wire.sym} 220 3530 0 0 {name=pREC13_at_row sig_type=std_logic lab=REC13}
C {lab_wire.sym} -20 3760 0 0 {name=pE14_at_row sig_type=std_logic lab=E14}
C {lab_wire.sym} -20 3720 0 0 {name=pEN14_at_row sig_type=std_logic lab=EN14}
C {lab_wire.sym} 220 3700 0 0 {name=pIPG14_at_row sig_type=std_logic lab=IPG14}
C {lab_wire.sym} 220 3800 0 0 {name=pREC14_at_row sig_type=std_logic lab=REC14}
C {lab_wire.sym} -20 4025 0 0 {name=pE15_at_row sig_type=std_logic lab=E15}
C {lab_wire.sym} -20 3985 0 0 {name=pEN15_at_row sig_type=std_logic lab=EN15}
C {lab_wire.sym} 220 3965 0 0 {name=pIPG15_at_row sig_type=std_logic lab=IPG15}
C {lab_wire.sym} 220 4065 0 0 {name=pREC15_at_row sig_type=std_logic lab=REC15}
C {vsource.sym} -550 -80 0 0 {name=V_EN0 value=0 savecurrent=false}
C {gnd.sym} -550 -50 0 0 {name=lEN0 lab=GND}
C {lab_wire.sym} -550 -110 3 0 {name=pEN0 sig_type=std_logic lab=EN0}
C {vsource.sym} -450 -80 0 0 {name=V_E0 value=0.2 savecurrent=false}
C {gnd.sym} -450 -50 0 0 {name=lE0 lab=GND}
C {lab_wire.sym} -450 -110 3 0 {name=pE0 sig_type=std_logic lab=E0}
C {vsource.sym} -550 185 0 0 {name=V_EN1 value=0 savecurrent=false}
C {gnd.sym} -550 215 0 0 {name=lEN1 lab=GND}
C {lab_wire.sym} -550 155 3 0 {name=pEN1 sig_type=std_logic lab=EN1}
C {vsource.sym} -450 185 0 0 {name=V_E1 value=0.4 savecurrent=false}
C {gnd.sym} -450 215 0 0 {name=lE1 lab=GND}
C {lab_wire.sym} -450 155 3 0 {name=pE1 sig_type=std_logic lab=E1}
C {vsource.sym} -550 455 0 0 {name=V_EN2 value=0 savecurrent=false}
C {gnd.sym} -550 485 0 0 {name=lEN2 lab=GND}
C {lab_wire.sym} -550 425 3 0 {name=pEN2 sig_type=std_logic lab=EN2}
C {vsource.sym} -450 455 0 0 {name=V_E2 value=0.6 savecurrent=false}
C {gnd.sym} -450 485 0 0 {name=lE2 lab=GND}
C {lab_wire.sym} -450 425 3 0 {name=pE2 sig_type=std_logic lab=E2}
C {vsource.sym} -550 720 0 0 {name=V_EN3 value=0 savecurrent=false}
C {gnd.sym} -550 750 0 0 {name=lEN3 lab=GND}
C {lab_wire.sym} -550 690 3 0 {name=pEN3 sig_type=std_logic lab=EN3}
C {vsource.sym} -450 720 0 0 {name=V_E3 value=0.8 savecurrent=false}
C {gnd.sym} -450 750 0 0 {name=lE3 lab=GND}
C {lab_wire.sym} -450 690 3 0 {name=pE3 sig_type=std_logic lab=E3}
C {vsource.sym} -550 995 0 0 {name=V_EN4 value=0 savecurrent=false}
C {gnd.sym} -550 1025 0 0 {name=lEN4 lab=GND}
C {lab_wire.sym} -550 965 3 0 {name=pEN4 sig_type=std_logic lab=EN4}
C {vsource.sym} -450 995 0 0 {name=V_E4 value=1.0 savecurrent=false}
C {gnd.sym} -450 1025 0 0 {name=lE4 lab=GND}
C {lab_wire.sym} -450 965 3 0 {name=pE4 sig_type=std_logic lab=E4}
C {vsource.sym} -550 1260 0 0 {name=V_EN5 value=0 savecurrent=false}
C {gnd.sym} -550 1290 0 0 {name=lEN5 lab=GND}
C {lab_wire.sym} -550 1230 3 0 {name=pEN5 sig_type=std_logic lab=EN5}
C {vsource.sym} -450 1260 0 0 {name=V_E5 value=1.2 savecurrent=false}
C {gnd.sym} -450 1290 0 0 {name=lE5 lab=GND}
C {lab_wire.sym} -450 1230 3 0 {name=pE5 sig_type=std_logic lab=E5}
C {vsource.sym} -550 1530 0 0 {name=V_EN6 value=0 savecurrent=false}
C {gnd.sym} -550 1560 0 0 {name=lEN6 lab=GND}
C {lab_wire.sym} -550 1500 3 0 {name=pEN6 sig_type=std_logic lab=EN6}
C {vsource.sym} -450 1530 0 0 {name=V_E6 value=1.4 savecurrent=false}
C {gnd.sym} -450 1560 0 0 {name=lE6 lab=GND}
C {lab_wire.sym} -450 1500 3 0 {name=pE6 sig_type=std_logic lab=E6}
C {vsource.sym} -550 1795 0 0 {name=V_EN7 value=0 savecurrent=false}
C {gnd.sym} -550 1825 0 0 {name=lEN7 lab=GND}
C {lab_wire.sym} -550 1765 3 0 {name=pEN7 sig_type=std_logic lab=EN7}
C {vsource.sym} -450 1795 0 0 {name=V_E7 value=1.6 savecurrent=false}
C {gnd.sym} -450 1825 0 0 {name=lE7 lab=GND}
C {lab_wire.sym} -450 1765 3 0 {name=pE7 sig_type=std_logic lab=E7}
C {vsource.sym} -550 2115 0 0 {name=V_EN8 value=0 savecurrent=false}
C {gnd.sym} -550 2145 0 0 {name=lEN8 lab=GND}
C {lab_wire.sym} -550 2085 3 0 {name=pEN8 sig_type=std_logic lab=EN8}
C {vsource.sym} -450 2115 0 0 {name=V_E8 value=1.8 savecurrent=false}
C {gnd.sym} -450 2145 0 0 {name=lE8 lab=GND}
C {lab_wire.sym} -450 2085 3 0 {name=pE8 sig_type=std_logic lab=E8}
C {vsource.sym} -550 2380 0 0 {name=V_EN9 value=0 savecurrent=false}
C {gnd.sym} -550 2410 0 0 {name=lEN9 lab=GND}
C {lab_wire.sym} -550 2350 3 0 {name=pEN9 sig_type=std_logic lab=EN9}
C {vsource.sym} -450 2380 0 0 {name=V_E9 value=2.0 savecurrent=false}
C {gnd.sym} -450 2410 0 0 {name=lE9 lab=GND}
C {lab_wire.sym} -450 2350 3 0 {name=pE9 sig_type=std_logic lab=E9}
C {vsource.sym} -550 2650 0 0 {name=V_EN10 value=0 savecurrent=false}
C {gnd.sym} -550 2680 0 0 {name=lEN10 lab=GND}
C {lab_wire.sym} -550 2620 3 0 {name=pEN10 sig_type=std_logic lab=EN10}
C {vsource.sym} -450 2650 0 0 {name=V_E10 value=2.2 savecurrent=false}
C {gnd.sym} -450 2680 0 0 {name=lE10 lab=GND}
C {lab_wire.sym} -450 2620 3 0 {name=pE10 sig_type=std_logic lab=E10}
C {vsource.sym} -550 2915 0 0 {name=V_EN11 value=0 savecurrent=false}
C {gnd.sym} -550 2945 0 0 {name=lEN11 lab=GND}
C {lab_wire.sym} -550 2885 3 0 {name=pEN11 sig_type=std_logic lab=EN11}
C {vsource.sym} -450 2915 0 0 {name=V_E11 value=2.4 savecurrent=false}
C {gnd.sym} -450 2945 0 0 {name=lE11 lab=GND}
C {lab_wire.sym} -450 2885 3 0 {name=pE11 sig_type=std_logic lab=E11}
C {vsource.sym} -550 3210 0 0 {name=V_EN12 value=0 savecurrent=false}
C {gnd.sym} -550 3240 0 0 {name=lEN12 lab=GND}
C {lab_wire.sym} -550 3180 3 0 {name=pEN12 sig_type=std_logic lab=EN12}
C {vsource.sym} -450 3210 0 0 {name=V_E12 value=2.6 savecurrent=false}
C {gnd.sym} -450 3240 0 0 {name=lE12 lab=GND}
C {lab_wire.sym} -450 3180 3 0 {name=pE12 sig_type=std_logic lab=E12}
C {vsource.sym} -550 3475 0 0 {name=V_EN13 value=0 savecurrent=false}
C {gnd.sym} -550 3505 0 0 {name=lEN13 lab=GND}
C {lab_wire.sym} -550 3445 3 0 {name=pEN13 sig_type=std_logic lab=EN13}
C {vsource.sym} -450 3475 0 0 {name=V_E13 value=2.8 savecurrent=false}
C {gnd.sym} -450 3505 0 0 {name=lE13 lab=GND}
C {lab_wire.sym} -450 3445 3 0 {name=pE13 sig_type=std_logic lab=E13}
C {vsource.sym} -550 3745 0 0 {name=V_EN14 value=0 savecurrent=false}
C {gnd.sym} -550 3775 0 0 {name=lEN14 lab=GND}
C {lab_wire.sym} -550 3715 3 0 {name=pEN14 sig_type=std_logic lab=EN14}
C {vsource.sym} -450 3745 0 0 {name=V_E14 value=3.0 savecurrent=false}
C {gnd.sym} -450 3775 0 0 {name=lE14 lab=GND}
C {lab_wire.sym} -450 3715 3 0 {name=pE14 sig_type=std_logic lab=E14}
C {vsource.sym} -550 4010 0 0 {name=V_EN15 value=0 savecurrent=false}
C {gnd.sym} -550 4040 0 0 {name=lEN15 lab=GND}
C {lab_wire.sym} -550 3980 3 0 {name=pEN15 sig_type=std_logic lab=EN15}
C {vsource.sym} -450 4010 0 0 {name=V_E15 value=3.2 savecurrent=false}
C {gnd.sym} -450 4040 0 0 {name=lE15 lab=GND}
C {lab_wire.sym} -450 3980 3 0 {name=pE15 sig_type=std_logic lab=E15}
C {res.sym} 320 -95 0 0 {name=R_IPG0 value=100k device=resistor m=1}
C {gnd.sym} 320 -65 0 0 {name=lR_IPG0 lab=GND}
C {lab_wire.sym} 320 -125 3 0 {name=pR_IPG0 sig_type=std_logic lab=IPG0}
C {capa.sym} 380 -95 0 0 {name=C_IPG0 value=10f}
C {gnd.sym} 380 -65 0 0 {name=lC_IPG0 lab=GND}
C {lab_wire.sym} 380 -125 3 0 {name=pC_IPG0 sig_type=std_logic lab=IPG0}
C {res.sym} 320 5 0 0 {name=R_REC0 value=100k device=resistor m=1}
C {gnd.sym} 320 35 0 0 {name=lR_REC0 lab=GND}
C {lab_wire.sym} 320 -25 3 0 {name=pR_REC0 sig_type=std_logic lab=REC0}
C {capa.sym} 380 5 0 0 {name=C_REC0 value=10f}
C {gnd.sym} 380 35 0 0 {name=lC_REC0 lab=GND}
C {lab_wire.sym} 380 -25 3 0 {name=pC_REC0 sig_type=std_logic lab=REC0}
C {res.sym} 320 170 0 0 {name=R_IPG1 value=100k device=resistor m=1}
C {gnd.sym} 320 200 0 0 {name=lR_IPG1 lab=GND}
C {lab_wire.sym} 320 140 3 0 {name=pR_IPG1 sig_type=std_logic lab=IPG1}
C {capa.sym} 380 170 0 0 {name=C_IPG1 value=10f}
C {gnd.sym} 380 200 0 0 {name=lC_IPG1 lab=GND}
C {lab_wire.sym} 380 140 3 0 {name=pC_IPG1 sig_type=std_logic lab=IPG1}
C {res.sym} 320 270 0 0 {name=R_REC1 value=100k device=resistor m=1}
C {gnd.sym} 320 300 0 0 {name=lR_REC1 lab=GND}
C {lab_wire.sym} 320 240 3 0 {name=pR_REC1 sig_type=std_logic lab=REC1}
C {capa.sym} 380 270 0 0 {name=C_REC1 value=10f}
C {gnd.sym} 380 300 0 0 {name=lC_REC1 lab=GND}
C {lab_wire.sym} 380 240 3 0 {name=pC_REC1 sig_type=std_logic lab=REC1}
C {res.sym} 320 440 0 0 {name=R_IPG2 value=100k device=resistor m=1}
C {gnd.sym} 320 470 0 0 {name=lR_IPG2 lab=GND}
C {lab_wire.sym} 320 410 3 0 {name=pR_IPG2 sig_type=std_logic lab=IPG2}
C {capa.sym} 380 440 0 0 {name=C_IPG2 value=10f}
C {gnd.sym} 380 470 0 0 {name=lC_IPG2 lab=GND}
C {lab_wire.sym} 380 410 3 0 {name=pC_IPG2 sig_type=std_logic lab=IPG2}
C {res.sym} 320 540 0 0 {name=R_REC2 value=100k device=resistor m=1}
C {gnd.sym} 320 570 0 0 {name=lR_REC2 lab=GND}
C {lab_wire.sym} 320 510 3 0 {name=pR_REC2 sig_type=std_logic lab=REC2}
C {capa.sym} 380 540 0 0 {name=C_REC2 value=10f}
C {gnd.sym} 380 570 0 0 {name=lC_REC2 lab=GND}
C {lab_wire.sym} 380 510 3 0 {name=pC_REC2 sig_type=std_logic lab=REC2}
C {res.sym} 320 705 0 0 {name=R_IPG3 value=100k device=resistor m=1}
C {gnd.sym} 320 735 0 0 {name=lR_IPG3 lab=GND}
C {lab_wire.sym} 320 675 3 0 {name=pR_IPG3 sig_type=std_logic lab=IPG3}
C {capa.sym} 380 705 0 0 {name=C_IPG3 value=10f}
C {gnd.sym} 380 735 0 0 {name=lC_IPG3 lab=GND}
C {lab_wire.sym} 380 675 3 0 {name=pC_IPG3 sig_type=std_logic lab=IPG3}
C {res.sym} 320 805 0 0 {name=R_REC3 value=100k device=resistor m=1}
C {gnd.sym} 320 835 0 0 {name=lR_REC3 lab=GND}
C {lab_wire.sym} 320 775 3 0 {name=pR_REC3 sig_type=std_logic lab=REC3}
C {capa.sym} 380 805 0 0 {name=C_REC3 value=10f}
C {gnd.sym} 380 835 0 0 {name=lC_REC3 lab=GND}
C {lab_wire.sym} 380 775 3 0 {name=pC_REC3 sig_type=std_logic lab=REC3}
C {res.sym} 320 980 0 0 {name=R_IPG4 value=100k device=resistor m=1}
C {gnd.sym} 320 1010 0 0 {name=lR_IPG4 lab=GND}
C {lab_wire.sym} 320 950 3 0 {name=pR_IPG4 sig_type=std_logic lab=IPG4}
C {capa.sym} 380 980 0 0 {name=C_IPG4 value=10f}
C {gnd.sym} 380 1010 0 0 {name=lC_IPG4 lab=GND}
C {lab_wire.sym} 380 950 3 0 {name=pC_IPG4 sig_type=std_logic lab=IPG4}
C {res.sym} 320 1080 0 0 {name=R_REC4 value=100k device=resistor m=1}
C {gnd.sym} 320 1110 0 0 {name=lR_REC4 lab=GND}
C {lab_wire.sym} 320 1050 3 0 {name=pR_REC4 sig_type=std_logic lab=REC4}
C {capa.sym} 380 1080 0 0 {name=C_REC4 value=10f}
C {gnd.sym} 380 1110 0 0 {name=lC_REC4 lab=GND}
C {lab_wire.sym} 380 1050 3 0 {name=pC_REC4 sig_type=std_logic lab=REC4}
C {res.sym} 320 1245 0 0 {name=R_IPG5 value=100k device=resistor m=1}
C {gnd.sym} 320 1275 0 0 {name=lR_IPG5 lab=GND}
C {lab_wire.sym} 320 1215 3 0 {name=pR_IPG5 sig_type=std_logic lab=IPG5}
C {capa.sym} 380 1245 0 0 {name=C_IPG5 value=10f}
C {gnd.sym} 380 1275 0 0 {name=lC_IPG5 lab=GND}
C {lab_wire.sym} 380 1215 3 0 {name=pC_IPG5 sig_type=std_logic lab=IPG5}
C {res.sym} 320 1345 0 0 {name=R_REC5 value=100k device=resistor m=1}
C {gnd.sym} 320 1375 0 0 {name=lR_REC5 lab=GND}
C {lab_wire.sym} 320 1315 3 0 {name=pR_REC5 sig_type=std_logic lab=REC5}
C {capa.sym} 380 1345 0 0 {name=C_REC5 value=10f}
C {gnd.sym} 380 1375 0 0 {name=lC_REC5 lab=GND}
C {lab_wire.sym} 380 1315 3 0 {name=pC_REC5 sig_type=std_logic lab=REC5}
C {res.sym} 320 1515 0 0 {name=R_IPG6 value=100k device=resistor m=1}
C {gnd.sym} 320 1545 0 0 {name=lR_IPG6 lab=GND}
C {lab_wire.sym} 320 1485 3 0 {name=pR_IPG6 sig_type=std_logic lab=IPG6}
C {capa.sym} 380 1515 0 0 {name=C_IPG6 value=10f}
C {gnd.sym} 380 1545 0 0 {name=lC_IPG6 lab=GND}
C {lab_wire.sym} 380 1485 3 0 {name=pC_IPG6 sig_type=std_logic lab=IPG6}
C {res.sym} 320 1615 0 0 {name=R_REC6 value=100k device=resistor m=1}
C {gnd.sym} 320 1645 0 0 {name=lR_REC6 lab=GND}
C {lab_wire.sym} 320 1585 3 0 {name=pR_REC6 sig_type=std_logic lab=REC6}
C {capa.sym} 380 1615 0 0 {name=C_REC6 value=10f}
C {gnd.sym} 380 1645 0 0 {name=lC_REC6 lab=GND}
C {lab_wire.sym} 380 1585 3 0 {name=pC_REC6 sig_type=std_logic lab=REC6}
C {res.sym} 320 1780 0 0 {name=R_IPG7 value=100k device=resistor m=1}
C {gnd.sym} 320 1810 0 0 {name=lR_IPG7 lab=GND}
C {lab_wire.sym} 320 1750 3 0 {name=pR_IPG7 sig_type=std_logic lab=IPG7}
C {capa.sym} 380 1780 0 0 {name=C_IPG7 value=10f}
C {gnd.sym} 380 1810 0 0 {name=lC_IPG7 lab=GND}
C {lab_wire.sym} 380 1750 3 0 {name=pC_IPG7 sig_type=std_logic lab=IPG7}
C {res.sym} 320 1880 0 0 {name=R_REC7 value=100k device=resistor m=1}
C {gnd.sym} 320 1910 0 0 {name=lR_REC7 lab=GND}
C {lab_wire.sym} 320 1850 3 0 {name=pR_REC7 sig_type=std_logic lab=REC7}
C {capa.sym} 380 1880 0 0 {name=C_REC7 value=10f}
C {gnd.sym} 380 1910 0 0 {name=lC_REC7 lab=GND}
C {lab_wire.sym} 380 1850 3 0 {name=pC_REC7 sig_type=std_logic lab=REC7}
C {res.sym} 320 2100 0 0 {name=R_IPG8 value=100k device=resistor m=1}
C {gnd.sym} 320 2130 0 0 {name=lR_IPG8 lab=GND}
C {lab_wire.sym} 320 2070 3 0 {name=pR_IPG8 sig_type=std_logic lab=IPG8}
C {capa.sym} 380 2100 0 0 {name=C_IPG8 value=10f}
C {gnd.sym} 380 2130 0 0 {name=lC_IPG8 lab=GND}
C {lab_wire.sym} 380 2070 3 0 {name=pC_IPG8 sig_type=std_logic lab=IPG8}
C {res.sym} 320 2200 0 0 {name=R_REC8 value=100k device=resistor m=1}
C {gnd.sym} 320 2230 0 0 {name=lR_REC8 lab=GND}
C {lab_wire.sym} 320 2170 3 0 {name=pR_REC8 sig_type=std_logic lab=REC8}
C {capa.sym} 380 2200 0 0 {name=C_REC8 value=10f}
C {gnd.sym} 380 2230 0 0 {name=lC_REC8 lab=GND}
C {lab_wire.sym} 380 2170 3 0 {name=pC_REC8 sig_type=std_logic lab=REC8}
C {res.sym} 320 2365 0 0 {name=R_IPG9 value=100k device=resistor m=1}
C {gnd.sym} 320 2395 0 0 {name=lR_IPG9 lab=GND}
C {lab_wire.sym} 320 2335 3 0 {name=pR_IPG9 sig_type=std_logic lab=IPG9}
C {capa.sym} 380 2365 0 0 {name=C_IPG9 value=10f}
C {gnd.sym} 380 2395 0 0 {name=lC_IPG9 lab=GND}
C {lab_wire.sym} 380 2335 3 0 {name=pC_IPG9 sig_type=std_logic lab=IPG9}
C {res.sym} 320 2465 0 0 {name=R_REC9 value=100k device=resistor m=1}
C {gnd.sym} 320 2495 0 0 {name=lR_REC9 lab=GND}
C {lab_wire.sym} 320 2435 3 0 {name=pR_REC9 sig_type=std_logic lab=REC9}
C {capa.sym} 380 2465 0 0 {name=C_REC9 value=10f}
C {gnd.sym} 380 2495 0 0 {name=lC_REC9 lab=GND}
C {lab_wire.sym} 380 2435 3 0 {name=pC_REC9 sig_type=std_logic lab=REC9}
C {res.sym} 320 2635 0 0 {name=R_IPG10 value=100k device=resistor m=1}
C {gnd.sym} 320 2665 0 0 {name=lR_IPG10 lab=GND}
C {lab_wire.sym} 320 2605 3 0 {name=pR_IPG10 sig_type=std_logic lab=IPG10}
C {capa.sym} 380 2635 0 0 {name=C_IPG10 value=10f}
C {gnd.sym} 380 2665 0 0 {name=lC_IPG10 lab=GND}
C {lab_wire.sym} 380 2605 3 0 {name=pC_IPG10 sig_type=std_logic lab=IPG10}
C {res.sym} 320 2735 0 0 {name=R_REC10 value=100k device=resistor m=1}
C {gnd.sym} 320 2765 0 0 {name=lR_REC10 lab=GND}
C {lab_wire.sym} 320 2705 3 0 {name=pR_REC10 sig_type=std_logic lab=REC10}
C {capa.sym} 380 2735 0 0 {name=C_REC10 value=10f}
C {gnd.sym} 380 2765 0 0 {name=lC_REC10 lab=GND}
C {lab_wire.sym} 380 2705 3 0 {name=pC_REC10 sig_type=std_logic lab=REC10}
C {res.sym} 320 2900 0 0 {name=R_IPG11 value=100k device=resistor m=1}
C {gnd.sym} 320 2930 0 0 {name=lR_IPG11 lab=GND}
C {lab_wire.sym} 320 2870 3 0 {name=pR_IPG11 sig_type=std_logic lab=IPG11}
C {capa.sym} 380 2900 0 0 {name=C_IPG11 value=10f}
C {gnd.sym} 380 2930 0 0 {name=lC_IPG11 lab=GND}
C {lab_wire.sym} 380 2870 3 0 {name=pC_IPG11 sig_type=std_logic lab=IPG11}
C {res.sym} 320 3000 0 0 {name=R_REC11 value=100k device=resistor m=1}
C {gnd.sym} 320 3030 0 0 {name=lR_REC11 lab=GND}
C {lab_wire.sym} 320 2970 3 0 {name=pR_REC11 sig_type=std_logic lab=REC11}
C {capa.sym} 380 3000 0 0 {name=C_REC11 value=10f}
C {gnd.sym} 380 3030 0 0 {name=lC_REC11 lab=GND}
C {lab_wire.sym} 380 2970 3 0 {name=pC_REC11 sig_type=std_logic lab=REC11}
C {res.sym} 320 3195 0 0 {name=R_IPG12 value=100k device=resistor m=1}
C {gnd.sym} 320 3225 0 0 {name=lR_IPG12 lab=GND}
C {lab_wire.sym} 320 3165 3 0 {name=pR_IPG12 sig_type=std_logic lab=IPG12}
C {capa.sym} 380 3195 0 0 {name=C_IPG12 value=10f}
C {gnd.sym} 380 3225 0 0 {name=lC_IPG12 lab=GND}
C {lab_wire.sym} 380 3165 3 0 {name=pC_IPG12 sig_type=std_logic lab=IPG12}
C {res.sym} 320 3295 0 0 {name=R_REC12 value=100k device=resistor m=1}
C {gnd.sym} 320 3325 0 0 {name=lR_REC12 lab=GND}
C {lab_wire.sym} 320 3265 3 0 {name=pR_REC12 sig_type=std_logic lab=REC12}
C {capa.sym} 380 3295 0 0 {name=C_REC12 value=10f}
C {gnd.sym} 380 3325 0 0 {name=lC_REC12 lab=GND}
C {lab_wire.sym} 380 3265 3 0 {name=pC_REC12 sig_type=std_logic lab=REC12}
C {res.sym} 320 3460 0 0 {name=R_IPG13 value=100k device=resistor m=1}
C {gnd.sym} 320 3490 0 0 {name=lR_IPG13 lab=GND}
C {lab_wire.sym} 320 3430 3 0 {name=pR_IPG13 sig_type=std_logic lab=IPG13}
C {capa.sym} 380 3460 0 0 {name=C_IPG13 value=10f}
C {gnd.sym} 380 3490 0 0 {name=lC_IPG13 lab=GND}
C {lab_wire.sym} 380 3430 3 0 {name=pC_IPG13 sig_type=std_logic lab=IPG13}
C {res.sym} 320 3560 0 0 {name=R_REC13 value=100k device=resistor m=1}
C {gnd.sym} 320 3590 0 0 {name=lR_REC13 lab=GND}
C {lab_wire.sym} 320 3530 3 0 {name=pR_REC13 sig_type=std_logic lab=REC13}
C {capa.sym} 380 3560 0 0 {name=C_REC13 value=10f}
C {gnd.sym} 380 3590 0 0 {name=lC_REC13 lab=GND}
C {lab_wire.sym} 380 3530 3 0 {name=pC_REC13 sig_type=std_logic lab=REC13}
C {res.sym} 320 3730 0 0 {name=R_IPG14 value=100k device=resistor m=1}
C {gnd.sym} 320 3760 0 0 {name=lR_IPG14 lab=GND}
C {lab_wire.sym} 320 3700 3 0 {name=pR_IPG14 sig_type=std_logic lab=IPG14}
C {capa.sym} 380 3730 0 0 {name=C_IPG14 value=10f}
C {gnd.sym} 380 3760 0 0 {name=lC_IPG14 lab=GND}
C {lab_wire.sym} 380 3700 3 0 {name=pC_IPG14 sig_type=std_logic lab=IPG14}
C {res.sym} 320 3830 0 0 {name=R_REC14 value=100k device=resistor m=1}
C {gnd.sym} 320 3860 0 0 {name=lR_REC14 lab=GND}
C {lab_wire.sym} 320 3800 3 0 {name=pR_REC14 sig_type=std_logic lab=REC14}
C {capa.sym} 380 3830 0 0 {name=C_REC14 value=10f}
C {gnd.sym} 380 3860 0 0 {name=lC_REC14 lab=GND}
C {lab_wire.sym} 380 3800 3 0 {name=pC_REC14 sig_type=std_logic lab=REC14}
C {res.sym} 320 3995 0 0 {name=R_IPG15 value=100k device=resistor m=1}
C {gnd.sym} 320 4025 0 0 {name=lR_IPG15 lab=GND}
C {lab_wire.sym} 320 3965 3 0 {name=pR_IPG15 sig_type=std_logic lab=IPG15}
C {capa.sym} 380 3995 0 0 {name=C_IPG15 value=10f}
C {gnd.sym} 380 4025 0 0 {name=lC_IPG15 lab=GND}
C {lab_wire.sym} 380 3965 3 0 {name=pC_IPG15 sig_type=std_logic lab=IPG15}
C {res.sym} 320 4095 0 0 {name=R_REC15 value=100k device=resistor m=1}
C {gnd.sym} 320 4125 0 0 {name=lR_REC15 lab=GND}
C {lab_wire.sym} 320 4065 3 0 {name=pR_REC15 sig_type=std_logic lab=REC15}
C {capa.sym} 380 4095 0 0 {name=C_REC15 value=10f}
C {gnd.sym} 380 4125 0 0 {name=lC_REC15 lab=GND}
C {lab_wire.sym} 380 4065 3 0 {name=pC_REC15 sig_type=std_logic lab=REC15}
C {devices/code_shown.sym} -200 4400 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {code_shown.sym} 700 -300 0 0 {name=s1 only_toplevel=false value="
.control
save all
alter @V_RSTn[PWL] = [ 0 0  100n 0  100.001n 3.3  10u 3.3 ]
alter @V_clk[PULSE] = [ 0 3.3 0 1n 1n 25n 50n ]
alter @V_MODE[PWL] = [ 0 0  500n 0  500.001n 3.3  10u 3.3 ]
alter @V_EN0[PWL]  = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN1[PWL]  = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN2[PWL]  = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN3[PWL]  = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN4[PWL]  = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN5[PWL]  = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN6[PWL]  = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN7[PWL]  = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN8[PWL]  = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN9[PWL]  = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN10[PWL] = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN11[PWL] = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN12[PWL] = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN13[PWL] = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN14[PWL] = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
alter @V_EN15[PWL] = [ 0 0  150n 0  150.001n 3.3  10u 3.3 ]
tran 1n 800n
write tb_full_allon.raw
.endc
"}
