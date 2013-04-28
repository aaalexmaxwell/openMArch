import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


Anar myScene;
Obj  form = new Obj();

Pt a,b,c;

void setup(){
    size(1000,500,OPENGL);
  Anar.init(this);
  Anar.drawAxis(true);
  createForm();
}


void createForm(){

  a = Anar.Pt(0,0,0);
  b = Anar.Pt(20,0,0);
  c = Anar.Pt(20,55,0);

  Pts myLine = new Pts();
  myLine.add(a);
  myLine.add(b);
  myLine.add(c);
  myLine.stroke(0,0,255);
  form.add(myLine);


  Pt norm = new PtNormal(a,b,c,10);
  Pts normLine = new Pts(b,norm);
  normLine.stroke(255,0,0);

  form.add(normLine);

}


void draw(){
  background(255);
  form.draw();
  
  Anar.text3D("a",a);
  Anar.text3D("b",b);
  Anar.text3D("c",c);
}


