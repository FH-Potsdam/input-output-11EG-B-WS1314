 
#Mimose Project  
__Simulation of a sensitive plant using musclewire and transparent paper.__



 [@jensra](https://github.com/jensra)
  
  
  Potsdam, DE/GER
  
  January 2014 
  
  ____
 
 *Class: »Eingabe, Ausgabe«, Prof. Monika Hoinkis, FH Potsdam*  
*With the help of Fabian Morón Zirfas, FH Potsdam, special thanks*

____
 
__Summary__  
The goal of the Mimose project was to simulate a touch sensitive plant consisting of noiseless musclewire and lightweight transparent paper only.    

*See media folder for images and videos.* Please note that the demo video is supposed to visualise the effect and does not display the actual setup. The demo video shows a tilt switch which is not actually connected. __Since there were multiple unsolved problems with the actuation of the musclewire within the project, the demo video is a fake. __ 
  
Several tests before revealed that the usage of musclewire is not as easy as I thought. It was almost impossible to control the actual effect (e.g. the direction of the contraction). Sometimes it seemed like the wire would rather expand than contract.
  
The code and Fritzing layout attached support an easy setup which unfortunately didn't work in the end, either. Replace the musclewire in the Fritzing layout by a few more cords including crocodile clips. 
____  

__Technical details__  
Board: Arduino UNO  
Source: 9V Battery  
Special components: FLEXINOL (TM) Muscle Wire LT (70° C) 0.006", approx. 20-30cm  
Other components: Push button; Green LED; 220 Ohm resistor with 10% tolerance (I think. Colour code red, red, brown, gold); Cords; Crocodile clips; Sellotape (TM); Transparent Paper; Aluminium foil; Carton
____
__Attention!__  
__Muscle wire heats up when current runs through it. The Low Temperature (LT) version heats up to 70° Celsius. Do not touch the wire while it is activated and wait until it cooled down again before touching it. Although paper usually doesn't burn at 70° C, make sure the materials you use and the subsoil are fireproof – or at least have an extinguisher at hand.__
____

![fritzing-layout](fritzing-layout.png)
![image](screenshot.png)



__Code (Arduino)__  
see *jensra.ino*