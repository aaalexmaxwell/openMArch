import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


Obj myObj;

Param a, b, c, h;


void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  Anar.drawAxis();

  a = new Param(10,0,40).tag("a");
  b = new Param(28,0,100).tag("b");
  c = new Param(8/3f,0,10).tag("c");
  h = new Param(0.01f,0,0.1f).tag("h");

  Anar.sliders(a);
  Anar.sliders(b);
  Anar.sliders(c);
  Anar.sliders(h);


  initForm();
}


void initForm(){
  myObj = new Obj();


  Pt base = Anar.Pt(0.1f,0,0);
  myObj.add(base);


  for (int i = 0; i<10000; i++){
    float x1 = base.x()+h.get()*a.get()* (base.y()-base.x());
    float y1 = base.y()+h.get()* (base.x()* (b.get()-base.z())-base.y());
    float z1 = base.z()+h.get()* (base.x()*base.y()-c.get()*base.z());

    Pt newBase = Anar.Pt(x1,y1,z1);
    Pts line = new Pts(base,newBase);

    // if(i%2==0)
    line.stroke(i%250);

    myObj.add(line);
    base = newBase;


  }

  Anar.camTarget(myObj);

}


void draw(){
  background(155);
  myObj.draw();
}


void keyPressed(){
  if(key==' ')
    initForm();
}


