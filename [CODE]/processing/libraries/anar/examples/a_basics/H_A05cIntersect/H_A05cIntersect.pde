import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


Obj myObj = new Obj();

RenderPts dotted = new RenderPtsLineDotted(color(255,255,0));

Pt origin = Anar.Pt(0,0,0);
PtIntersect inter,interSkew;

void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  myObj = createModule();
}

Obj createModule(){
  // Initialize a local object
  Obj module = new Obj();

  // First construction: a basic line
  Pts line1 = new Pts();
  Pts line2 = new Pts();
  Pts line3 = new Pts();
  
  Param c = new Param(40,0,100).addToSlidersMain();
  Param nll = new Param(0);
  
  line1.add(0,0,0);
  line1.add(30,20,0);
  
  line2.add(60, -20,0);
  line2.add(Anar.Pt(c,nll,nll));
  
  line3.add(50, -20,0);
  line3.add(Anar.Pt(c,nll,c));
  
  
  module.add(line1);
  module.add(line2);
  module.add(line3);
  


  // Create set of Points from an uniform distribution of points
  inter = new PtIntersect(line1.pt(0),line1.pt(1),line2.pt(0),line2.pt(1));
  module.add(inter);
  
  // Create projection lines.
  module.add(new Pts(line1.pt(1),inter).render(dotted));
  module.add(new Pts(line2.pt(1),inter).render(dotted));
  

  interSkew = new PtIntersect(line1.pt(0),line1.pt(1),line3.pt(0),line3.pt(1));
  module.add(interSkew);

  Pts skewLine = new Pts();
  
  skewLine.add(interSkew.getInterA());
  skewLine.add(interSkew.getInterB());
  skewLine.render(dotted);
  
  module.add(skewLine);
  
  interSkew.getInterA().fill(255,0,0);
  interSkew.getInterB().fill(255,0,0);
  
  module.add(interSkew.getInterA());
  module.add(interSkew.getInterB());
  
  Pts aa = new Pts(Pt.create(0,0,0),Pt.create(0,1,0),Pt.create(0,2,0));
  println(aa.angle(1)/(2*PI)*360);

  return module;
}


void draw(){
  background(155);

  fill(50);
  Anar.text3D("intersection "+inter.toString(),inter);
  Anar.text3D("skew "+interSkew.toString(),interSkew);

  Anar.text3D("skew on line1",interSkew.getInterA());
  Anar.text3D("skew on line3",interSkew.getInterB());
  
  float angle = Pts.angle(myObj.line(0),myObj.line(1))/(2*PI)*180;
  Anar.text3D("alpha "+angle,myObj.line(0).pt(0));
  
  Anar.camTarget(myObj);
  myObj.draw();
}


void keyPressed(){

  if(key==' ')
    RhinoScript.export(myObj,"curveTest");
}


