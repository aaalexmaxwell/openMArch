import processing.opengl.*;
import anar.*;




/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


Sliders parameters;
Pt      a;

Pts     myPts = new Pts();

void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  initForm();

  Pts.globalRender = new RenderPtsAll();
}

void initForm(){

  for (int i = 0; i<5; i++)
    myPts.add(Pt.rnd(100));

  Param cf = new Param(0.1f,0,1);
  PtCurve pc = new PtCurve(myPts,cf);

  a = pc;


  parameters = new Sliders();
  parameters.add(cf);
  Anar.camTarget(myPts);
}

void draw(){
  background(153);
  myPts.draw();
  a.draw();
  parameters.draw();
}


