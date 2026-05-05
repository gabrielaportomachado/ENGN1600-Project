v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -285 -80 -285 -30 {lab=vdd}
N -285 30 -285 70 {lab=GND}
N -215 -80 -215 -30 {lab=vss}
N -215 30 -215 70 {lab=GND}
N -160 -80 -160 -30 {lab=EN}
N -160 30 -160 70 {lab=GND}
N -70 -80 -70 -30 {lab=MODE}
N -70 30 -70 70 {lab=GND}
N -285 120 -285 170 {lab=MODEb}
N -285 230 -285 270 {lab=GND}
N -215 120 -215 170 {lab=RSTn}
N -215 230 -215 270 {lab=GND}
N -155 120 -155 170 {lab=clk}
N -155 230 -155 270 {lab=GND}
N -85 120 -85 170 {lab=E}
N -85 230 -85 270 {lab=GND}
N 45 120 45 170 {lab=bias}
N 45 230 45 270 {lab=GND}
N 105 -25 165 -25 {lab=EN}
N 105 15 165 15 {lab=E}
N 235 -135 235 -75 {lab=MODE}
N 265 -135 265 -75 {lab=RSTn}
N 305 -135 305 -75 {lab=clk}
N 335 -135 335 -75 {lab=MODEb}
N 405 -45 475 -45 {lab=IPG}
N 405 55 475 55 {lab=REC}
N 475 115 475 130 {lab=GND}
N 520 15 520 30 {lab=GND}
N 475 -45 520 -45 {lab=IPG}
N 520 -45 590 -45 {lab=IPG}
N 590 15 590 30 {lab=bias}
N 475 55 600 55 {lab=REC}
N 600 115 600 130 {lab=bias}
C {row.sym} 280 0 0 0 {name=x1}
C {vsource.sym} -285 0 0 0 {name=V1 value=3.3 savecurrent=false}
C {gnd.sym} -285 70 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -285 -70 3 0 {name=p1 sig_type=std_logic lab=vdd}
C {vsource.sym} -215 0 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} -215 70 0 0 {name=l2 lab=GND}
C {lab_wire.sym} -215 -70 3 0 {name=p3 sig_type=std_logic lab=vss}
C {vsource.sym} -160 0 0 0 {name=V3 value=0 savecurrent=false}
C {gnd.sym} -160 70 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -85 130 3 0 {name=p2 sig_type=std_logic lab=E}
C {vsource.sym} -70 0 0 0 {name=V4 value=0 savecurrent=false}
C {gnd.sym} -70 70 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -160 -65 3 0 {name=p4 sig_type=std_logic lab=EN}
C {vsource.sym} -285 200 0 0 {name=V5 value=3.3 savecurrent=false}
C {gnd.sym} -285 270 0 0 {name=l5 lab=GND}
C {lab_wire.sym} -70 -75 3 0 {name=p5 sig_type=std_logic lab=MODE}
C {vsource.sym} -215 200 0 0 {name=V6 value=0 savecurrent=false}
C {gnd.sym} -215 270 0 0 {name=l6 lab=GND}
C {lab_wire.sym} -285 130 3 0 {name=p6 sig_type=std_logic lab=MODEb}
C {vsource.sym} -155 200 0 0 {name=V7 value=3.3 savecurrent=false}
C {gnd.sym} -155 270 0 0 {name=l7 lab=GND}
C {lab_wire.sym} -155 130 3 0 {name=p7 sig_type=std_logic lab=clk}
C {vsource.sym} -85 200 0 0 {name=V8 value=0 savecurrent=false}
C {gnd.sym} -85 270 0 0 {name=l8 lab=GND}
C {lab_wire.sym} -215 130 3 0 {name=p8 sig_type=std_logic lab=RSTn}
C {vsource.sym} 45 200 0 0 {name=V_bias value=1.65 savecurrent=false}
C {gnd.sym} 45 270 0 0 {name=l_bias lab=GND}
C {lab_wire.sym} 45 130 3 0 {name=p_bias sig_type=std_logic lab=bias}
C {devices/code_shown.sym} 50 380 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {lab_wire.sym} 140 -25 0 0 {name=p9 sig_type=std_logic lab=EN}
C {lab_wire.sym} 130 15 0 0 {name=p10 sig_type=std_logic lab=E}
C {lab_wire.sym} 265 -125 3 0 {name=p11 sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 235 -125 3 0 {name=p12 sig_type=std_logic lab=MODE}
C {lab_wire.sym} 335 -130 3 0 {name=p13 sig_type=std_logic lab=MODEb}
C {lab_wire.sym} 305 -120 3 0 {name=p14 sig_type=std_logic lab=clk}
C {lab_wire.sym} 470 -45 0 0 {name=p15 sig_type=std_logic lab=IPG}
C {lab_wire.sym} 470 55 0 0 {name=p16 sig_type=std_logic lab=REC}
C {capa.sym} 475 85 0 0 {name=C_REC m=1 value=10f device="ceramic capacitor"}
C {gnd.sym} 475 130 0 0 {name=l9 lab=GND}
C {capa.sym} 520 -15 0 0 {name=C_IPG m=1 value=10f device="ceramic capacitor"}
C {gnd.sym} 520 30 0 0 {name=l10 lab=GND}
C {res.sym} 590 -15 0 0 {name=R_IPG value=100k device=resistor m=1}
C {res.sym} 600 85 0 0 {name=R_REC value=100k device=resistor m=1}
C {lab_wire.sym} 590 30 1 0 {name=p_rb1 sig_type=std_logic lab=bias}
C {lab_wire.sym} 600 130 1 0 {name=p_rb2 sig_type=std_logic lab=bias}
C {code_shown.sym} 700 -300 0 0 {name=s1 only_toplevel=false value="
.control
save all

** All sources reset to PWL/SIN below
** V1=vdd, V2=vss, V3=EN, V4=MODE, V5=MODEb, V6=RSTn, V7=clk, V8=E
alter @V1[DC] = 3.3
alter @V2[DC] = 0

** CLK: free-running 1MHz throughout (period 1us)
alter @V7[PULSE] = [ 0 3.3 0 1n 1n 0.5u 1u ]

** RSTn: 0..1.5ms low, then high
alter @V6[PWL] = [ 0 0  1.5m 0  1.5001m 3.3  6m 3.3 ]

** EN: high in Phase A, then low Phase B, then high again
alter @V3[PWL] = [ 0 3.3  1.5m 3.3  1.5001m 0  3m 0  3.0001m 3.3  6m 3.3 ]

** MODE: 0 in Phase A/B/C, 1 in Phase D
alter @V4[PWL] = [ 0 0    4.5m 0    4.5001m 3.3   6m 3.3 ]
alter @V5[PWL] = [ 0 3.3  4.5m 3.3  4.5001m 0     6m 0   ]

** E: small sine 100mV around 1.65V mid-rail
alter @V8[SIN] = [ 1.65 0.1 1k 0 0 0 ]

tran 0.5u 6m

meas tran ipg_max_A max v(IPG) from=0.5m to=1.4m
meas tran ipg_min_A min v(IPG) from=0.5m to=1.4m
meas tran rec_max_A max v(REC) from=0.5m to=1.4m
meas tran rec_min_A min v(REC) from=0.5m to=1.4m
meas tran ipg_max_B max v(IPG) from=2.0m to=2.9m
meas tran ipg_min_B min v(IPG) from=2.0m to=2.9m
meas tran rec_max_B max v(REC) from=2.0m to=2.9m
meas tran rec_min_B min v(REC) from=2.0m to=2.9m
meas tran ipg_max_C max v(IPG) from=3.5m to=4.4m
meas tran ipg_min_C min v(IPG) from=3.5m to=4.4m
meas tran rec_max_C max v(REC) from=3.5m to=4.4m
meas tran rec_min_C min v(REC) from=3.5m to=4.4m
meas tran ipg_max_D max v(IPG) from=5.0m to=5.9m
meas tran ipg_min_D min v(IPG) from=5.0m to=5.9m
meas tran rec_max_D max v(REC) from=5.0m to=5.9m
meas tran rec_min_D min v(REC) from=5.0m to=5.9m

let pp_ipg_A = ipg_max_A - ipg_min_A
let pp_rec_A = rec_max_A - rec_min_A
let pp_ipg_B = ipg_max_B - ipg_min_B
let pp_rec_B = rec_max_B - rec_min_B
let pp_ipg_C = ipg_max_C - ipg_min_C
let pp_rec_C = rec_max_C - rec_min_C
let pp_ipg_D = ipg_max_D - ipg_min_D
let pp_rec_D = rec_max_D - rec_min_D

echo Phase A pp(IPG)=$&pp_ipg_A pp(REC)=$&pp_rec_A
echo Phase B pp(IPG)=$&pp_ipg_B pp(REC)=$&pp_rec_B
echo Phase C pp(IPG)=$&pp_ipg_C pp(REC)=$&pp_rec_C
echo Phase D pp(IPG)=$&pp_ipg_D pp(REC)=$&pp_rec_D

write tb_row_corners.raw
.endc
"}
