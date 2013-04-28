import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  Anar.drawAxis();
//    Anar.useCameraQuat();
  createGeometry();
}



void createGeometry(){
  Anar.slidersReset();
  Anar.mainReset();
  
  Obj part = new Box(10,5,300);
  Anar.add(part);
  
  Param maxAlpha = new Param(2*PI/48,-2*PI/2,2*PI/2).addToSlidersMain();
  Param maxTheta = new Param(2*PI,-2*PI,2*PI).addToSlidersMain();
  
  for(int i=0; i<500; i++)
  {
    int randomPart = Anar.rndi(Anar.numOfObj());
    Face f = Anar.obj(randomPart).face(5);
    Obj newPart = part.copy().place(f.pt(1));
    
    Param alpha = maxAlpha.multiply(Anar.rnd());
    Param theta = maxTheta.multiply(Anar.rnd());
    
    Transform t2 = new Transform(f.pt(0),f.pt(1),f.pt(2)).rotateZ(theta).rotateY(alpha);
    newPart.apply(t2);
    
    Anar.add(newPart);
  }
  Anar.camTarget();
}




void draw(){
//    Scene.blendRenderNormal();
  background(155);
  Anar.draw();
  Anar.camTarget();
}


void keyPressed(){
  createGeometry();
}


