// i/o

size(700, 990);
smooth();
background(255);
strokeWeight(1);
noFill();

// Diagonale
line(0, 990, 700, 0);

// Berechnung des Kreisradius'
float a = width;
float b = height;
float c1 = pow(a,2);
float c2 = pow(b,2);
float c = sqrt(c1 + c2);

float s = (a+ b+ c)/2;

float r = sqrt(s*(s - a)*(s - b)*(s - c))/s; 

println(r);

//rect(width-r, height-r, r, r);


// Innenkreis des Dreieck 2
ellipse(width-r, height-r, 2*r, 2*r);


rect(133,0, 133, 612); // Quadrat links oben

