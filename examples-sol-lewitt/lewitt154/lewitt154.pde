/**
 * @author: @fabiantheblind
 * @license: MIT
 *
 * written for "Eingabe, Ausgabe. Grundlagen der prozessorientierten Gestaltung"
 * @FHP WS 2013/2014 by Moika Hoinkis
 *
 * create works of Sol LeWitt in Processing
 * http://www.massmoca.org/lewitt/grid.php
 */
size(450, 450); // canvas size

int gutter = 45; // the distance to the border

background(255); // just a color

int x = 0; // coordinate x
int y = 0; // coordinate y

x = gutter/2; // define x
y = gutter/2; // define y

noFill(); // we dont want anything to be filled
stroke(0);// this is a black stroke

rect(x, y, width - gutter, height - gutter); // draw a rectangle
stroke(color(145, 0, 0)); // change the strokecolor to a dark red (RGB)

int x1 = gutter; // coordinate x1
int y1 = gutter; // coordinate y1
int x2 = width-gutter; // coordinate x2
int y2 = height-gutter; // coordinate x2

/**
 * Now draw the center lines
 */
line(x1, y1, x2, y2);
line(x2, y1, x1, y2);
saveFrame("lewitt-154.png");
// we ae done

