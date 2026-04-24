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
C {devices/code_shown.sym} 50 205 0 0 {name=MODELS only_toplevel=true
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
C {code_shown.sym} 640 -265 0 0 {name=s1 only_toplevel=false value="
.control
save all

** Define timing
let fsig = 1e3
let tper = 1/fsig
let tstop = 6m
let tstep = 0.1u

** Supplies
alter @v1[DC] = 3.3
alter @v2[DC] = 0

** EN: enable channel after reset
alter @v3[PULSE] = [ 0 3.3 0.3m 1n 1n 5.7m 6m ]

** MODE: 0 = treatment first, 1 = recording second
alter @v4[PULSE] = [ 0 3.3 3m 1n 1n 3m 6m ]

** MODEb: complement of MODE
alter @v5[PULSE] = [ 3.3 0 3m 1n 1n 3m 6m ]

** RSTN: active-low reset, released after 0.2 ms
alter @v6[PULSE] = [ 0 3.3 0.2m 1n 1n 5.8m 6m ]

** CLK: configuration clock
alter @v7[PULSE] = [ 0 3.3 0.4m 1n 1n 0.25m 0.5m ]

** Electrode input signal: small analog signal around mid-supply
alter @v8[SIN] = [ 1.65 0.1 1k 0 0 0 ]

** Simulation
op
tran $&tstep $&tstop

** Useful plots
plot v(E) v(MODE)

set color2 = blue
set color3 = green
set color4 = magenta

plot v(MODE) v(IPG) v(REC)

write row_tb.raw
.endc
"}
C {capa.sym} 475 85 0 0 {name=C1
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 475 130 0 0 {name=l9 lab=GND}
C {capa.sym} 520 -15 0 0 {name=C2
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 520 30 0 0 {name=l10 lab=GND}
