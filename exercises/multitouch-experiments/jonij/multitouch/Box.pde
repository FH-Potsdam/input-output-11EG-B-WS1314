class Box {
  Body body;      
  int farbe;
  int hell;
  float w,h;

  Box(float x, float y) {
    w = h = random(10,20);

    BodyDef bd = new BodyDef();			
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);


    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH); 
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 1.3;

    body.createFixture(fd);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);		
    float a = body.getAngle();


farbe = farbe+1;
if (farbe == 100){farbe = 0;}


float big = random(0.5,1.5);
if (big < 1) {hell = 100;} else {hell = 50;}


    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(farbe,100,hell);
    noStroke();
    rectMode(CENTER);
    ellipse(0,0,w*big,h*big);
    popMatrix();
  }

}

