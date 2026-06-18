# Electromechanical Modeling and Simulation of a Piezoelectric Energy Harvester Using NGSpice

## 1. Introduction

Piezoelectric energy harvesting is a technique used to convert ambient mechanical vibrations into electrical energy. Piezoelectric materials generate electrical charge when subjected to mechanical stress, 
making them suitable for powering low-power electronic devices 
such as wireless sensors, IoT nodes, MEMS devices, and condition-monitoring systems.

The objective of this work is to develop an electromechanical equivalent circuit model of a piezoelectric energy harvester 
in NGSpice and analyze the complete energy conversion process from mechanical excitation to electrical power generation.

---

## 2. Principle of Piezoelectric Energy Harvesting

The piezoelectric effect is the ability of certain materials to generate electric charge when mechanical force is applied.

The energy conversion process is:

###### Mechanical Vibration → Mechanical Deformation → Piezoelectric Charge Generation → Electrical Voltage → Usable Electrical Power

When the piezoelectric structure bends due to external vibration, internal dipoles are displaced, generating an electric field across the material. This electrical energy can then be extracted through an external circuit.

---

## 3. Electromechanical Equivalent Circuit

<img width="683" height="384" alt="image" src="https://github.com/user-attachments/assets/5e7af1f2-3143-43a9-8fc0-34d548cd1f26" />

Since SPICE simulators are designed for electrical circuits, mechanical components must be represented by equivalent electrical components using the force-voltage analogy.

### Mechanical-to-Electrical Correspondence

| Mechanical Quantity | Electrical Equivalent |
| ------------------- | --------------------- |
| Force (F)           | Voltage (V)           |
| Velocity (v)        | Current (I)           |
| Displacement (x)    | Charge (Q)            |
| Mass (M)            | Inductor (L)          |
| Damping (D)         | Resistor (R)          |
| Spring Constant (K) | Capacitor (1/K)       |

This analogy allows the mechanical differential equation

###### M(d²x/dt²) + D(dx/dt) + Kx = F(t)

to be solved using standard electrical circuit analysis techniques.

---

## 4. Model Parameters

### Mechanical Parameters

##### Mass (M) = 0.01 kg = 10g

Represents the inertial mass attached to the piezoelectric structure. It stores kinetic energy and influences the resonant frequency.

##### Damping Coefficient (D) = 1 Ns/m

Represents energy losses due to air resistance, material friction, and structural damping.

##### Spring Constant (K) = 1000 N/m

Represents the stiffness of the cantilever beam. It determines the restoring force and resonant frequency.

---

### Piezoelectric Parameters

##### Coupling Coefficient (Th) = 0.05

Represents the conversion efficiency between mechanical vibration and generated electrical current.

##### Piezoelectric Capacitance (Cp) = 100 nF

Models the dielectric capacitance of the piezoelectric material.

##### Leakage Resistance (Rp) = 10 MΩ

Represents dielectric leakage and self-discharge of the piezoelectric element.

---
### Electrical Interface

##### Bridge Rectifier
- Converts the generated AC voltage into DC voltage.
##### Storage Capacitor
- Stores harvested electrical energy.
##### Load Resistance
- Represents the electrical device being powered by the harvester.

---

## 5. Working Mechanism of the Model

### Stage 1: Mechanical Excitation

A sinusoidal force source is applied:

###### F(t) = sin(2πft)

This force excites the mass-spring-damper system.

### Stage 2: Mechanical Resonance

The mass, damping, and spring components form a resonant system. 
Mechanical vibration amplitude depends on excitation frequency and damping.

The resonant frequency is:

###### fr = (1/2π)√(K/M)

For the present model:
fr ≈ 50 Hz
Near resonance, vibration amplitude increases significantly, resulting in higher harvested energy.

### Stage 3: Piezoelectric Conversion

- The controlled current source represents electromechanical coupling.
Mechanical vibration velocity generates electrical current according to:

###### Ipiezo = Th × I(Vsen)

This converts mechanical energy into electrical energy.

### Stage 4: Electrical Energy Generation

The piezoelectric capacitance and leakage resistance form the electrical equivalent of the piezoelectric material.
The generated voltage appears across the piezo terminals as an AC signal.

### Stage 5: Energy Harvesting
The bridge rectifier converts AC voltage into DC voltage.
The storage capacitor accumulates electrical energy and supplies the load resistance.

---

## 6. Simulation Results and Interpretation

🔗 [**Electromechanical Spice Code**](../stndckt/elemechockt1.spice)

### Mechanical Response – V(2)

- The V(2) waveform represents the vibration response of the mechanical resonator.
<img width="683" height="384" alt="image" src="https://github.com/user-attachments/assets/2a9517cd-1d39-44c7-82b4-8333e7afafd4" />


##### Observations:

- Oscillatory waveform around zero.
- Positive and negative displacement indicate bidirectional motion.
- Represents available mechanical energy.

##### Significance:

- This graph verifies that the mass-spring-damper system is vibrating under excitation.

---

### Piezoelectric Voltage – V(4)

- The V(4) waveform represents the AC voltage generated by the piezoelectric element.
<img width="683" height="384" alt="image" src="https://github.com/user-attachments/assets/11522832-b061-45cd-a51d-ddbe20e41241" />

##### Observations:

- Alternating positive and negative voltage.
- Voltage magnitude depends on vibration amplitude and coupling coefficient.

##### Significance:
- This waveform demonstrates successful conversion of mechanical energy into electrical energy through the piezoelectric effect.

---

### Harvested Voltage – V(5)

- The V(5) waveform represents the rectified output voltage after the bridge rectifier and storage capacitor.
<img width="683" height="384" alt="image" src="https://github.com/user-attachments/assets/948568e5-157c-4038-b8c3-cbed018232be" />


##### Observations:

- Voltage remains positive.
- Capacitor charging causes gradual voltage buildup.
- Ripple occurs due to periodic charging and discharging.

###### Significance:

- This graph confirms successful energy harvesting and storage.

---

## 10. Conclusion

An electromechanical piezoelectric energy harvester was successfully modeled using NGSpice. 
Mechanical vibrations were represented using electrical analogs of mass, damping, and stiffness. 
The piezoelectric coupling mechanism converted mechanical motion into electrical current, 
which generated AC voltage across the piezoelectric terminals. 
The rectifier and storage circuit further converted this energy into usable DC power. 
The obtained simulation results clearly demonstrate the complete energy conversion chain
from mechanical excitation to harvested electrical energy and provide a strong foundation 
for future piezoelectric energy harvesting research and hardware implementation.
