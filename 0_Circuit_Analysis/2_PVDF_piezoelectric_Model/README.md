# PVDF-BCZT-MXene Piezoelectric Sensor Modeling Using NGSpice

## Objective
To model the electrical behavior of a PVDF-BCZT-MXene piezoelectric sensor in NGSpice and analyze its transient voltage 
response under mechanically induced charge generation.

---

# Equivalent Electrical Model

The piezoelectric sensor is represented by an equivalent circuit consisting of:

- Piezoelectric current source (Ipiezo)
- Piezoelectric capacitance (Cp)
- Leakage resistance (Rp)
- Oscilloscope input resistance (Rscope)

The equivalent circuit is shown below:

# Model Parameters

| Parameter       | Value              | Description                                    |
| --------------- | ------------------ | ---------------------------------------------- |
| Cp              | 171 nF             | Equivalent capacitance of PVDF-BCZT-MXene film |
| Rp              | 1.55 MΩ            | Leakage resistance of piezoelectric material   |
| Rscope          | 1 MΩ               | Oscilloscope input impedance                   |
| Ipiezo          | PWL Current Source | Mechanical excitation representation           |
| Simulation Time | 1 s                | Transient simulation duration                  |

---

# Component Description

### Piezoelectric Current Source (Ipiezo)

The piezoelectric material generates electrical charge when subjected to mechanical deformation.

Instead of applying an external voltage source, the generated charge is modeled as a current source because piezoelectric materials fundamentally behave as charge generators.

The current source is defined using a Piecewise Linear (PWL) waveform:

```spice
Ipiezo 1 0 PWL(...)
```

This waveform represents mechanical events such as:

- Finger tapping
- Bending
- Release after deformation
- Dynamic pressure variations

Positive current corresponds to one direction of stress, while negative current corresponds to the opposite direction.

---

### Piezoelectric Capacitance (Cp)

```spice
Cp 1 0 171n
```

The piezoelectric film behaves electrically as a capacitor.

Generated charge accumulates across the electrodes and produces voltage according to:

###### V = Q/C

  where:

    - V = Generated voltage
    - Q = Generated charge
    - C = Piezoelectric capacitance

The capacitance determines how much voltage is developed for a given amount of generated charge.

---

## Leakage Resistance (Rp)

```spice
Rp 1 0 1.55Meg
```

Real piezoelectric materials are not perfect insulators.

Charge stored within the material gradually dissipates through dielectric leakage paths.

Rp models this charge loss mechanism.

Without Rp, the generated voltage would remain indefinitely, which is physically unrealistic.

---

## Oscilloscope Input Resistance (Rscope)

```spice
Rscope 1 0 1Meg
```

The oscilloscope connected to the sensor introduces loading effects.

Most oscilloscopes have an input impedance of approximately 1 MΩ.

Including Rscope ensures that the simulation closely matches laboratory measurements.

---

# Transient Analysis

```spice
.tran 0.1m 2s
```

Transient analysis is performed with:

* Time step = 0.1 ms
* Total simulation time = 2 s

This allows observation of the complete charge generation and discharge process.

---

# Simulation Results

## Sensor Output Voltage (V(1))

The simulated waveform represents the voltage generated across the piezoelectric sensor terminals.

### Initial Region (0 – 0.05 s)

No current is generated.

The sensor remains in equilibrium and the output voltage remains approximately zero.

---

### Mechanical Excitation Region (0.05 – 0.50 s)

The PWL current source injects positive and negative current pulses.

These current pulses simulate mechanical actions such as tapping or bending.

The generated charge accumulates on the piezoelectric capacitance and produces voltage peaks.

Both positive and negative voltage excursions appear because the piezoelectric material responds differently to compression and release.

---

### Relaxation Region (After 0.50 s)

The excitation current returns to zero.

No additional charge is generated.

The voltage stored on the piezoelectric capacitance gradually discharges through:

- Leakage resistance (Rp)
- Oscilloscope resistance (Rscope)

This results in an exponential decay of the sensor voltage.

---

# Interpretation of the Output Waveform

The output waveform demonstrates three important piezoelectric phenomena:

### Charge Generation

Mechanical deformation produces electrical charge.

This charge is represented by the current source.

---

### Charge Storage

Generated charge accumulates on the equivalent capacitance of the piezoelectric film.

This causes voltage development across the sensor terminals.

---

### Charge Dissipation

After mechanical excitation is removed, stored charge leaks through the finite resistance paths.

Consequently, the voltage gradually decreases toward zero.

---

# Correlation with Experimental Observation

The simulated response closely resembles experimentally observed waveforms 
obtained from PVDF-based piezoelectric sensors connected to an oscilloscope.

Common characteristics include:

* Sudden voltage spikes during mechanical stimulation
* Polarity reversal during loading and unloading
* Gradual voltage decay after excitation removal

These characteristics confirm that the equivalent circuit successfully 
captures the primary electrical behavior of the PVDF-BCZT-MXene piezoelectric sensor.

---

# Conclusion

A PVDF-BCZT-MXene piezoelectric sensor was successfully 
modeled in NGSpice using an equivalent current source-capacitor-resistor representation. 
The simulation reproduces the generation, storage, and dissipation of charge resulting from 
mechanical excitation. The resulting voltage waveform demonstrates behavior similar to experimentally
observed piezoelectric sensor outputs, making the model suitable for sensor characterization and preliminary device analysis.
