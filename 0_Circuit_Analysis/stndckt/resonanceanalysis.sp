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

.meas ac VMAX MAX V(4)

.meas ac IMAX MAX i(Vin)

.meas ac PMAX MAX PAR('V(4)^2/RL')

*******************************
.control

run

set units=degrees
*Magnitude Response
plot db(V(4))
*Phase Response
plot phase(V(4))
*Output Voltage
plot V(4)
*Input Current
plot -i(Vin)

*plot par('V(4)^2/100k')

.endc

.end
