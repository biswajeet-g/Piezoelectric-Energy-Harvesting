*==========================================================
* MODEL 7 : SSHI PIEZOELECTRIC ENERGY HARVESTER
* Section 1 : Parameters and Piezoelectric Excitation
*==========================================================

.title MODEL_7_SSHI_Harvester

**************************************************
* PARAMETERS
**************************************************

.param FREQ      = 2000          ; Mechanical vibration frequency (Hz)
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

**************************************************
* NUMERICAL OPTIONS
**************************************************

.options method=gear
.options reltol=1e-5
.options abstol=1e-12
.options vntol=1u
.options numdgt=6

**************************************************
* PIEZOELECTRIC SOURCE
**************************************************

* Mechanical vibration represented as AC voltage source

VPIEZO 1 0 SIN(0 {AMP} {FREQ})

**************************************************
* END OF SECTION 1
**************************************************

**************************************************
* SECTION 2 : PIEZOELECTRIC EQUIVALENT CIRCUIT
**************************************************

*-------------------------------------------------
* Piezoelectric Internal Capacitance
*-------------------------------------------------

CPZ 1 2 {CP}

*-------------------------------------------------
* Piezoelectric Leakage Resistance
*-------------------------------------------------

RPZ 2 0 {RP}

*-------------------------------------------------
* Small Series Resistance
* Improves numerical convergence
*-------------------------------------------------

RSRC 1 2 1

*-------------------------------------------------
* Save Important Nodes
*-------------------------------------------------

.save V(1)
.save V(2)

**************************************************
* END OF SECTION 2
**************************************************

**************************************************
* SECTION 3 : SSHI SWITCHING NETWORK
**************************************************

*-----------------------------------------------
* SSHI Inductor
*-----------------------------------------------

LSSHI 2 3 {LSSHI}

*-----------------------------------------------
* Voltage Controlled Switch
*-----------------------------------------------

SSSHI 3 0 4 0 SSHI_SW

*-----------------------------------------------
* Switch Model
*-----------------------------------------------

.model SSHI_SW SW
+ RON=0.05
+ ROFF=1G
+ VT=2
+ VH=0.2

*-----------------------------------------------
* Switching Pulse Generator
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

.control
run 
plot V(2)
plot V(4)
plot I(LSSHI)
.endc
.end
