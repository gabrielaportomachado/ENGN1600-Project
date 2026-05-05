v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -285 -80 -285 -30 {lab=vdd}
N -285 30 -285 70 {lab=GND}
N -215 -80 -215 -30 {lab=RSTn}
N -215 30 -215 70 {lab=GND}
N -145 -80 -145 -30 {lab=clk}
N -145 30 -145 70 {lab=GND}
N -75 -80 -75 -30 {lab=EN}
N -75 30 -75 70 {lab=GND}
N -285 120 -285 170 {lab=MODE}
N -285 230 -285 270 {lab=GND}
N -215 120 -215 170 {lab=MODEb}
N -215 230 -215 270 {lab=GND}
N -145 120 -145 170 {lab=brain_node}
N -145 230 -145 270 {lab=GND}
N -75 120 -75 170 {lab=bias_amp}
N -75 230 -75 270 {lab=GND}
N -285 320 -285 370 {lab=stim_drv}
N -285 430 -285 470 {lab=GND}
N 105 -25 165 -25 {lab=EN}
N 105 15 165 15 {lab=E_pin}
N 235 -135 235 -75 {lab=MODE}
N 265 -135 265 -75 {lab=RSTn}
N 305 -135 305 -75 {lab=clk}
N 335 -135 335 -75 {lab=MODEb}
N 405 -45 475 -45 {lab=IPG_pin}
N 475 -45 520 -45 {lab=IPG_pin}
N 520 -45 570 -45 {lab=IPG_pin}
N 405 55 475 55 {lab=REC_pin}
N 475 55 520 55 {lab=REC_pin}
N 520 55 570 55 {lab=REC_pin}
N 520 15 520 30 {lab=stim_drv}
N 570 15 570 30 {lab=GND}
N 520 115 520 145 {lab=bias_amp}
N 570 115 570 145 {lab=GND}
N 80 110 80 140 {lab=brain_node}
N 80 200 80 230 {lab=tissue_node}
N 80 290 80 320 {lab=tissue_node}
N 80 380 80 410 {lab=E_pin}
N 160 290 160 320 {lab=tissue_node}
N 160 380 160 410 {lab=E_pin}
C {vsource.sym} -285 0 0 0 {name=V_vdd value=3.3 savecurrent=false}
C {gnd.sym} -285 70 0 0 {name=l_vdd lab=GND}
C {lab_wire.sym} -285 -70 3 0 {name=p_vdd sig_type=std_logic lab=vdd}
C {vsource.sym} -215 0 0 0 {name=V_RSTn value=0 savecurrent=false}
C {gnd.sym} -215 70 0 0 {name=l_RSTn lab=GND}
C {lab_wire.sym} -215 -70 3 0 {name=p_RSTn sig_type=std_logic lab=RSTn}
C {vsource.sym} -145 0 0 0 {name=V_clk value=0 savecurrent=false}
C {gnd.sym} -145 70 0 0 {name=l_clk lab=GND}
C {lab_wire.sym} -145 -70 3 0 {name=p_clk sig_type=std_logic lab=clk}
C {vsource.sym} -75 0 0 0 {name=V_EN value=0 savecurrent=false}
C {gnd.sym} -75 70 0 0 {name=l_EN lab=GND}
C {lab_wire.sym} -75 -70 3 0 {name=p_EN sig_type=std_logic lab=EN}
C {vsource.sym} -285 200 0 0 {name=V_MODE value=0 savecurrent=false}
C {gnd.sym} -285 270 0 0 {name=l_MODE lab=GND}
C {lab_wire.sym} -285 130 3 0 {name=p_MODE sig_type=std_logic lab=MODE}
C {vsource.sym} -215 200 0 0 {name=V_MODEb value=3.3 savecurrent=false}
C {gnd.sym} -215 270 0 0 {name=l_MODEb lab=GND}
C {lab_wire.sym} -215 130 3 0 {name=p_MODEb sig_type=std_logic lab=MODEb}
C {vsource.sym} -145 200 0 0 {name=V_brain value=1.65 savecurrent=false}
C {gnd.sym} -145 270 0 0 {name=l_brain lab=GND}
C {lab_wire.sym} -145 130 3 0 {name=p_brain sig_type=std_logic lab=brain_node}
C {vsource.sym} -75 200 0 0 {name=V_bias_amp value=1.65 savecurrent=false}
C {gnd.sym} -75 270 0 0 {name=l_bias_amp lab=GND}
C {lab_wire.sym} -75 130 3 0 {name=p_bias_amp sig_type=std_logic lab=bias_amp}
C {vsource.sym} -285 400 0 0 {name=V_stim value=1.65 savecurrent=false}
C {gnd.sym} -285 470 0 0 {name=l_stim lab=GND}
C {lab_wire.sym} -285 330 3 0 {name=p_stim sig_type=std_logic lab=stim_drv}
C {row.sym} 280 0 0 0 {name=Xrow}
C {lab_wire.sym} 140 -25 0 0 {name=p_EN_at_row sig_type=std_logic lab=EN}
C {lab_wire.sym} 130 15 0 0 {name=p_E_at_row sig_type=std_logic lab=E_pin}
C {lab_wire.sym} 235 -125 3 0 {name=p_MODE_at_row sig_type=std_logic lab=MODE}
C {lab_wire.sym} 265 -125 3 0 {name=p_RSTn_at_row sig_type=std_logic lab=RSTn}
C {lab_wire.sym} 305 -125 3 0 {name=p_clk_at_row sig_type=std_logic lab=clk}
C {lab_wire.sym} 335 -125 3 0 {name=p_MODEb_at_row sig_type=std_logic lab=MODEb}
C {lab_wire.sym} 470 -45 0 0 {name=p_IPG_at_row sig_type=std_logic lab=IPG_pin}
C {lab_wire.sym} 470 55 0 0 {name=p_REC_at_row sig_type=std_logic lab=REC_pin}
C {res.sym} 80 170 0 0 {name=R_s value=1k device=resistor m=1}
C {res.sym} 160 350 0 0 {name=R_ct value=50k device=resistor m=1}
C {capa.sym} 80 350 0 0 {name=C_dl value=300n m=1 device="ceramic capacitor"}
C {res.sym} 520 -15 0 0 {name=R_drv value=100 device=resistor m=1}
C {capa.sym} 570 -15 0 0 {name=C_pad_IPG value=2p m=1 device="ceramic capacitor"}
C {res.sym} 520 85 0 0 {name=R_amp value=1G device=resistor m=1}
C {capa.sym} 570 85 0 0 {name=C_pad_REC value=2p m=1 device="ceramic capacitor"}
C {gnd.sym} 570 30 0 0 {name=l_pad_IPG lab=GND}
C {gnd.sym} 570 145 0 0 {name=l_pad_REC lab=GND}
C {lab_wire.sym} 520 30 1 0 {name=p_stim_at_Rdrv sig_type=std_logic lab=stim_drv}
C {lab_wire.sym} 520 145 1 0 {name=p_bias_at_Ramp sig_type=std_logic lab=bias_amp}
C {lab_wire.sym} 80 110 0 0 {name=p_brain_at_Rs sig_type=std_logic lab=brain_node}
C {lab_wire.sym} 80 230 0 0 {name=p_tissue_at_Rs sig_type=std_logic lab=tissue_node}
C {lab_wire.sym} 80 290 0 0 {name=p_tissue_at_Cdl sig_type=std_logic lab=tissue_node}
C {lab_wire.sym} 80 410 0 0 {name=p_E_at_Cdl sig_type=std_logic lab=E_pin}
C {lab_wire.sym} 160 290 0 0 {name=p_tissue_at_Rct sig_type=std_logic lab=tissue_node}
C {lab_wire.sym} 160 410 0 0 {name=p_E_at_Rct sig_type=std_logic lab=E_pin}
C {devices/code_shown.sym} 50 280 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {code_shown.sym} 700 -300 0 0 {name=s1 only_toplevel=false value="
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
alter @V_brain[SIN] = [ 1.65 100u 1k 0 0 0 ]

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

write tb_realistic.raw
.endc
"}
