v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -805 -220 -805 -170 {lab=vdd}
N -805 -110 -805 -70 {lab=GND}
N -735 -220 -735 -170 {lab=RSTn}
N -735 -110 -735 -70 {lab=GND}
N -665 -220 -665 -170 {lab=clk}
N -665 -110 -665 -70 {lab=GND}
N -595 -220 -595 -170 {lab=EN}
N -595 -110 -595 -70 {lab=GND}
N -805 -20 -805 30 {lab=MODE}
N -805 90 -805 130 {lab=GND}
N -735 -20 -735 30 {lab=MODEb}
N -735 90 -735 130 {lab=GND}
N -665 -20 -665 30 {lab=brain_node}
N -665 90 -665 130 {lab=GND}
N -595 -20 -595 30 {lab=bias_amp}
N -595 90 -595 130 {lab=GND}
N -805 180 -805 230 {lab=stim_drv}
N -805 290 -805 330 {lab=GND}
N -415 -165 -355 -165 {lab=EN}
N -415 -125 -355 -125 {lab=E_pin}
N -285 -275 -285 -215 {lab=MODE}
N -255 -275 -255 -215 {lab=RSTn}
N -215 -275 -215 -215 {lab=clk}
N -185 -275 -185 -215 {lab=MODEb}
N -115 -185 -45 -185 {lab=IPG_pin}
N -45 -185 0 -185 {lab=IPG_pin}
N 0 -185 50 -185 {lab=IPG_pin}
N -115 -85 -45 -85 {lab=REC_pin}
N -45 -85 0 -85 {lab=REC_pin}
N 0 -85 50 -85 {lab=REC_pin}
N 0 -125 0 -110 {lab=stim_drv}
N 50 -125 50 -110 {lab=GND}
N 0 -25 0 5 {lab=bias_amp}
N 50 -25 50 5 {lab=GND}
N -440 -30 -440 0 {lab=brain_node}
N -440 60 -440 90 {lab=tissue_node}
N -440 150 -440 180 {lab=tissue_node}
N -440 240 -440 270 {lab=E_pin}
N -360 150 -360 180 {lab=tissue_node}
N -360 240 -360 270 {lab=E_pin}
C {vsource.sym} -805 -140 0 0 {name=V_vdd value=3.3 savecurrent=false}
C {gnd.sym} -805 -70 0 0 {name=l_vdd lab=GND}
C {lab_wire.sym} -805 -210 3 0 {name=p_vdd sig_type=std_logic lab=vdd}
C {vsource.sym} -735 -140 0 0 {name=V_RSTn value=0 savecurrent=false}
C {gnd.sym} -735 -70 0 0 {name=l_RSTn lab=GND}
C {lab_wire.sym} -735 -210 3 0 {name=p_RSTn sig_type=std_logic lab=RSTn}
C {vsource.sym} -665 -140 0 0 {name=V_clk value=0 savecurrent=false}
C {gnd.sym} -665 -70 0 0 {name=l_clk lab=GND}
C {lab_wire.sym} -665 -210 3 0 {name=p_clk sig_type=std_logic lab=clk}
C {vsource.sym} -595 -140 0 0 {name=V_EN value=0 savecurrent=false}
C {gnd.sym} -595 -70 0 0 {name=l_EN lab=GND}
C {lab_wire.sym} -595 -210 3 0 {name=p_EN sig_type=std_logic lab=EN}
C {vsource.sym} -805 60 0 0 {name=V_MODE value=0 savecurrent=false}
C {gnd.sym} -805 130 0 0 {name=l_MODE lab=GND}
C {lab_wire.sym} -805 -10 3 0 {name=p_MODE sig_type=std_logic lab=MODE}
C {vsource.sym} -735 60 0 0 {name=V_MODEb value=3.3 savecurrent=false}
C {gnd.sym} -735 130 0 0 {name=l_MODEb lab=GND}
C {lab_wire.sym} -735 -10 3 0 {name=p_MODEb sig_type=std_logic lab=MODEb}
C {vsource.sym} -665 60 0 0 {name=V_brain value=1.65 savecurrent=false}
C {gnd.sym} -665 130 0 0 {name=l_brain lab=GND}
C {lab_wire.sym} -665 -10 3 0 {name=p_brain sig_type=std_logic lab=brain_node}
C {vsource.sym} -595 60 0 0 {name=V_bias_amp value=1.65 savecurrent=false}
C {gnd.sym} -595 130 0 0 {name=l_bias_amp lab=GND}
C {lab_wire.sym} -595 -10 3 0 {name=p_bias_amp sig_type=std_logic lab=bias_amp}
C {vsource.sym} -805 260 0 0 {name=V_stim value=1.65 savecurrent=false}
C {gnd.sym} -805 330 0 0 {name=l_stim lab=GND}
C {lab_wire.sym} -805 190 3 0 {name=p_stim sig_type=std_logic lab=stim_drv}
C {lab_wire.sym} -380 -165 0 0 {name=p_EN_at_row sig_type=std_logic lab=EN}
C {lab_wire.sym} -390 -125 0 0 {name=p_E_at_row sig_type=std_logic lab=E_pin}
C {lab_wire.sym} -285 -265 3 0 {name=p_MODE_at_row sig_type=std_logic lab=MODE}
C {lab_wire.sym} -255 -265 3 0 {name=p_RSTn_at_row sig_type=std_logic lab=RSTn}
C {lab_wire.sym} -215 -265 3 0 {name=p_clk_at_row sig_type=std_logic lab=clk}
C {lab_wire.sym} -185 -265 3 0 {name=p_MODEb_at_row sig_type=std_logic lab=MODEb}
C {lab_wire.sym} -50 -185 0 0 {name=p_IPG_at_row sig_type=std_logic lab=IPG_pin}
C {lab_wire.sym} -50 -85 0 0 {name=p_REC_at_row sig_type=std_logic lab=REC_pin}
C {res.sym} -440 30 0 0 {name=R_s value=1k device=resistor m=1}
C {res.sym} -360 210 0 0 {name=R_ct value=50k device=resistor m=1}
C {capa.sym} -440 210 0 0 {name=C_dl value=300n m=1 device="ceramic capacitor"}
C {res.sym} 0 -155 0 0 {name=R_drv value=100 device=resistor m=1}
C {capa.sym} 50 -155 0 0 {name=C_pad_IPG value=2p m=1 device="ceramic capacitor"}
C {res.sym} 0 -55 0 0 {name=R_amp value=1G device=resistor m=1}
C {capa.sym} 50 -55 0 0 {name=C_pad_REC value=2p m=1 device="ceramic capacitor"}
C {gnd.sym} 50 -110 0 0 {name=l_pad_IPG lab=GND}
C {gnd.sym} 50 5 0 0 {name=l_pad_REC lab=GND}
C {lab_wire.sym} 0 -110 1 0 {name=p_stim_at_Rdrv sig_type=std_logic lab=stim_drv}
C {lab_wire.sym} 0 5 1 0 {name=p_bias_at_Ramp sig_type=std_logic lab=bias_amp}
C {lab_wire.sym} -440 -30 0 0 {name=p_brain_at_Rs sig_type=std_logic lab=brain_node}
C {lab_wire.sym} -440 90 0 0 {name=p_tissue_at_Rs sig_type=std_logic lab=tissue_node}
C {lab_wire.sym} -440 150 0 0 {name=p_tissue_at_Cdl sig_type=std_logic lab=tissue_node}
C {lab_wire.sym} -440 270 0 0 {name=p_E_at_Cdl sig_type=std_logic lab=E_pin}
C {lab_wire.sym} -360 150 0 0 {name=p_tissue_at_Rct sig_type=std_logic lab=tissue_node}
C {lab_wire.sym} -360 270 0 0 {name=p_E_at_Rct sig_type=std_logic lab=E_pin}
C {devices/code_shown.sym} -550 400 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {code_shown.sym} 1100 -420 0 0 {name=s2 only_toplevel=false value="
.SUBCKT ROW VDD E REC RSTn EN CLK MODE GND IPG MODEb
M1 n8 n7 VDD VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.42P PS=3.3U PD=1.84U
M2 VDD n20 n8 VDD pfet_03v3 L=0.28U W=1U AS=0.42P AD=0.735P PS=1.84U PD=2.47U
M3 n9 n8 VDD VDD pfet_03v3 L=0.28U W=1U AS=0.735P AD=0.635P PS=2.47U PD=3.27U
M4 n10 n9 VDD VDD pfet_03v3 L=0.28U W=1U AS=0.55P AD=0.65P PS=3.1U PD=3.3U
M5 REC n10 E VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.65P PS=3.3U PD=3.3U
M6 n3 n13 VDD VDD pfet_03v3 L=0.28U W=1U AS=0.76P AD=0.65P PS=3.52U PD=3.3U
M7 VDD n3 n4 VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.65P PS=3.3U PD=3.3U
M8 n4 RSTn VDD VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.65P PS=3.3U PD=3.3U
M9 n13 n2 n4 VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.59P PS=3.3U PD=3.18U
M10 n5 EN n13 VDD pfet_03v3 L=0.28U W=1U AS=0.63P AD=0.605P PS=3.26U PD=3.21U
M11 VDD n15 n5 VDD pfet_03v3 L=0.28U W=1U AS=0.63P AD=0.54P PS=3.26U PD=3.08U
M12 VDD n2 n15 VDD pfet_03v3 L=0.28U W=1U AS=0.63P AD=0.64P PS=3.26U PD=3.28U
M13 VDD CLK n2 VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.65P PS=3.3U PD=3.3U
M14 n6 MODE VDD VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.42P PS=3.3U PD=1.84U
M15 VDD n18 n6 VDD pfet_03v3 L=0.28U W=1U AS=0.42P AD=0.735P PS=1.84U
+ PD=2.47U
M16 n7 n6 VDD VDD pfet_03v3 L=0.28U W=1U AS=0.735P AD=0.64P PS=2.47U PD=3.28U
M17 n56 n54 VDD VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.65P PS=3.3U PD=3.3U
M18 n85 n56 n54 VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.65P PS=3.3U PD=3.3U
M19 VDD n15 n85 VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.65P PS=3.3U PD=3.3U
M20 n18 n56 VDD VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.65P PS=3.3U PD=3.3U
M21 n58 n56 VDD VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.65P PS=3.3U PD=3.3U
M22 n59 n58 VDD VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.65P PS=3.3U PD=3.3U
M23 n60 MODEb VDD VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.42P PS=3.3U
+ PD=1.84U
M24 VDD n18 n60 VDD pfet_03v3 L=0.28U W=1U AS=0.42P AD=0.735P PS=1.84U
+ PD=2.47U
M25 n67 n60 VDD VDD pfet_03v3 L=0.28U W=1U AS=0.735P AD=0.63P PS=2.47U
+ PD=3.26U
M26 n54 n2 n3 VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.65P PS=3.3U PD=3.3U
M27 n56 RSTn VDD VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.65P PS=3.3U PD=3.3U
M28 n61 n67 VDD VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.42P PS=3.3U PD=1.84U
M29 VDD n10 n61 VDD pfet_03v3 L=0.28U W=1U AS=0.42P AD=0.735P PS=1.84U
+ PD=2.47U
M30 n68 n61 VDD VDD pfet_03v3 L=0.28U W=1U AS=0.735P AD=0.63P PS=2.47U
+ PD=3.26U
M31 n20 n68 VDD VDD pfet_03v3 L=0.28U W=1U AS=0.56P AD=0.65P PS=3.12U PD=3.3U
M32 IPG n20 E VDD pfet_03v3 L=0.28U W=1U AS=0.65P AD=0.65P PS=3.3U PD=3.3U
M33 n9 n8 GND GND nfet_03v3 L=0.28U W=0.5U AS=0.2425P AD=0.315P PS=1.97U
+ PD=2.26U
M34 n10 n9 GND GND nfet_03v3 L=0.28U W=0.5U AS=0.2825P AD=0.315P PS=2.13U
+ PD=2.26U
M35 n7 n6 GND GND nfet_03v3 L=0.28U W=0.5U AS=0.2425P AD=0.3125P PS=1.97U
+ PD=2.25U
M36 n52 n7 GND GND nfet_03v3 L=0.28U W=1U AS=0.63P AD=0.42P PS=3.26U PD=1.84U
M37 n8 n20 n52 GND nfet_03v3 L=0.28U W=1U AS=0.42P AD=0.65P PS=1.84U PD=3.3U
M38 REC n9 E GND nfet_03v3 L=0.28U W=1U AS=0.63P AD=0.63P PS=3.26U PD=3.26U
M39 n3 n13 GND GND nfet_03v3 L=0.28U W=1U AS=0.76P AD=0.61P PS=3.52U PD=3.22U
M40 n34 n3 GND GND nfet_03v3 L=0.28U W=1U AS=0.61P AD=0.61P PS=3.22U PD=3.22U
M41 n4 RSTn n34 GND nfet_03v3 L=0.28U W=1U AS=0.61P AD=0.61P PS=3.22U
+ PD=3.22U
M42 n13 n15 n4 GND nfet_03v3 L=0.28U W=1U AS=0.61P AD=0.61P PS=3.22U
+ PD=3.22U
M43 n35 EN n13 GND nfet_03v3 L=0.28U W=1U AS=0.61P AD=0.61P PS=3.22U PD=3.22U
M44 GND n2 n35 GND nfet_03v3 L=0.28U W=1U AS=0.61P AD=0.575P PS=3.22U
+ PD=3.15U
M45 GND n2 n15 GND nfet_03v3 L=0.28U W=1U AS=0.61P AD=0.61P PS=3.22U PD=3.22U
M46 GND CLK n2 GND nfet_03v3 L=0.28U W=1U AS=0.63P AD=0.67P PS=3.26U PD=3.34U
M47 n47 MODE GND GND nfet_03v3 L=0.28U W=1U AS=0.63P AD=0.42P PS=3.26U
+ PD=1.84U
M48 n6 n18 n47 GND nfet_03v3 L=0.28U W=1U AS=0.42P AD=0.65P PS=1.84U PD=3.3U
M49 n54 n15 n3 GND nfet_03v3 L=0.28U W=1U AS=0.715P AD=0.61P PS=3.43U
+ PD=3.22U
M50 n55 RSTn GND GND nfet_03v3 L=0.28U W=1U AS=0.61P AD=0.61P PS=3.22U
+ PD=3.22U
M51 n56 n54 n55 GND nfet_03v3 L=0.28U W=1U AS=0.61P AD=0.61P PS=3.22U
+ PD=3.22U
M52 n57 n56 n54 GND nfet_03v3 L=0.28U W=1U AS=0.61P AD=0.61P PS=3.22U
+ PD=3.22U
M53 GND n2 n57 GND nfet_03v3 L=0.28U W=1U AS=0.61P AD=0.61P PS=3.22U PD=3.22U
M54 n18 n56 GND GND nfet_03v3 L=0.28U W=1U AS=0.61P AD=0.61P PS=3.22U
+ PD=3.22U
M55 n58 n56 GND GND nfet_03v3 L=0.28U W=1U AS=0.61P AD=0.61P PS=3.22U
+ PD=3.22U
M56 n59 n58 GND GND nfet_03v3 L=0.28U W=1U AS=0.61P AD=0.61P PS=3.22U
+ PD=3.22U
M57 n81 MODEb GND GND nfet_03v3 L=0.28U W=1U AS=0.63P AD=0.42P PS=3.26U
+ PD=1.84U
M58 n60 n18 n81 GND nfet_03v3 L=0.28U W=1U AS=0.42P AD=0.65P PS=1.84U
+ PD=3.3U
M59 n67 n60 GND GND nfet_03v3 L=0.28U W=0.5U AS=0.2425P AD=0.31P PS=1.97U
+ PD=2.24U
M60 n82 n67 GND GND nfet_03v3 L=0.28U W=1U AS=0.63P AD=0.42P PS=3.26U
+ PD=1.84U
M61 n61 n10 n82 GND nfet_03v3 L=0.28U W=1U AS=0.42P AD=0.65P PS=1.84U
+ PD=3.3U
M62 n68 n61 GND GND nfet_03v3 L=0.28U W=0.5U AS=0.2425P AD=0.3275P PS=1.97U
+ PD=2.31U
M63 n20 n68 GND GND nfet_03v3 L=0.28U W=0.5U AS=0.285P AD=0.315P PS=2.14U
+ PD=2.26U
M64 IPG n68 E GND nfet_03v3 L=0.28U W=1U AS=0.63P AD=0.63P PS=3.26U PD=3.26U
.ENDS ROW

X0 vdd E_pin REC_pin RSTn EN clk MODE GND IPG_pin MODEb ROW
"}
C {code_shown.sym} 260 -420 0 0 {name=s1 only_toplevel=false value="
.control
save all

** RSTn: low until 100ns then high
alter @V_RSTn[PWL] = [ 0 0  100n 0  100.001n 3.3  30m 3.3 ]

** Single latching clock pulse around 200ns
alter @V_clk[PWL] = [ 0 0  200n 0  200.001n 3.3  300n 3.3  300.001n 0  30m 0 ]

** EN: high after RSTn release
alter @V_EN[PWL] = [ 0 0  150n 0  150.001n 3.3  30m 3.3 ]

** MODE: stim phase 0-15ms (includes drain), record phase 15-30ms
alter @V_MODE[PWL]  = [ 0 0    15m 0    15.0001m 3.3   30m 3.3 ]
alter @V_MODEb[PWL] = [ 0 3.3  15m 3.3  15.0001m 0     30m 0 ]

** Brain LFP: 100uV sine at 1kHz on 1.65V mid-rail
alter @V_brain[SIN] = [ 1.65 10m 1k 0 0 0 ]

** Stim driver: biphasic pulses at 0.5/1.5/2.5/3.5/4.5 ms during stim phase,
** then held at mid-rail for 10 ms drain before MODE switches.
alter @V_stim[PWL] = [
+ 0          1.65
+ 500u       1.65
+ 500.001u   0.65
+ 600u       0.65
+ 600.001u   2.65
+ 700u       2.65
+ 700.001u   1.65
+ 1500u      1.65
+ 1500.001u  0.65
+ 1600u      0.65
+ 1600.001u  2.65
+ 1700u      2.65
+ 1700.001u  1.65
+ 2500u      1.65
+ 2500.001u  0.65
+ 2600u      0.65
+ 2600.001u  2.65
+ 2700u      2.65
+ 2700.001u  1.65
+ 3500u      1.65
+ 3500.001u  0.65
+ 3600u      0.65
+ 3600.001u  2.65
+ 3700u      2.65
+ 3700.001u  1.65
+ 4500u      1.65
+ 4500.001u  0.65
+ 4600u      0.65
+ 4600.001u  2.65
+ 4700u      2.65
+ 4700.001u  1.65
+ 30m        1.65 ]

tran 1u 30m 0 5u

** plots
set color0 = white
plot (v(MODE)/6.6)+1.4 v(REC_pin) v(E_pin) v(IPG_pin)/3 + (1.65-1.65/3)

write tb_realistic.raw
.endc
"}
