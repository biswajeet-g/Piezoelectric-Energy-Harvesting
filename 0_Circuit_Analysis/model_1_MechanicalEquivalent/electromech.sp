*----------------------------------------------------
*MODEL 1; Basic Electromechanical Piezoelectric Model
*----------------------------------------------------

.title model_1_electromechanical_basic_piezoelectric_harvester

*PARAMETERS

.param M=0.02
.param K=2500
.param D=0.8
*.param th=0.015
.param th=0.002

*.param Cp=47n
.param Cp=100n
*.param Rp=100MEG
.param Rp=10MEG

******************************************************
*Mechanical Input
******************************************************

*Force Input: FORCE=5N FREQUENCY=100Hz
*V1 1 0 SIN(0 5 100)
V1 1 0 SIN(0 0.5 100)
*mass
L1 1 2 {M}
*Spring
C1 2 3 {1/K}
*Damper
R1 3 0 {D}

******************************************************
*Piezoelectric Coupling
******************************************************

G1 4 0 VALUE={th*I(L1)}

******************************************************
*Piezoelectric Capacitance
******************************************************
C2 4 0 {Cp}

******************************************************
*Leakage Resistance
******************************************************
R2 4 0 {Rp}
RL 4 0 100k
*----------------------------------------------------
*Simulation
*----------------------------------------------------

.tran 0.05m 500m

*****************************************************
*Measurements
*****************************************************

.meas tran VMAX MAX V(4)
.meas tran VMIN MIN V(4)
.meas tran VRMS RMS V(4)

******************************************************

.control
run
*piezoelectric Output
plot V(4)
*Mechanical Velocity Analogue
plot I(L1)
*Mechanical Displacement
plot V(2)
*Spring Response
plot v(3)
.endc
.end
