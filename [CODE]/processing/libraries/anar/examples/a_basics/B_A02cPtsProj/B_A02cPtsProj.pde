import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */



Pts  myPtsProj = new Pts();
Pts  myPtsInter = new Pts();
Face f;

Pt interactive,fix,proj,inter;

void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  initForm();
  
  Anar.drawAxis();

  Pts.globalRender = new RenderPtsAll();
}

void initForm(){

  Param v = new Param(50,0,200).addToSlidersMain();
  Param z = new Param(0);
  
  // create points out of plane z=0
  interactive = Anar.Pt(z,v,v).tag("interactive");
  fix = Anar.Pt(10,20,30).tag("fix");
  
  Pt b = Anar.Pt(-50,-50,20);
  Pt c = Anar.Pt(50,0);
  Pt d = Anar.Pt(0,50);
  
  f = new Face();
  f.add(b);
  f.add(c);
  f.add(d);    

  inter = new PtProj(interactive,b,c,d).tag("projected (ortho)");
  proj = new PtProj(interactive,fix,b,c,d).tag("projected (directional)");
  
  myPtsProj.add(interactive);
  myPtsProj.add(fix);
  myPtsProj.add(proj);
  
  myPtsInter.add(interactive);
  myPtsInter.add(inter);
  
}

void draw(){
  background(153);
  fill(0);
  Anar.text3D(interactive.toString(),interactive);
  Anar.text3D(fix.toString(),fix);
  Anar.text3D(proj.toString(),proj);
  Anar.text3D(inter.toString(),inter);
      
  myPtsProj.draw();
  myPtsInter.draw();
  f.draw();
}


