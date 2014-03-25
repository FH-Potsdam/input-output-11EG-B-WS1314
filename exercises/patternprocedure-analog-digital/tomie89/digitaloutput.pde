size(700, 500);
background(255);
noFill();
stroke(0);
rectMode(CENTER);
int rectsize = 320;
float r = random(0, 360);
 
for(float i = 0; i < 360; i = i + r){
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(i));
  rect(0, 0, rectsize, rectsize);
  rectsize = rectsize -20;
  if(rectsize <=0){
    break;
  }
  popMatrix();
println(i);
}
