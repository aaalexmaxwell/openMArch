import processing.opengl.*;
import anar.*;

// import geometry.Point3D;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  initForm();
}


void initForm(){
  Transform t = new Transform();
  t.rotateZ(PI/8f);
  t.translate(Anar.PtNull(10,0,1));

  Pt origin = Anar.Pt(0,0,0);
  Pts pts = new Pts();
  pts.add(origin);

  Pt previous = origin;

  for (int i = 0; i<100; i++){
    Pt q = Anar.Pt(previous,t);
    pts.add(q);
    previous = q;
  }

  pts.color(252,0,0);

  Anar.add(pts);
  Anar.add(origin);
  Anar.camTarget(Anar.main);
}


void draw(){
  background(155);
  Anar.draw();
}



