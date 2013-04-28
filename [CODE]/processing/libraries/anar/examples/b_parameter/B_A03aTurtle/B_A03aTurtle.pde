import processing.opengl.*;
import anar.*;



import java.util.ArrayList;



/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */





void setup(){
    size(800,400,OPENGL);
  Anar.init(this);

  // Setup DEFAULT rendering of our scene
  Pts.globalRender = new RenderPtsAll();
//    Pts.globalRender = new RenderPtsLineDotted(new AColor(255,0,0));
  Pt.globalRender = new RenderPtShapeOriented(new AColor(0),new AColor(255,255,0,255),Anar.scene);
  Anar.drawAxis(true);
  CSpline.globalRender.splineRes.set(12);

  Obj myObj = new Obj();
  myObj.add(new Pts(Pt.create(0,0),Pt.create(0,10)));    
  Anar.add(myObj);
  
  initForm();
}

void initForm(){

  // //////////////////////////////////////////
  // //////////////////////////////////////////
  // Initial SHAPE
  ArrayList tr = new ArrayList();
  tr.add(new TranslateX(new Param(Anar.rnd(100))));
  tr.add(new TranslateX(new Param(Anar.rnd(100))));

  ArrayList tz = new ArrayList();
  tz.add(new RotateY(new Param(0.1f,-PI,PI)));
  tz.add(new RotateY(new Param(0.2f,-PI,PI)));
  tz.add(new RotateY(new Param(0.3f,-PI,PI)));

  tz.add(new RotateZ(new Param(0.1f,-PI,PI)));
  tz.add(new RotateZ(new Param(0.2f,-PI,PI)));
  tz.add(new RotateZ(new Param(0.3f,-PI,PI)));


  Pts line = new Pts();
  Pt ori = Anar.Pt(0,0,0);

  for (int i = 0; i<50; i++){
    Pt newPt = Anar.Pt(ori);
    newPt.apply((Transform)tr.get(Anar.rndi(tr.size())));
    newPt.apply((Transform)tz.get(Anar.rndi(tz.size())));
    line.add(newPt);
    ori = newPt;
  }

  Anar.add(line);

  // //////////////////////////////////////////
  // HIRARCHY
  Anar.camTarget(Anar.main);

  for (int i = 0; i<tr.size(); i++)
    Anar.sliders((Transform)tr.get(i));

  for (int i = 0; i<tz.size(); i++)
    Anar.sliders((Transform)tz.get(i));

  print(line.parentList( -1));
}


void draw(){
  background(200);
  Anar.draw();
}


