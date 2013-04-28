import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


boolean record = false;


Obj     form   = new Obj();

Sliders mySliders;


void setup(){
    size(1000,500,OPENGL);
  Anar.init(this);
  Anar.drawAxis(true);
  Pts.globalRender = new RenderPtsAll();
  
  Param size = new Param(10).addToSlidersMain();

  for (int i = 0; i<7; i++){
    Obj plat = new Platonic(i,size);
    plat.translateX(i*20);
    form.add(plat);
  }

  Anar.camTarget(form);
  Anar.add(form);
}


void draw(){
  background(155);

  Anar.main.draw();
}


