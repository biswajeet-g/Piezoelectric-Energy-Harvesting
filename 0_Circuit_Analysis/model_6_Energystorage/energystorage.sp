****************************************************
* MODEL 6 : Energy Storage using Piezoelectric Harvester
****************************************************

.title MODEL_6_Energy_Storage

****************************************************
* PARAMETERS
****************************************************

.param Force = 5
.param Freq = 2000
.param Cp = 100n
.param Rp = 10Meg
.param RL = 100k
.param Cstore= 220u

****************************************************
* PIEZOELECTRIC SOURCE
****************************************************

Vin 1 0 SIN(0 {Force} {Freq})

Cpz 1 2 {Cp}
Rpz 2 0 {Rp}

****************************************************
* FULL BRIDGE RECTIFIER
****************************************************

.model Dpiezo D(Is=1e-12 N=1.5 Rs=1)
D1 2 3 Dpiezo
D2 0 3 Dpiezo
D3 4 2 Dpiezo
D4 4 0 Dpiezo

****************************************************
* STORAGE SECTION
****************************************************

Cstore 3 4 {Cstore} IC=0

****************************************************
* LOAD
****************************************************

Rload 3 4 {RL}

****************************************************
* ANALYSIS
****************************************************

.tran 2u 10m

****************************************************
* MEASUREMENTS
****************************************************

.meas tran VMAX MAX V(3,4)
.meas tran VAVG AVG V(3,4)
.meas tran VRMS RMS V(3,4)
.meas tran PLOAD AVG PAR('(V(3,4)^2)/100k')

****************************************************
* CONTROL
****************************************************
.control
run
echo
echo ===============================
echo MODEL 6 : ENERGY STORAGE
echo ===============================

plot V(2) title "Piezoelectric AC Voltage"
plot V(3,4) title "Stored Capacitor Voltage"
plot V(3)
plot V(4)
.endc
.end
