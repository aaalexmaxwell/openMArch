import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */



boolean record = false;

Obj     form;

Sliders mySliders;


void setup(){
    size(1000,500,OPENGL);
  Anar.init(this);
  Anar.drawAxis(true);
  createForm();
}


void createForm(){

  form = new Obj();
  Obj baseLines = new Obj();

  Pt track;

  Pts baseLine = new Pts();
  baseLine.add(track = Anar.Pt(0,0,0));
  baseLine.add(track = Anar.Pt(track,new Translate(20,1,1)));
  baseLine.add(track = Anar.Pt(track,new Translate(20, -1, -1)));
  Anar.sliders(track);

  Param dist = new Param(5,0,30);

  baseLines.add(baseLine);
  baseLines.add(new Pts(baseLines.line(0),new TranslateZ(dist)));
  baseLines.add(new Pts(baseLines.line(1),new TranslateY(dist)));
  baseLines.add(new Pts(baseLine,new TranslateY(dist)));


  Param di = new Param( -5, -5,0).tag("DI");
  Param id = new ParamMul(di, -2).tag("iD");

  Anar.sliders(di);
  baseLines.line(1).pt(1).translateY(di);
  baseLines.line(2).pt(1).translateY(id);

  form.add(baseLines.line(0).discretization(20));
  form.add(baseLines.line(1).discretization(20));
  form.add(baseLines.line(2).discretization(20));
  form.add(baseLines.line(3).discretization(20));

  form.lineEnd().remove(19);
  form.lineEnd(1).remove(19);
  form.lineEnd(2).remove(19);
  form.lineEnd(3).remove(19);



  for (int j = 0; j<4; j++)
    for (int i = 1; i<form.lineEnd(j).numOfPts(); i++){
      Pts a = form.lineEnd(j);
      Pts b = form.lineEnd( (j+1)%4);

      Face f = new Face();
      f.add(a.pt(i-1));
      // f.add(a.pt(i));
      f.add(b.pt(i-1));
      f.add(b.pt(i));
      form.add(f);

      f = new Face();
      f.add(a.pt(i-1));
      f.add(a.pt(i));
      f.add(b.pt(i));
      form.add(f);


    }


  Anar.add(form);

}


void draw(){
  background(155);
  Anar.main.draw();
  Anar.camTarget(form);
}


void keyPressed(){
  switch(key){
    case 'o':
      ObjExporter.export(Anar.main);
      RhinoScript.export(Anar.main);
      Autolisp.export(Anar.main);
      SketchUpRuby.export(Anar.main);
      PovRAY.export(Anar.main);
    break;
  }
}

