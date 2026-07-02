*-------------------------------------------------------
*Model 3: AC-Dc Rectifier and Power Conversion
*-------------------------------------------------------

.title model_3_AC_DC_Conversion

*parameters
.param M=0.02
.param K=2500
.param D=0.8
.param th=0.002
.param Cp=100n
.param Rp=10MEG
.param Freq=10
.param Force=0.5

*Numerical Options 
.options method=0.5
.options reltol=1e-5
.options abstol=1e-12

*Mechanical Input
V1 1 0 SIN(0 {Force} {Freq} 20m)

*Mass
L1 1 2 {M}

*Spring
C1 2 3 {1/K}

*damper
R1 3 0 {D}

*Piezoelectric Capacitance
C2 4 0 {Cp}

*Piezoelectric Coupling
G1 4 0 VALUE={th*I(L1)}

*Leakage Resistance
R2 4 0 {Rp}

*Full wave brigde rectifier
.model Drect D(Is=1e-12 N=1.2 Rs=1)
D1 4 5 Drect
D2 0 5 Drect
D3 6 4 Drect
D4 6 0 Drect

*Storage Capacitor
Cstore 5 6 470u Ic=0

*Load
RL 5 6 100k
.save all
.tran 0.1m 800m

*measurements
.meas tran VDC AVG PAR('V(5)-V(6)')
.meas tran VAVG AVG PAR('V(5)-V(6)')
.meas tran VRMS RMS PAR('V(5)-V(6)')
.meas tran PLOAD AVG PAR('(V(5)-V(6))^2/100k')
.meas tran ILOAD AVG PAR('(V(5)-V(6))/100k')
.control
run
plot V(4) title "Piezoelectric AC Voltage"
plot V(5)-V(6) title "Rectified DC Voltage"
plot ((V(5)-V(6)/100k) title "Load Current"
.endc
.end

