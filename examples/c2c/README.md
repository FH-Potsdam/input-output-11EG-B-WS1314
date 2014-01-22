c2c
===

This sketches are part of the course ["Eingabe, Ausgabe. Grundlagen der prozessorientierten Gestaltung"](https://incom.org/workspace/4693) by Monika Hoinkis & Fabian Morón Zirfas

It shows basic computer 2 computer communication.  

##Komponents  

- Arduino IDE
- Processing IDE
- Light Dependend Resistor
- 10k Ohm Resistor
- LED

##prerequisites  
Set up your Arduino with a LDR (light dependend resistor) and the LED like this.  

- One LDR leg goes to the 5V pin 
- one LDR leg to the analog 0 pin
- connect the resistor to the analog 0 pin as well
- connect the other leg of the resitor to the GND pin
- connect the long leg of the LED to the 13 digital pin
- connect the short leg to the GND pin

![fritzing-layout](fritzing/fritzing-layout.png)  

##Port Detection  
Connect your Arduino Board to your computer adn use the sketck processing/list_serial_ports.pde to see which port number is the one you chose in the Arduino IDE.  

##Processing 2 Arduino  

1. Check your ports
2. Upload sketch arduino/c2c_incoming.ino to your board  
3. open and run the processing sketch processing/write_to_serial.pde  
4. by pressing UP and DOWN on your keyboard you can turn on a LED connected to pin 13  


##Arduino to Processing  

1. Check your ports
2. Upload sketch arduino/c2c_outgoing.ino to your board  
3. open and run the processing sketch processing/read_from_serial.pde  
4. by waving your hand over the LDR you should be able to change the background color of the processing sketch.

##Poor Mans Oscilloscope  

written by @chrismeyersfsu with edits from @positron96  

1. check your ports
2. Upload sketch arduino/poor_mans_oscilloscope.ino to your board  
3. open and run the processing sketch processing/poor_mans_oscilloscope.pde  

##Raspberry Pi  

To show how to communicate from one computer to another we use the raspberry pi.

1. Get your Pi
2. set it up like in the getting started
3. Now setup a webserver on it like this (taken from [instructables](http://www.instructables.com/id/Host-your-website-on-Raspberry-pi/?ALLSTEPS))  

get the ip adresses of all devices on your local network by entering into the terminal. Then just try to guess which one is your Raspberry pi

    arp -a

Follow these steps after [login into your pi via SSH](http://elinux.org/RPi_Remote_Access)

    Update the apt-get 
    sudo apt-get update
    #then 
    sudo apt-get install apache2 php5 libapache2-mod-php5

now you should allow overrides by editing the 000-default file, you can do that using the following comands..

    sudo vi /etc/apache2/sites-enabled/000-default

now edit the following lines
change `AllowOverride None` to `AllowOverride ALL`.

now execute the following command to restart apache with your new settings

    sudo service apache2 restart

now your site should be up and running u can go to /var/ and change the permissions on www, making it writable.

    cd /var/
    sudo chmod 777 /www


You can now access the content of the folder www in your local network. Just enter the ip of your Pi into the browser. You should see the this.  

![](raspi/std-webserver-index.html.png)  

Just for fun. Install nodejs on your raspberry pi by following [this tutorial.](http://joshondesign.com/2013/10/23/noderpi)  

##License  
except Poor mans ocilloscope sketches

Copyright (c)  2013 FH-Potsdam & Fabian "fabiantheblind" Morón Zirfas  
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software  without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to  permit persons to whom the Software is furnished to do so, subject to the following conditions:  
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  

see also http://www.opensource.org/licenses/mit-license.php

##Poor mans ocilloscope
is under GNU General Public License  

(c) 2008 Sofian Audry (info@sofianaudry.com)  
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.  

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.  

You should have received a copy of the GNU General Public License  
along with this program.  If not, see <http://www.gnu.org/licenses/>.  

