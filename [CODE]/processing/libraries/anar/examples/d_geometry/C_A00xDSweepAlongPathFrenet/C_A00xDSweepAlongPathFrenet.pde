import processing.opengl.*;
import anar.*;






/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */

Obj   obj;
Param angle = new Param(PI/14f, -PI,PI);

void setup(){
    size(1000,500,OPENGL);
  Anar.init(this);
  initForm();
  Anar.sliders(angle);
}


Param sizeFrenet = new Param(10f);

void initForm(){

  obj = new Obj();

  // /////////////////////////////
  Pts ptsA = new Pts();
  Pt origin;
  ptsA.add(origin = Anar.Pt(0,0,0).tag("Origin"));

  // /////////////////////////////
  Transform t = new Transform();
  t.rotateZ(angle);
  t.translate(Anar.PtNull(5,0,1));

  // /////////////////////////////
  Pt previous = origin;

  for (int i = 0; i<100; i++){
    PtDER newPt = Anar.Pt(previous);
    newPt.apply(t);
    ptsA.add(newPt);
    previous = newPt;
  }

  // Spiral created
  // /////////////////////////////
  // /////////////////////////////
  obj.add(ptsA);

  // /////////////////////////////

  for (int i = 1; i<100-1; i++){
    FrenetFrame TBN = new FrenetFrame(ptsA.pt(i-1),ptsA.pt(i),ptsA.pt(i+1),sizeFrenet);
    obj.add(TBN);
  }

}


void draw(){
  background(255);

  obj.draw();
  Anar.camTarget(obj);
}



