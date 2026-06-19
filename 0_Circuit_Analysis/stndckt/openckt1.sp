*---------------------------------------
* OPEN CIRCUIT PIEZOELECTRIC HARVESER
*---------------------------------------

* MECHANICAL DOMAIN
Vforce 1 0 SIN(0 1 100)

Bpiezo 2 0 I={-0.01*V(1)}
 
Cp 2 0 1u

Ropen 2 0 1G
  
.tran 0.1m 100m

.control
run
plot V(1) 
plot V(2)

plot V(3)


.endc 

.end
