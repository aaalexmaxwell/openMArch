import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */

ObjGLBlob myBlob;

void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  Anar.drawAxis();
  initGeometry();
}


void initGeometry(){
  //Anar.slidersReset();
  myBlob = new ObjGLBlob(100,100,4,6);
  Anar.camTarget(myBlob);
  Anar.slidersReset();
  //Anar.sliders(myBlob.parameters);
  Anar.sliders(myBlob);
}




void draw(){
  background(155);
  myBlob.draw();
  //myBlob.parameters.draw();
}


void keyPressed(){
  initGeometry();
}


