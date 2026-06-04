# Synchronous Switch Harvesting on Electromagnetic System (SSH-EM)

## Piezoelectricity
- The apperance of an electrical potential across the sides of a crystal when you subject it to the mechanical stress.
## Electromagnetic 
- When an electric field changes, it creates a magnetic field, and when a magnetic field changes, it creates an electric field.

| Piezoelectric | Electromagnetic |
|---------------|-----------------|
| High Voltage | Low Voltage |
| Low Current | High Current |
| Capacitive | Inductive |

## Schematic Diagram 
- Fig. 1 Standard Energy Harvester Circuit Diagram
<img width="363" height="174" alt="sshi 1" src="https://github.com/user-attachments/assets/81b4be89-e7bc-47e0-96d5-d9d30ea01b17" />

### Faraday's Law of Induction
- Faraday's law of induction states that a changing magnetic field induces an electromotive force (emf) in a circuit, which can generate an electric current.
    - E = -N.dΦ/dt
    - where,
      - E = induced emf
      - N = No. of turns of a coil
      - dΦ/dt = rate of change of magentic flux.
     
## Components of Energy Harvester (Standard)
1. Piezoelectric Material
2. Brigde Rectifier
3. Smoothing Capacitor
4. Load Resistor

### Steps involved in standard energy harvester
-  Piezoelectric generates AC Voltage.
-  Bridge Rectifier converts AC to DC.
-  Capacitor smooths DC.
-  Load consumes power. 

#### Battery ageing phenomenon 
- Continuous electrochemical reaction inside, leads to the shorter life span of convectional batteries.
- ###### New Bateru -> Reduced capacity -> Higher Internal resistance -> Shorter Runtime -> End of Life of the battery
