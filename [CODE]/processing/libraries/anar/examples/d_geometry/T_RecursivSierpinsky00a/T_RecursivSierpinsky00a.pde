import processing.opengl.*;
import anar.*;


import java.util.ArrayList;



/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


Sliders parameters;

Pt      a, b, c;

Obj     obj;

int     nIteration = 0;

void setup(){
    size(800,400,OPENGL);
  Anar.init(this);

  Scene.autoSeek = false;

  obj = new Obj();

  initForm();

  Pts.globalRender = new RenderPtsAll();

}


void reset(){
  obj.faces.clear();
  obj.pts.ptList.clear();

  Pts facePts = new Pts();
  facePts.add(a);
  facePts.add(b);
  facePts.add(c);
  Face f = new Face(facePts);

  obj.add(f);

  nIteration = 0;

  addFourth = false;
}

void initForm(){

  a = Anar.Pt( -60, -30);
  b = Anar.Pt(60, -30);
  c = Anar.Pt(0,60);

  Pts facePts = new Pts();
  facePts.add(a);
  facePts.add(b);
  facePts.add(c);
  Face f = new Face(facePts);

  obj.add(f);

  parameters = new Sliders(a);
  // println(parameters);

}


void sierpinskyIteration(){

  nIteration++;
  println(nIteration);

  float z = 10f;

  ArrayList newFaces = new ArrayList();

  for (int k = 0; k<obj.numOfFaces(); k++){
    Face f = obj.face(k);

    // get the vertices of the triangle
    Pt aa = f.pt(0);
    Pt bb = f.pt(1);
    Pt cc = f.pt(2);

    // use point of gravity of original point as anchor
    Pt pp = Anar.Pt(.33f*aa.x()+.33f*bb.x()+.33f*cc.x(),.33f*aa.y()+.33f*bb.y()+.33f*cc.y(),.33f*aa.z()+.33f*bb.z()+.33f*cc.z());

    // Pt pp = Anar.Pt( .2f*aa.x()+.3f*bb.x()+.5f*cc.x(),
    // .2f*aa.y()+.3f*bb.y()+.5f*cc.y(),
    // .2f*aa.z()+.3f*bb.z()+.5f*cc.z());

    // get the middle points
    Pts AB = new PtsMid(aa,bb,2);
    Pts BC = new PtsMid(bb,cc,2);
    Pts AC = new PtsMid(cc,aa,2);
    // Pts AB = new PtsMid(aa, bb, 4);
    // Pts BC = new PtsMid(bb, cc, 4);
    // Pts AC = new PtsMid(cc, aa, 4);

    float param;
    if(positive)
      param = z/ (nIteration*nIteration);
    else
      param = -z/ (nIteration*nIteration);

    Pt ab = Anar.Pt(AB.pt(1));
    ab.translate(0f,0f,param);

    Pt bc = Anar.Pt(BC.pt(1));
    bc.translate(0f,0f,param);

    Pt ac = Anar.Pt(AC.pt(1));
    ac.translate(0f,0f,param);

    // add first subdivision
    Pts f1Pts = new Pts();
    f1Pts.add(aa);
    f1Pts.add(ab);
    f1Pts.add(ac);
    Face f1 = new Face(f1Pts);

    // add second subdivision
    Pts f2Pts = new Pts();
    f2Pts.add(ab);
    f2Pts.add(bb);
    f2Pts.add(bc);
    Face f2 = new Face(f2Pts);

    // add third subdivision
    Pts f3Pts = new Pts();
    f3Pts.add(ac);
    f3Pts.add(bc);
    f3Pts.add(cc);
    Face f3 = new Face(f3Pts);

    if(addFourth){
      // add middle subdivisions

      Pts f4Pts = new Pts();
      f4Pts.add(ab);
      f4Pts.add(bc);
      f4Pts.add(pp);
      Face f4 = new Face(f4Pts);
      newFaces.add(f4);

      Pts f5Pts = new Pts();
      f5Pts.add(pp);
      f5Pts.add(bc);
      f5Pts.add(ac);
      Face f5 = new Face(f5Pts);
      newFaces.add(f5);

      Pts f6Pts = new Pts();
      f6Pts.add(ab);
      f6Pts.add(pp);
      f6Pts.add(ac);
      Face f6 = new Face(f6Pts);
      newFaces.add(f6);


    }
    newFaces.add(f1);
    newFaces.add(f2);
    newFaces.add(f3);


  }

  // track parent stuff.
  // Then, when you say clear for faces arrayList, everything stay in parent
  // arrayList
  // In fact faces should be private (and might be private soon)
  // I still need access to faces arraylist for debug (or to construct my
  // but you should use something like set() and get()
  obj.faces.clear(); // Doesn't affect anything (might be better for the
  // collector (I dont know?)


  // Here is the proposal:
  // Create a brand new object (old obj go in the garbage collector, with
  // parents in)
  obj = new Obj();

  // Theres no obj(Obj f) yet, you need to copy them manually.
  for (int i = 0; i<newFaces.size(); i++)
    obj.add((Face)newFaces.get(i));

  // obj.faces = newFaces;
  Anar.camTarget(obj);

}


void draw(){
  background(153);

  // ParametricValue v = parameters.get(0);
  // v.set(v.get()+ random(10)-5);

  obj.draw();
}



boolean addFourth = false;
boolean positive  = false;

void keyPressed(){

  switch(key){
    case 'q':
      sierpinskyIteration();
    break;
    case 'w':
      addFourth = !addFourth;
    break;
    case 'e':
      reset();
    break;
    case 'r':
      positive = !positive;
      ;
    break;

    case 'a':
      Autolisp.export(obj,this);
    break;


  }


}

