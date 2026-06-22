*PVDF-BCZT-MXene Piezoelectric Sensor

***********************************
*Piezoelectric Element
***********************************

*Ipiezo 1 0 SIN(0 50u 5)

*Ipiezo 1 0 PULSE(+0 +300u +0 +1m +1m +20m +300m)

*Ipiezo 1 0 PULSE(+0 +100u +0 +1m +1m +100m +300m)

Ipiezo 1 0 PWL(
+0 0 
+0.05 50u 
+0.10 -20u 
+0.15 70u 
+0.20 -40u 
+0.25 90u 
+0.30 -60u 
+0.35 40u 
+0.40 -80u 
+0.45 80u 
+0.50 0) 
 
*Piezoelectric Capacitor
Cp 1 0 171n
*Leakage Resistor 
Rp 1 0 1.55Meg

***********************************
*Measurement Instrument
***********************************

Rscope 1 0 1Meg

***********************************
*Analysis
***********************************

.tran 0.1m 1s

.control 
run

*Voltage across terminal 
plot v(1)

.endc
.end
