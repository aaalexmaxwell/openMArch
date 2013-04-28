import processing.opengl.*;
import anar.*;


import java.util.ArrayList;



/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


Anar      goo;

// Sliders parameters;

Pt        a, b, c, d;

Obj       obj;
Sliders   mySlider;

Param     z, zMin;
Param     div;
Param     zero;

Translate t, tMin;

int       nIteration = 0;

void setup(){
    size(800,400,OPENGL);
  Anar.init(this);

  Scene.autoSeek = false;

  initForm();
}

void initForm(){
  div = new Param(3,2,10);

  t = new Translate(Anar.Pt(0,0,2));
  tMin = new Translate(Anar.Pt(0,0, -2));

  a = Anar.Pt( -60, -60);
  b = Anar.Pt(60, -60);
  c = Anar.Pt(60,60);
  d = Anar.Pt( -60,60);

  reset();
}

void reset(){
  obj = new Obj();

  Face f = new Face();
  f.add(a);
  f.add(b);
  f.add(c);
  f.add(d);
  obj.add(f);

  nIteration = 0;
  addFourth = false;

  mySlider = new Sliders(obj);
}


void weavingIteration(){

  nIteration++;
  println(nIteration);


  ArrayList newFaces = new ArrayList();


  for (int m = 0; m<obj.numOfFaces(); m++){
    Face f = obj.face(m);

    Pts pp = new Pts();
    Pts subdiv = new Pts();

    // layout of pp in quad
    // 3 6 7 2
    //       
    //       
    // 0 4 5 1

    // get the vertices of the triangle
    pp.add(f.pt(0));
    pp.add(f.pt(1));
    pp.add(f.pt(2));
    pp.add(f.pt(3));

    // get the middle points
    Pts AB = new PtsMid(pp.pt(0),pp.pt(1),div);
    Pts BC = new PtsMid(pp.pt(1),pp.pt(2),div);
    Pts CD = new PtsMid(pp.pt(2),pp.pt(3),div);
    Pts DA = new PtsMid(pp.pt(3),pp.pt(0),div);

    pp.add(Anar.Pt(AB.pt(1)));
    pp.add(Anar.Pt(AB.pt(2)));

    pp.add(Anar.Pt(CD.pt(2)));
    pp.add(Anar.Pt(CD.pt(1)));

    // interior points
    Pts AB1CD2 = new PtsMid(pp.pt(4),pp.pt(6),div);
    Pts AB2CD1 = new PtsMid(pp.pt(5),pp.pt(7),div);

    // layout of the quad subdivision in subdiv
    // up down
    // 0 1 2 3
    // 4 5 6 7 16 17 18 19
    // 8 9 10 11 20 21 22 23
    // 12 13 14 15

    // 1st horizontal
    // 3 6 7 2
    subdiv.add(pp.pt(3));
    subdiv.add(pp.pt(6));
    subdiv.add(pp.pt(7));
    subdiv.add(pp.pt(2));

    // 2nd horizontal
    subdiv.add(Anar.Pt(DA.pt(1)));

    subdiv.add(Anar.Pt(AB1CD2.pt(2)));
    subdiv.add(Anar.Pt(AB2CD1.pt(2)));

    subdiv.add(Anar.Pt(BC.pt(2)));

    // 3rd horizontal
    subdiv.add(Anar.Pt(DA.pt(2)));

    subdiv.add(Anar.Pt(AB1CD2.pt(1)));
    subdiv.add(Anar.Pt(AB2CD1.pt(1)));

    subdiv.add(Anar.Pt(BC.pt(1)));


    // 4th horizontal
    // 0 4 5 1
    subdiv.add(pp.pt(0));
    subdiv.add(pp.pt(4));
    subdiv.add(pp.pt(5));
    subdiv.add(pp.pt(1));


    // duplicate points
    // 2nd horizontal
    subdiv.add(Anar.Pt(DA.pt(1)));

    subdiv.add(Anar.Pt(AB1CD2.pt(2)));
    subdiv.add(Anar.Pt(AB2CD1.pt(2)));

    subdiv.add(Anar.Pt(BC.pt(2)));

    // 3rd horizontal
    subdiv.add(Anar.Pt(DA.pt(2)));

    subdiv.add(Anar.Pt(AB1CD2.pt(1)));
    subdiv.add(Anar.Pt(AB2CD1.pt(1)));

    subdiv.add(Anar.Pt(BC.pt(1)));


    // translate up
    for (int i = 4; i<12; i++){
      Pt p = subdiv.pt(i);
      p.apply(t);
    }

    // translate down
    for (int i = 16; i<24; i++){
      Pt p = subdiv.pt(i);
      p.apply(tMin);
    }


    // Face newFace = new Face();

    // add first batch (regular ones)
    int[] angle = {0, 2, 5, 8, 10, 16, 18};
    // int[] angle = {0, 2, 5, 8, 10};

    Face newFace = new Face();

    for (int i = 0; i<angle.length; i++){
      newFace = new Face();
      newFace.add(subdiv.pt(angle[i]+4));
      newFace.add(subdiv.pt(angle[i]+5));
      newFace.add(subdiv.pt(angle[i]+1));
      newFace.add(subdiv.pt(angle[i]));
      newFaces.add(newFace);
    }

    // add second batch (irregular ones)
    newFace = new Face();
    newFace.add(subdiv.pt(17));
    newFace.add(subdiv.pt(18));
    newFace.add(subdiv.pt(2));
    newFace.add(subdiv.pt(1));
    newFaces.add(newFace);

    newFace = new Face();
    newFace.add(subdiv.pt(13));
    newFace.add(subdiv.pt(14));
    newFace.add(subdiv.pt(22));
    newFace.add(subdiv.pt(21));
    newFaces.add(newFace);

  }

  obj = new Obj();
  obj.addAllFaces(newFaces);

  Anar.camTarget(obj);
  mySlider = new Sliders(obj);
}


void draw(){
  background(153);

  // ParametricValue v = parameters.get(0);
  // v.set(v.get()+ random(10)-5);

  obj.draw();
  mySlider.draw();
}



boolean addFourth = false;
boolean positive  = false;

void keyPressed(){

  switch(key){
    case 'q':
      weavingIteration();
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
      anar.tools.TextIO.write( ((Object)this).getClass().getName()+".lsp",obj.toAutocad());
    break;


  }


}

