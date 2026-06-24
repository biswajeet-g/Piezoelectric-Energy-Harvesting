# P-E Loop Calculation

## Materials Required

| Materials | Usage |
|-----------|---------|
| PVDF Polymer | nanocomposite sheet for experiment |
| Electrodes | Silver/Gold plates for conduction |
| Measurement System | MARINE India Ferroelectric Tester |
| Sample Holder | Contains Silicon Oil and induces high voltage for experiment |

## Software Used
- PE Loop Ferroelectrical Test System MARINE India
- Origin 2021

## Steps involved 
### For Data Collection
  - Polymer composite of different Mxene concentrated (0.5%, 1%, etc) were taken and cut into pieces (of dimension 5mm * 5mm).
  - That composite was placed along with an electrode inside a sample holder having conductor dipped in Silicon Oil (incured voltage of 500KV).
  - P.E. Loop device was switched ON and also the desktop was operated having the software PE Loop Ferroelectrical Test System MARINE India.
  - The different parameters were set (Maximum field - 50KV, 100KV,...,450KV).
  - Set no. of turns as 10 and capacitor as 100k ohm and other specification.
  - Click on apply -> P.E. Loop (it would take some time and it showed different graphical plots describing PE Loops at different fields
  - Chose the appropriate graphs and saved it in a location.

### For data analysis
  #### Steps for setting up files
    - To open excelsheet for Pe Loop readings:
      - Open -> Computer -> 2.5%(e.g.) -> 450 KV
    - A dialog box appreared 
      - Chose the file type that best describes
        - Delimited 
      - Delimiters
        - Choose Space
      - Column data format
        - Choose General
      - Click "Finish"

  #### Steps for setting up Origin 2021
    - New -> Workbook
    - Grid like structure appeared
      - Add Columns to the right (for updating more data).
    - Copied the PE Data from excelsheet and pasted it to the Origin Workbook.
    - Initially, 'P' kept the Y-axis and 'E' kept the X-axis.
      - The axes were interchanged 
    - Then, the two columns were selected and the graph was plotted. (Select 'Line')
    - After the graph being plotted,
      - Select "Analysis" -> "Mathematics" -> "Integrate" -> "Open Dialog"
    - There, area under the curve could be measured. 

## Some process related portfolio

- ##### Data Collected from the experiment
<img width="683" height="384" alt="Screenshot (1151)" src="https://github.com/user-attachments/assets/e4d8f835-ebb6-49bd-8efe-bec32156b188" />


- ##### PE Loop in the first quadrant
<img width="683" height="384" alt="Screenshot (1142)" src="https://github.com/user-attachments/assets/5404c6c8-80ef-48d7-ad42-51ab2d43632a" />

- ##### Charging Condition         
<img width="683" height="384" alt="Screenshot (1141)" src="https://github.com/user-attachments/assets/94a607ef-782f-475f-976c-462167b4b918" />


- ##### Discharging Condition
<img width="683" height="384" alt="Screenshot (1140)" src="https://github.com/user-attachments/assets/16b371dd-f18e-4162-b8b4-faccbe568c80" />


### Calculation of Efficiency at 100KV

<img width="683" height="384" alt="image" src="https://github.com/user-attachments/assets/b437b158-eb2c-439b-abeb-56138089eade" />


| Sample | Pmax (uc/cm^2) | Prec (uc/cm^2) | Coercive Field (kV/cm) | Wtotal | Wrec | efficiency (n) |
|---|--|--|--|--|--|--|
| 0.5% | 0.014 | 0.008 | 40.034 |
| 1% | 0.017 | 0.009 | 49.774 |
| 2% | 0.016 | 0.007 | 34.792 |
| 2.5% | 0.019 | 0.009 | 41.132 |

<img width="683" height="384" alt="image" src="https://github.com/user-attachments/assets/7e83b519-a335-45f7-9f60-b058bb090f22" />



