v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -360 -105 -360 -75 {lab=vdd}
N -340 -105 -340 -75 {lab=GND}
N -450 -20 -400 -20 {lab=EN}
N -450 0 -400 0 {lab=clk}
N -70 -80 -20 -80 {lab=EN_cfg}
N -70 40 -20 40 {lab=EN_cfg}
N 100 -60 150 -60 {lab=SW_IPG}
N 100 60 150 60 {lab=SW_REC}
N 550 -80 550 -30 {lab=SW_IPG}
N 550 130 550 180 {lab=SW_REC}
N 230 -60 290 -60 {lab=SW_IPGb}
N 230 60 290 60 {lab=SW_RECb}
N 550 -190 550 -130 {lab=SW_IPGb}
N 550 20 550 80 {lab=SW_RECb}
N -300 -25 -275 -25 {lab=EN_cfg}
N -40 -40 -20 -40 {lab=MODEb}
N -40 80 -20 80 {lab=MODE}
N -455 40 -435 40 {lab=E}
N 440 -100 500 -100 {lab=E}
N 440 110 500 110 {lab=E}
N 600 -100 650 -100 {lab=IPG}
N 600 110 650 110 {lab=REC}
N -350 50 -350 80 {lab=RSTn}
N -300 -5 -275 -5 {lab=EN_cfgb}
N -275 -25 -225 -25 {lab=EN_cfg}
N -430 85 -430 110 {lab=GND}
C {AND/AND.sym} 40 -60 0 0 {name=x1}
C {DFF/DFF.sym} -380 30 0 0 {name=x2}
C {TGATE/TGATE.sym} 590 -90 0 0 {name=x3}
C {AND/AND.sym} 40 60 0 0 {name=x4}
C {ipin.sym} -450 -20 0 0 {name=p3 lab=EN}
C {ipin.sym} -450 0 0 0 {name=p4 lab=clk}
C {ipin.sym} -40 -40 0 0 {name=p5 lab=MODEb}
C {lab_wire.sym} -40 -80 0 0 {name=p6 sig_type=std_logic lab=EN_cfg}
C {lab_wire.sym} -40 40 0 0 {name=p9 sig_type=std_logic lab=EN_cfg}
C {lab_wire.sym} 140 60 0 0 {name=p12 sig_type=std_logic lab=SW_REC}
C {lab_wire.sym} 140 -60 0 0 {name=p13 sig_type=std_logic lab=SW_IPG}
C {TGATE/TGATE.sym} 590 120 0 0 {name=x6}
C {lab_wire.sym} 550 -80 3 0 {name=p15 sig_type=std_logic lab=SW_IPG}
C {ipin.sym} -40 80 0 0 {name=p7 lab=MODE}
C {AND/INV.sym} 180 -60 0 0 {name=x5}
C {lab_wire.sym} 550 140 3 0 {name=p16 sig_type=std_logic lab=SW_REC}
C {AND/INV.sym} 180 60 0 0 {name=x7}
C {lab_wire.sym} 290 -60 0 0 {name=p11 sig_type=std_logic lab=SW_IPGb}
C {lab_wire.sym} 290 60 0 0 {name=p17 sig_type=std_logic lab=SW_RECb}
C {lab_wire.sym} 550 -130 1 0 {name=p18 sig_type=std_logic lab=SW_IPGb}
C {lab_wire.sym} 550 80 1 0 {name=p19 sig_type=std_logic lab=SW_RECb}
C {lab_wire.sym} -245 -25 0 0 {name=p20 sig_type=std_logic lab=EN_cfg}
C {ipin.sym} -455 40 0 0 {name=p8 lab=E}
C {lab_wire.sym} 480 -100 0 0 {name=p10 sig_type=std_logic lab=E}
C {lab_wire.sym} 480 110 0 0 {name=p21 sig_type=std_logic lab=E}
C {opin.sym} 650 -100 0 0 {name=p22 lab=IPG}
C {opin.sym} 650 110 0 0 {name=p23 lab=REC}
C {ipin.sym} -350 80 3 0 {name=p24 lab=RSTn}
C {opin.sym} -275 -5 0 0 {name=p25 lab=EN_cfgb}
C {gnd.sym} -430 110 0 0 {name=l1 lab=GND}
C {vdd.sym} -360 -105 0 0 {name=l2 lab=vdd}
C {lab_wire.sym} -340 -100 2 0 {name=p2 sig_type=std_logic lab=GND}
