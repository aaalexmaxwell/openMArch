import processing.opengl.*;
import anar.*;








Pts control;
BSpline bsp;

void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  Anar.drawAxis();
  initForm();
}

void initForm(){
  control = new Pts();
  for(int i=0; i<10; i++)
  {
    control.add(Anar.Pt(i*10,-i*2,0));
    control.add(Anar.Pt(i*10+5,10+i*2,0)); 
  }
  
//    control.add(Anar.Pt(0,0,0));
//    control.add(Anar.Pt(10,10,0));
//    control.add(Anar.Pt(20,15,0));
//    control.add(Anar.Pt(30,0,0));
  
  control.stroke(255,0,0);
  Anar.camTarget(control);
  
  bsp = new BSpline(control,2);
  bsp.stroke(0,255,0);
}

void draw(){
  background(155);
  control.draw();
  bsp.draw();
}



