*=========================================================
* MODEL 5
* LOAD OPTIMIZATION OF PIEZOELECTRIC ENERGY HARVESTER
*=========================================================

.title MODEL_5_Load_Optimization

************************************************
* PARAMETERS
************************************************

.param Lm=20m
.param Cm=0.5u
.param Rm=150
.param Cp=120n

* Change ONLY this value for different simulations
.param RL=100k

.param Freq=2000

************************************************
* MECHANICAL EXCITATION
************************************************

Vin 1 0 SIN(0 1 {Freq})

************************************************
* MOTIONAL BRANCH
************************************************

Lm1 1 2 {Lm}

Cm1 2 3 {Cm}

Rm1 3 4 {Rm}

************************************************
* PIEZOELECTRIC CAPACITANCE
************************************************

Cp1 4 0 {Cp}

************************************************
* VARIABLE LOAD
************************************************

RLoad 4 0 {RL}

************************************************
* INITIAL CONDITIONS
************************************************

.ic V(4)=0

************************************************
* SAVE ALL
************************************************

.save all

************************************************
* TRANSIENT ANALYSIS
************************************************

.tran 10u 5m

************************************************
* MEASUREMENTS
************************************************

.meas tran VMAX MAX V(4) FROM=1m TO=5m

.meas tran VMIN MIN V(4) FROM=1m TO=5m

.meas tran VRMS RMS V(4) FROM=1m TO=5m

.meas tran IRMS RMS V(4)/{RL} FROM=1m TO=5m

.meas tran PAVG AVG PAR('(V(4)^2)/{RL}') FROM=1m TO=5m

************************************************
.control

run

echo --------------------------------------
echo LOAD OPTIMIZATION ANALYSIS
echo --------------------------------------

print VMAX
print VRMS
print IRMS
print PAVG

plot V(4) title "Output Voltage" xlimit 0 5m

plot V(4)/100k title "Load Current" xlimit 0 2m

.endc

.end
