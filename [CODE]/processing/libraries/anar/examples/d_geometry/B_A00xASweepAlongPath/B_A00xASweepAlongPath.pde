import processing.opengl.*;
import anar.*;






/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


Obj obj;

void setup(){

    size(1000,500,OPENGL);
  Anar.init(this);


  // /////////////////////////////
  Pts ptsA = new Pts();
  Pt origin;
  ptsA.add(origin = Anar.Pt(0,0,0).tag("Origin"));


  // /////////////////////////////
  Transform t = new Transform();
  t.rotateZ(PI/14f);
  t.translate(Anar.PtNull(10,0,1));
  // t.rotateX(PI/14f);


  // /////////////////////////////
  Pt previous = origin;

  for (int i = 0; i<100; i++){
    PtDER newPt = Anar.Pt(previous);
    newPt.apply(t);
    ptsA.add(newPt);
    previous = newPt;
  }


  // /////////////////////////////
  Transform baseTransform;

  baseTransform = new Transform();
  baseTransform.translate(Anar.PtNull(0,0, -20));
  baseTransform.rotateX(1f);

  // /////////////////////////////
  Pts ptsB = new Pts(ptsA,baseTransform);


  // /////////////////////////////
  obj = new SweepTwoPaths(ptsA,ptsB);

  Anar.camTarget(obj);

}


void draw(){
  background(255);
  obj.draw();
}



