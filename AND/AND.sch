v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -80 -70 -80 -30 {lab=IN0}
N -150 -10 -80 -10 {lab=IN0}
N -80 -30 -80 -10 {lab=IN0}
N -40 -170 -40 -100 {lab=vdd}
N -40 -170 0 -170 {lab=vdd}
N 80 -170 80 -100 {lab=vdd}
N 0 -170 80 -170 {lab=vdd}
N -40 -70 -30 -70 {lab=vdd}
N -30 -120 -30 -70 {lab=vdd}
N -40 -120 -30 -120 {lab=vdd}
N 80 -70 90 -70 {lab=vdd}
N 90 -120 90 -70 {lab=vdd}
N 80 -120 90 -120 {lab=vdd}
N -40 -40 -40 -20 {lab=#net1}
N 80 -40 80 -20 {lab=#net1}
N -40 -20 20 -20 {lab=#net1}
N 20 -20 20 20 {lab=#net1}
N 20 20 220 20 {lab=#net1}
N 20 -20 80 -20 {lab=#net1}
N 20 210 20 250 {lab=GND}
N 20 180 30 180 {lab=GND}
N 30 180 30 220 {lab=GND}
N 20 220 30 220 {lab=GND}
N 20 120 20 150 {lab=#net2}
N 20 90 40 90 {lab=GND}
N 40 90 40 230 {lab=GND}
N 20 230 40 230 {lab=GND}
N -150 50 -70 50 {lab=IN1}
N -90 180 -20 180 {lab=IN1}
N -80 -10 -80 90 {lab=IN0}
N 20 20 20 60 {lab=#net1}
N -70 50 0 50 {lab=IN1}
N -80 90 -20 90 {lab=IN0}
N -100 180 -90 180 {lab=IN1}
N -100 50 -100 180 {lab=IN1}
N 0 -70 0 50 {lab=IN1}
N 0 -70 40 -70 {lab=IN1}
N 300 20 320 20 {lab=OUT}
C {opin.sym} 320 20 0 0 {name=p2 lab=OUT}
C {ipin.sym} -150 -10 0 0 {name=p3 lab=IN0}
C {ipin.sym} -150 50 0 0 {name=p1 lab=IN1}
C {symbols/nfet_03v3.sym} 0 90 0 0 {name=M1
L=0.28u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 0 180 0 0 {name=M2
L=0.28u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} -60 -70 0 0 {name=M3
L=0.28u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 60 -70 0 0 {name=M4
L=0.28u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {gnd.sym} 20 250 0 0 {name=l1 lab=GND}
C {vdd.sym} 20 -170 0 0 {name=l2 lab=vdd}
C {AND/INV.sym} 250 20 0 0 {name=x1}
