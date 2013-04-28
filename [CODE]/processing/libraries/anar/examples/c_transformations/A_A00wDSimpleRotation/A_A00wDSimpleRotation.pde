import processing.opengl.*;
import anar.*;






/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */

Obj   result;
Param angle;

void setup(){

    size(1000,500,OPENGL);
  Anar.init(this);
  Anar.drawAxis(true);
  Anar.drawReferenceFrame(true);
  
  initForm();
}


void initForm(){

  result = new Obj();

  // ///////////////////////
  //Random Axis
  Pt p1 = Pt.rnd(100,100,100);
  Pt p2 = Pt.rnd(100,100,100);

  Pts axis = new Pts(p1,p2).stroke(255,0,0);
  result.add(axis);

  // ///////////////////////
  //Note here you could use a different object.
  //    Using translateX won't position the axis perpendicularly to axis.
  Pts rotatedObject = new Pts().stroke(50,255,0);
  rotatedObject.add(axis.copy().translateX(20));
  result.add(rotatedObject);

  // ///////////////////////
  Anar.slidersReset();
  angle = new Param(0).addToSlidersMain();
  Transform allign1 = new Transform(axis.pt(0),axis.pt(1)).rotateZ(angle);
  rotatedObject.apply(allign1);
}


void draw(){
  background(80);
  angle.set(frameCount/10f);
  result.draw();
}

void keyPressed(){
  if(key==' ')
    initForm();
}



