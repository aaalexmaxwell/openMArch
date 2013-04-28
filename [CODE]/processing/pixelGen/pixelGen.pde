import processing.pdf.*;

void setup(){
  size(2850,2850,P3D);

  beginRaw(PDF, "pixelGen.pdf");
  noLoop();
  background(255,255,255);
  
}

void draw(){
  for (int i=0; i < 120000; i++){
    float xX = (random(0,407));
    float yY = (random(0,407));
    int x = 7*int(xX);
    int y = 7*int(yY);
//    float colCol = random(0,150);
//    int col = int(colCol);
    fill(150,150,150);
    stroke(255);
    rectMode(CORNER);
    rect(x,y, 7,7);
  }
//  save("test.tif");

    endRaw();
    exit();

}



