v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -50 -60 -50 -30 {lab=in}
N -50 -60 40 -60 {lab=in}
N 40 -60 130 -60 {lab=in}
N 130 -60 130 -30 {lab=in}
N -50 30 -50 60 {lab=out}
N -50 60 40 60 {lab=out}
N 40 60 130 60 {lab=out}
N 130 30 130 60 {lab=out}
N -120 -0 -90 0 {lab=cbar}
N 170 0 200 0 {lab=c}
N -50 -0 -30 -0 {lab=VDD}
N -30 -20 -30 -0 {lab=VDD}
N 90 0 130 -0 {lab=GND}
N 90 0 90 30 {lab=GND}
C {symbols/pfet_03v3.sym} -70 0 0 0 {name=M1
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
C {symbols/nfet_03v3.sym} 150 0 2 0 {name=M2
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
C {ipin.sym} 40 -60 1 0 {name=p1 lab=in}
C {opin.sym} 40 60 1 0 {name=p2 lab=out}
C {ipin.sym} -120 0 0 0 {name=p3 lab=cbar}
C {ipin.sym} 200 0 2 0 {name=p4 lab=c}
C {vdd.sym} -30 -20 0 0 {name=l1 lab=VDD}
C {gnd.sym} 90 30 0 0 {name=l2 lab=GND}
