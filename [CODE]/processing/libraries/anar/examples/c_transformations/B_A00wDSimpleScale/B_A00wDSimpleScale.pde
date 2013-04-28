import processing.opengl.*;
import anar.*;






/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */




Obj   result;

Param value;


void setup(){

    size(1000,500,OPENGL);
  Anar.init(this);

  Anar.drawAxis(true);

  initForm();

}


void initForm(){

  result = new Obj();
  // ///////////////////////

  // three random points
  Pt pA = Pt.rnd(100,100,100);
  Pt pB = Pt.rnd(100,100,100);
  Pt pC = Pt.rnd(100,100,100);

  // create a rectangular basis to construct an orthogonal box
  Pt p1 = pA;
  Pt p2 = pB;
  Pt p3 = new PtCross((Pt)pA.minus(pB),(Pt)pA.minus(pC));
  float div = 100f;
  p3.scale(1/div,1/div,1/div);
  p3.translate(pA);

  Pt p4 = ((Pt)p1.minus(p2)).plus((Pt)p1.minus(p3)).plus(p1);

  Face f = new Face();
  f.add(p1);
  f.add(p2);
  f.add(p4);
  f.add(p3);

  Pt extrude = new PtCross((Pt)p1.minus(p2),(Pt)p1.minus(p3));
  int m = 10;
  if(extrude.length()>0)
    extrude.scale(m/extrude.length(),m/extrude.length(),m/extrude.length());

  Obj box = new Extrude(f,extrude);
  box.fill(255,0,0);
  result.add(box);
  result.add(p4);

  // ///////////////////////

  value = new Param(1);
  Param un = new Param(1);

  float rnd = random(1);

  Scale scale = new Scale(un,un,un);

  if(rnd<.33f)
    scale = new Scale(value,un,un);
  else
    if(rnd<.33f)
      scale = new Scale(un,value,un);
    else
      scale = new Scale(un,un,value);

  // ///////////////////////

  // here p1,p2,p3 must be orthogonal to each other!!!
  Transform frame = new Transform(p1,p2,p3,scale);
  result.apply(frame);
  
  Anar.camTarget(result);
}


void draw(){
  background(230);
  value.set(1+sin(frameCount/10f));
  result.draw();
}

void keyPressed(){
  if(key==' ')
    initForm();
}



