int anzahl = 8;
float[] x1 = new float[anzahl];
float[] y1 = new float[anzahl];

background (#ffffff);
size (1280,720); 
ellipseMode(CENTER); 
smooth();
fill (#000000);
  
// Füllen des Arrays (Kreiskoordinaten)
for (int i = 0; i < anzahl; i++){
  x1[i] = random (100,1180);
  y1[i] = random (100,620);
  int groesse = round(random(20,50)); 
  
// zeichne größten Kreis mit Umrandung  
if (i < 1) {
  int umrandung = round(random(80,170)); 
  ellipse(x1[i],y1[i],60,60);
  noFill(); 
  stroke(#FF1212);
  ellipse(x1[i],y1[i],umrandung,umrandung);
}

// zeichne restliche Kreise
  else { 
  stroke(#000000);
  fill(#000000);
  ellipse(x1[i],y1[i],groesse, groesse);
}
}

int i = 0; 

// zeichen Verbindungen zwischen den Kreisen
for (i=0; i < anzahl; i++){
line (x1[0],y1[0],x1[i],y1[i]);
}

for (i=0; i < anzahl; i++){
line (x1[1],y1[1],x1[i],y1[i]);
}

for (i=0; i < anzahl; i++){
line (x1[2],y1[2],x1[i],y1[i]);
}

for (i=0; i < anzahl; i++){
line (x1[3],y1[3],x1[i],y1[i]);
}

for (i=0; i < anzahl; i++){
line (x1[4],y1[4],x1[i],y1[i]);
}

for (i=0; i < anzahl; i++){
line (x1[5],y1[5],x1[i],y1[i]);
}

for (i=0; i < anzahl; i++){
line (x1[6],y1[6],x1[i],y1[i]);
}

for (i=0; i < anzahl; i++){
line (x1[7],y1[7],x1[i],y1[i]);
}

// Verbindungen von den Kreismittelpunkten zum Rand
for (i=0; i < anzahl; i++) {
  line (x1[i],y1[i],0,random(0,width));
}

save("screenshot.png");











  




