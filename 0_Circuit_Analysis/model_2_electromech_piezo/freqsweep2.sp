*-----------------------------------------------------
*MODEL 2: Resonance and Frequency Response Analysis
*-----------------------------------------------------

.title MODEL_2_Response_analysis

*****************************
*Parameters
*****************************

.param M=0.03
.param K=2500
.param D=0.8
.param th=0.002
.param Cp=100n
.param Rp=10MEG

.param Freq=20
.param Force=0.5

*Numerical Options
.options method=0.5
.options reltol=1e-5
.options abstol=1e-12

*Mechanical Input
V1 1 0 SIN(0 {Force} {Freq} 20m)
*V1 1 0 V={Force*SIN(2*pi*Freq*time)*(1-exp(-time/0.05))}

*Mass
L1 1 2 {M}
*Spring 
C1 2 3 {1/K}
*Damper
R1 3 0 {D}

*Piezoelectric Capacitance
C2 4 0 {Cp}

*Piezoelectric Coupling
G1 4 0 VALUE={th*I(L1)}

*Leakage Resistance
R2 4 0 {Rp}

*Load 
RL 4 0 100k

*Transient
.ic V(4)=0

.save all
.tran 0.1m 500m

*Measurements

.meas tran VMAX MAX V(4) FROM=100m TO=500m
.meas tran VRMS RMS V(4) FROM=100m TO=500m
.meas tran IMAX MAX I(L1) FROM=100m TO=500m
.meas tran IRMS RMS I(L1) FROM=100m TO=500m
.meas tran PAVG AVG PAR('V(4)^2/100k') FROM=100m TO=500m
*.meas tran ENERGY PARAM="PAVG*0.4"

.control
run
plot V(4) title "Piezoelectric Voltage"
plot V(3) title "Spring Deformation"
plot V(2) title "Mechanical motion"
plot I(L1) title "Mechanical Velocity"
*plot I(RL)

.endc
.end


