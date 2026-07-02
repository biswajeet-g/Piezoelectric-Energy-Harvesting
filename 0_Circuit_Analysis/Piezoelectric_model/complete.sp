*===========================================================
* MODEL 10 : COMPLETE INTEGRATED PIEZOELECTRIC ENERGY HARVESTER
.title COMPLETE_PEH_MODEL

.param MASS=0.02
.param STIFF=2500
.param DAMP=0.8
.param THETA=0.002
.param CP=100n
.param RP=10Meg
.param RL=100k
.param CSTORE=470u
.param FORCE=0.5
.param FREQ=20

.options method=gear
.options reltol=1e-5
.options abstol=1e-12

V1 1 0 SIN(0 {FORCE} {FREQ})

L1 1 2 {MASS}
C1 2 3 {1/STIFF}
R1 3 0 {DAMP}

G1 4 0 VALUE={THETA*I(L1)}
C2 4 0 {CP}
R2 4 0 {RP}

.model DRECT D(IS=1e-12 N=1.1 RS=0.5)
D1 4 5 DRECT
D2 0 5 DRECT
D3 6 4 DRECT
D4 6 0 DRECT

CSTORE 5 6 {CSTORE} IC=0
RLOAD 5 6 {RL}

VBAT 7 6 DC 3.3
RBAT 5 7 5
RSENSOR 7 6 1k

.save V(4)
.save V(5)
.save V(6)
.save I(L1)

.tran 0.1m 2

.meas tran VACMAX MAX V(4) FROM=0.2 TO=2
.meas tran VDCAVG AVG PAR('V(5)-V(6)') FROM=1 TO=2
.meas tran VRMS RMS PAR('V(5)-V(6)') FROM=1 TO=2
.meas tran PLOAD AVG PAR('((V(5)-V(6))^2)/100k') FROM=1 TO=2

.control
run
plot V(4) title "Piezoelectric AC Voltage"
plot V(5)-V(6) title "Rectified DC Voltage"
plot I(L1) title "Mechanical Velocity"
.endc

.end
