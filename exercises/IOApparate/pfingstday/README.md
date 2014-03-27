![image](screenshot.jpg)

#VentiLate Timer
Intelligent Clock that reminds to ventilate your room

---

##Konzept

Der Input erfolgt über einen Sensor, welcher konstant die Konzentration von Kohlenstoffmonoxid im Raum misst. Der Output erfolgt über einen Ring aus RGB-Leds, welcher je nach CO2 Konzentration einen anderen Zustand animmt.

Eine geringe CO2 Konzentration wird durch ein angenehmes "Grün" visualisiert, welches in der Frequenz einer ruhigen Atmung pulsiert. 

Überschreitet die CO2 Konzentration einen kritischen Wert, wechselt die Farbe über Orange bis hin zu einem hektisch pulsierenden Rot, welches an eine panische Schnapp-Atmung erinnert. 

Durch blaues Leuchten wird signalisiert, dass der Raum ausreichend gelüftet wurde. 
    

---

##Wiring

![image](fritzing-layout.png)


---

## RGB-LEDs

Über Pulse-Width-Modulation (PMW) wird das Pulsieren des LED-Rings ermöglicht, welcher über die PMW-fähigen, digitalen Pins 5, 9 und 10 mit einem Arduino Micro verbunden ist.Im Prinzip können LEDs nur die Zustände „Ein“ oder „Aus“ annehmen; durch Pulsbreitenmodulation ist es aber möglich, das Intervall zwischen diesen Zuständen gezielt zu steuern. Durch die Trägheit des menschlichen Auges entsteht dadurch die Illusion, dass die LED dunkler (längeres Intervall) bzw. heller (kürzeres Intervall) leuchten würde.


---

## CO2-Sensor
Ein neuer CO2-Sensor benötigt eine Betriebdauer bzw. „Einbrennzeit“ von ca. 48 Stunden, bis konstante Werte über einen analogen Pin auslesen werden können. Das liegt am besonderen Funktionsprinzip von Metalloxid-Hableitergassensoren: Das zu messende Gas (hier CO2) regiert direkt mit einem erhitzten Metallplättlichen im Sensor, welcher je nach Konzentration des Gases seine Leitfähigkeit verändert. 

---

#####@FH Potsdam, WS 2013/2014 
[Eingabe, Ausgabe. Grundlagen der prozessorientierten Gestaltung](https://incom.org/workspace/4693)

by Prof. Monika Hoinkis & Fabian Morón Zirfas

---


#####MIT License

Copyright (c) 2013 Philipp Pfingsttag aka [pfingstday](https://github.com/pfingstday)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

see also <http://www.opensource.org/licenses/mit-license.php>