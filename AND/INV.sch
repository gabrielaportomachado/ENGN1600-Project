v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 0 -140 0 -110 {lab=VDD}
N 0 50 0 80 {lab=GND}
N -40 -80 -40 -30 {lab=IN}
N -40 -30 -40 20 {lab=IN}
N 0 -50 0 -30 {lab=OUT}
N 0 -30 140 -30 {lab=OUT}
N 0 -30 0 -10 {lab=OUT}
N 0 -80 10 -80 {lab=VDD}
N 10 -120 10 -80 {lab=VDD}
N 0 -120 10 -120 {lab=VDD}
N 0 20 10 20 {lab=GND}
N 10 20 10 60 {lab=GND}
N 0 60 10 60 {lab=GND}
N -80 -30 -40 -30 {lab=IN}
C {symbols/pfet_03v3.sym} -20 -80 0 0 {name=M1
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
C {symbols/nfet_03v3.sym} -20 20 0 0 {name=M2
L=0.28u
W=0.5u
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
C {ipin.sym} -80 -30 0 0 {name=p1 lab=IN}
C {opin.sym} 140 -30 0 0 {name=p2 lab=OUT}
C {vdd.sym} 0 -140 0 0 {name=l1 lab=VDD}
C {gnd.sym} 0 80 0 0 {name=l2 lab=GND}
