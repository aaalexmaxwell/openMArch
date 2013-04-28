import processing.opengl.*;
import anar.*;




/*
 * Example for Anar library (Architectural Research)
 * by Guillaume LaBelle and Julien Nembrini (c) 2008
 * http://anar.ch
 */



;
Obj faces;

void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  initTest();
}


void draw(){
  background(255);
  faces.draw();

}


void initTest(){
  faces = new Obj();

  // INIT
  PtABS a = Anar.Pt(1,2,3);
  PtABS b = Anar.Pt(20,2,3);

  PtABS a0 = Anar.Pt(1,18,3);
  PtABS b0 = Anar.Pt(20,4,3);

  
  // CREATE THE FIRST FACE
  Face f0 = new Face();
  faces.add(f0);
  f0.add(a);
  f0.add(a0);
  f0.add(b0);
  f0.add(b);




  
  
  Param alpha = new Param(0f,-2*PI,2*PI);
  //alpha.mod = PI/8f;
  
  Transform t = new Transform(a0,b0);
  t.rotateZ(alpha);


  
  Pt ax = Anar.Pt(a0);
  ax.translate(0,10,0);
  
  Pt bx = Anar.Pt(b0);
  bx.translate(0,10,0);
  
  
  Face f2 = new Face();
  faces.add(f2);
  f2.add(a0);
  f2.add(ax);
  f2.add(bx);
  f2.add(b0);
  
  
  
  //TODO: This is confusing! If you move the point directly everything is fine.
  //    you expect to could be able to apply transform directly on ax and the rest is fine.
  //    but it's not.
  
//    ax.apply(t);
//    bx.apply(t);
  f2.apply(t);

  
  
  Pt axx = Anar.Pt(f2.pt(1));
  axx.translate(0,10,0);
  
  Pt bxx = Anar.Pt(f2.pt(2));
  bxx.translate(0,10,0);    
  
  
  Face f3 = new Face();
  faces.add(f3);
  f3.add(f2.pt(1));
  f3.add(axx);
  f3.add(bxx);
  f3.add(f2.pt(2));

  Transform t2 = new Transform(f2.pt(1),f2.pt(2));
  t2.rotateZ(new ParamDiv(alpha,2));
  
  f3.apply(t2);
  
  
  
  
  faces.scale(3);
  Anar.sliders(alpha);
  Anar.camTarget(faces);
  
}





