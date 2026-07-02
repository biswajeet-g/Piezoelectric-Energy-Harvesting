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

.param Fres=2950

************************************************
* MECHANICAL EXCITATION
************************************************

Vin 1 0 SIN(0 1 {Fres})

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

RLOAD 4 0 {RL}

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

.tran 10u 100m

************************************************
* MEASUREMENTS
************************************************

.meas tran VMAX MAX V(4)

.meas tran VMIN MIN V(4)

.meas tran VRMS RMS V(4)

.meas tran IRMS RMS I(RLOAD)

.meas tran PAVG AVG PAR('V(4)*I(RLOAD)')

************************************************
.control

run

echo --------------------------------------
echo LOAD OPTIMIZATION ANALYSIS
echo --------------------------------------

print vmax
print vrms
print irms
print pavg

plot V(4) title "Output Voltage"

plot I(RLOAD) title "Load Current"

.endc

.end
