# Emergent-robust-oscillatory-IET-Syst-Biol
Emergent robust oscillatory dynamics in the interlocked feedback-feedforward loops
https://doi.org/10.1049/syb2.12111

 Prepared by G. L. Harika

 Date: 05-06-2024

 XPPAUT version: 8.0

 MATLAB version: R2023a

 Operating system: Windows
 
 
 This is the readme file to run the XPPAUT files and the MATLAB files in the supplementary. 
 
 # There are 4 .ode files for Goodwin and Repressilator models.

## GW1.ode: This file contains ODEs to simulate for the following
 
 Goodwin 1 : Fig-2A
 
 Goodwin 1 with C1-FFL (AND Logic) : [Fig-2B]
 
 Goodwin 1 with C1-FFL (OR Logic) : [Fig-2C]
 
 Goodwin 1 with I3-FFL (AND Logic) : [Fig-2D]
 
 Goodwin 1 with I3-FFL (OR Logic) : [Fig-2E, Fig-3A]

## GW2.ode: This file contains ODEs to simulate for the following
 
 Goodwin 2 
 
 Goodwin 2 with C2-FFL (AND Logic) 
 
 Goodwin 2 with C2-FFL (OR Logic) 
 
 Goodwin 2 with I4-FFL (AND Logic) 
 
 Goodwin 2 with I4-FFL (OR Logic) : [Fig-3B]   

## GW3.ode: This file contains ODEs to simulate for the following
 
 Goodwin 3 
 
 Goodwin 3 with C3-FFL (AND Logic) 
 
 Goodwin 3 with C3-FFL (OR Logic) 
 
 Goodwin 3 with I1-FFL (AND Logic) 
 
 Goodwin 3 with I1-FFL (OR Logic) : [Fig-3C]   

## REP.ode: This file contains ODEs to simulate for the following
 
 Repressilator 
 
 Repressilator with C4-FFL (AND Logic) 
 
 Repressilator with C4-FFL (OR Logic) 
 
 Repressilator with I2-FFL (AND Logic) : [Fig-3D]
 
 Repressilator with I2-FFL (OR Logic)     

# There are 5 .ode files for the Plant circadian model.

## PC_R1.ode [Fig-4A]: 
This file contains ODEs of the repressilator 1 in the plant circadian model.

## PC_R2.ode [Fig-4B]: 
This file contains ODEs of the repressilator 2 in the plant circadian model.

## PC_PR2.ode [Fig-4C]: 
This file contains ODEs of the repressilator 2 and double negative positive feedback in the plant circadian model.

## PC_P.ode [Fig-4D]: 
This file contains ODEs of the double negative positive feedback in the plant circadian model.

## PC.ode [Fig-7, Fig-8B, 8C, 8D]: 
This file contains ODEs of the full plant circadian model and the parameters of Hopf ad SNIPER bifurcation along with 10% variation parameters.

Repressilator 1: CL -| EL -| P97 -| CL

Repressilator 2: P51 -| P97 -| CL -| P51  

Positive feedback: CL -| P51 -| CL
 


## File: PC_FFLs.m [Fig-5]
This file generates the time series of individual FFLs present in Plant circadian model. 
	(Two C4-FFLs, and three I2-FFLs)

## File: PC_sens.m [Fig-6] 
It contains the MATLAB code for the simulation of Amplitude and frequency with 10% variation of each parameter. 

## Table.csv 
This file has the values of the percentage change in the amplitude and frequency for the original parameter set.
