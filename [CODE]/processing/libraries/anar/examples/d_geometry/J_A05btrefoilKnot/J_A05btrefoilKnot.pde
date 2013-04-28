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
  
  Anar.add(trefoilknot());
}

Obj trefoilknot(){

  Obj module = new Obj();

  Param radius = new Param(100,0,200).addToSlidersMain();
  Param h1 = new Param(50,-100,100).addToSlidersMain();
  
  Face triangle = new Circle(radius,3).fill(255,20);
  module.add(triangle);
  
  Obj upper = new Obj();
  Obj lower = new Obj();
  
  for(int i=0; i<triangle.numOfPts();i++)
  {
    Pt edge = new PtMid(triangle.pt(i),triangle.ptMod(i+1));
    upper.add(new Pts(edge, Anar.Pt(edge).translateZ(h1)));
    lower.add(new Pts(edge, Anar.Pt(edge).translateZ(h1.inv())));
  }
  
  module.add(upper);
  module.add(lower);
  
  
  Pts knotGuide = new Pts();
  
  for(int i=0; i<triangle.numOfPts();i++)
  {
    knotGuide.add(triangle.pt(i));
    knotGuide.add(upper.lineMod(i+2).pt(1));      
    knotGuide.add(lower.lineMod(i+1).pt(1));      
  }
  
  CSpline knot = new CSpline(knotGuide);
  knot.closedMode = true;
  knot.mode = CSpline.NEXT;
  
  module.add(knot);
  
  //Create Frenet
  Pts keyPoints = knot.discretization(100);
  Param frenetLength = new Param(20,0,50).addToSlidersMain();
  
  for(int i=0; i<keyPoints.numOfPts(); i++)
    module.add(new FrenetFrame(keyPoints.ptMod(i),keyPoints.ptMod(i+1),keyPoints.ptMod(i+2),frenetLength));
  

  return module;
}


void draw(){
  background(155);
  Anar.draw();
}



