*----------------------------------------------------------------
*Model 2: Measurement Frequency Sweep of Maximum Current Produced
*----------------------------------------------------------------

.title model_1_Improved_Time_Domain_Electromechanical_Piezoelectric_Model
*Parameters

.param M=0.02
.param K=2500
.param D=0.8
.param th=0.002
.param Cp=100n
.param Rp=10MEG

.param Freq=10

******************************************************************
*Mechanical Input
******************************************************************

V1 1 0 SIN(0 0.5 {Freq})

*mass
L1 1 2 {M}
*spring
C1 2 3 {1/K}
*Damper
R1 3 0 {D}

******************************************************************
*Piezoelectric Coupling 
******************************************************************

G1 4 0 VALUE={th*I(L1)}

*Piezoelectric Capacitance
C2 4 0 {Cp}

*Leakage Resistance
R2 4 0 {Rp}

*Load 
RL 4 0 100k

*Transient
.ic V(4)=0
.tran 0.1m 500m

*Measurements

.meas tran VMAX MAX V(4) FROM=100m to=500m
.meas tran VRMS RMS V(4) FROM=100m to=500m
.meas tran IMAX MAX I(L1) FROM=100m to=500m
.meas tran IRMS RMS I(L1) FROM=100m to=500m
.meas tran PAVG AVG PAR('V(4)^2/100k') FROM 100m to 500m

.control
run
foreach f 10 20 30 40 50 60 70 80 90 100 110 120
alterparam Freq=$f
reset
meas tran VMAX MAX V(4)
plot V(4)
plot V(3)
plot V(2)
plot I(L1)


.endc
.end
