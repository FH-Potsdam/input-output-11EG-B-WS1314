int SCREEN_X = 1440;
int SCREEN_Y = 900;

void setup() {
    size(SCREEN_X, SCREEN_Y);
    background(255, 255, 255);
    noStroke();
    noFill();
}

// Hauptschleife    
void draw() {
   
    int sizeValue = 150;
    int childSize = sizeValue / 2;
    int startX = width/2;
    int startY = 0;
    int x1 = startX + sizeValue;
    int y1 = startY + sizeValue;
    int x2 = startX - sizeValue;
    int y2 = startY + sizeValue;
    
    stroke(255, 0, 0);
    triangle(startX, startY, x1, y1, x2, y2);
    
    drawTriangleChildren(x1, y1, x2, y2, childSize);
    noLoop();
}

void drawTriangleChildren(int x1, int y1, int x2, int y2, int sizeValue) {
    if (x1 + sizeValue < SCREEN_X 
       && x1 - sizeValue > 0
       && y1 + sizeValue < SCREEN_Y
       && x2 + sizeValue < SCREEN_X
       && x2 - sizeValue > 0) {
        int child1X1 = x1 + sizeValue;
        int child1X2 = x1 - sizeValue;
        int child1Y = y1 + sizeValue;
        int child2X1 = x2 + sizeValue;
        int child2X2 = x2 - sizeValue;
        int child2Y = y2 + sizeValue;
        
        int randomValue = Math.round(random(1));
        if (randomValue == 0) {
            stroke(255, 0, 0);
        } else {
            stroke(0, 0, 0);
        }
        triangle(x1, y1, child1X1, child1Y, child1X2, child1Y);
        
        randomValue = Math.round(random(1));
        if (randomValue == 0) {
            stroke(255, 0, 0);
        } else {
            stroke(0, 0, 0);
        }
        triangle(x2, y2, child2X1, child2Y, child2X2, child2Y);
        
        drawTriangleChildren(child1X1, child1Y, child1X2, child1Y, sizeValue);
        drawTriangleChildren(child2X1, child2Y, child2X2, child2Y, sizeValue);
    }
}




