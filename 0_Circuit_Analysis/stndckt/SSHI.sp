*==========================================================
* MODEL 7 : SSHI PIEZOELECTRIC ENERGY HARVESTER
* Section 1 : Parameters and Piezoelectric Excitation
*==========================================================

.title MODEL_7_SSHI_Harvester

**************************************************
* PARAMETERS
**************************************************

.param FREQ= 2000          ; Mechanical vibration frequency (Hz)
.param AMP       = 5             ; Piezoelectric open-circuit voltage (Vpeak)

.param MASS      = 0.02          ; Equivalent proof mass (kg)
.param KSPRING   = 2500          ; Mechanical stiffness (N/m)
.param DAMP      = 0.8           ; Mechanical damping coefficient

.param CP        = 100n          ; Piezoelectric capacitance
.param RP        = 10Meg         ; Leakage resistance

.param LSSHI     = 10m           ; SSHI Inductor
.param RLOAD     = 100k          ; Electrical Load
.param CSTORE    = 47u           ; Storage Capacitor

.param TON       = 20u           ; Switch ON duration
.param PERIOD    = 500u          ; 2 kHz switching period

.options method=gear
.options reltol=1e-5
.options abstol=1e-12
.options vntol=1u
.options numdgt=6

* Mechanical vibration represented as AC voltage source
VPIEZO 1 0 SIN(0 {AMP} {FREQ})
* Piezoelectric Internal Capacitance
CPZ 1 2 {CP}

* Piezoelectric Leakage Resistance
RPZ 2 0 {RP}

*Small Series Resistance

RSRC 1 2 1

.save all

* SSHI Inductor
LSSHI 2 3 {LSSHI}
* Voltage Controlled Switch
SSSHI 3 0 4 0 SSHI_SW

* Switch Model

.model SSHI_SW SW + RON=0.05 + ROFF=1G + VT=2 + VH=0.2

* Switching Pulse Generator
<<<<<<< HEAD
VCTRL 4 0 PULSE(+0 +5 +240u +100n +100n +20u +500u)
=======
*-----------------------------------------------

VCTRL 4 0 PULSE(
+0
+5
+240u
+100n
+100n
+20u
+500u
)

**************************************************
* END OF SECTION 3
**************************************************
.tran 1u 5m

************************************************
* SECTION 4
* FULL-WAVE BRIDGE RECTIFIER
************************************************
>>>>>>> a02c962 (updated)

* Schottky diode model
.model DSH D( +IS=1e-9 +N=1.05 +RS=0.15 +CJO=20p +TT=10n)

* Bridge Rectifier

D1 2 5 DSH
D2 0 5 DSH
D3 6 2 DSH
D4 6 0 DSH

* Positive DC node = 5
* Negative DC node = 6

* Storage Capacitor
.param CSTORE = 470u
CSTORE 5 6 {CSTORE} IC=0
*Load Resistance
.param RLOAD = 100k
RLOAD 5 6 {RLOAD}
*Bleeder Resistance (Prevents Floating Node)
RBLEED 5 6 10MEG

.options method=gear
.options reltol=1e-3
.options abstol=1e-12
.options vntol=1u
.options trtol=7

.tran 5u 20m UIC

* Piezoelectric AC Voltage
.meas tran VACMAX MAX V(2)
.meas tran VACMIN MIN V(2)

* Rectified Output Voltage
.meas tran VDCMAX MAX V(5,6) FROM=5m TO=20m
.meas tran VDCAVG AVG V(5,6) FROM=5m TO=20m
.meas tran VDCRMS RMS V(5,6) FROM=5m TO=20m

* Output Power
.meas tran PLOAD AVG PAR('V(5,6)^2/100k') FROM=5m TO=20m

.control
run

echo.
echo Piezoelectric AC Voltage
print VACMAX
print VACMIN

echo.
echo Rectified Output Voltage
print VDCMAX
print VDCAVG
print VDCRMS

echo.
echo Output Power
print PLOAD

plot V(2) title "Piezoelectric AC Voltage"
plot V(5,6) title "Rectified DC Voltage"
plot V(5) title "Positive Storage Node"
plot V(6) title "Negative Storage Node"
plot V(5,6)/100k title "Load Current"
.endc
.end

