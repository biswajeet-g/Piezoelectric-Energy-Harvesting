*==========================================================
* MODEL 4
* Resonance and Frequency Response of Piezoelectric Harvester
*==========================================================

.title MODEL_4_Frequency_Response

*******************************
* Parameters
*******************************

.param Lm=20m
.param Cm=0.5u
.param Rm=150
.param Cp=120n
.param RL=100k

*******************************
* AC Excitation
*******************************

Vin 1 0 AC 1

*******************************
* Motional Branch
*******************************

Lm1 1 2 {Lm}
Cm1 2 3 {Cm}
Rm1 3 4 {Rm}

*******************************
* Piezoelectric Capacitance
*******************************

Cp1 4 0 {Cp}

*******************************
* Electrical Load
*******************************

RL1 4 0 {RL}

*******************************
* Frequency Sweep
*******************************

.ac dec 200 10 10000

*******************************
* Measurements
*******************************

.meas ac VMAX MAX vm(4)

.meas ac IMAX MAX i(Vin)

.meas ac PMAX MAX PAR('vm(4)^2/RL')

*******************************
.control

run

set units=degrees

plot db(v(4))

plot phase(v(4))

plot vm(4)

plot i(Vin)

plot par('vm(4)^2/100k')

.endc

.end
