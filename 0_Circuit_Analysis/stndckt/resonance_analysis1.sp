*Piezoelectric Energy Harvesting

*****************************************
*Resonance Analysis
*****************************************

.param M=0.01
.param K=1000
.param D=10
.param Th=0.005
.param Cp=100n
.param Rp=1Meg
.param Freq=50

*****************************************
*Mechanical Side
*****************************************

Vpiezo 1 0 SIN(0 1 {Freq})
Lmass 1 2 {M}
Rdamp 2 3 {D}
Cspring 3 0 {1/K}

*****************************************
*Piezoelectric Coupling
*****************************************

Vsensor 3 0 0
Fpiezo 4 0 Vsensor {Th}

*****************************************
*Electrical Side
*****************************************

Cpz 4 0 {Cp}
Rpz 4 0 {Rp}

*****************************************
*Bridge Rectifier
*****************************************

*D1 4 5 Dmod
*D2 0 5 Dmod
*D3 6 4 Dmod
*D4 6 0 Dmod

.model Dmod D(
+Is=1e-9
+Rs=0.1
+N=1.05
)

*****************************************

Cload 5 0 100u Ic=0
Rload 5 0 100k

*****************************************
*Analysis
*****************************************

.tran 0.1m 500m
.control
run

plot v(5)
plot v(3)
plot v(4)

meas tran VMAX MAX v(5)

.endc

.end
