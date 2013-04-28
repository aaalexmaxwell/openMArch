import processing.opengl.*;
import anar.*;


import java.util.ArrayList;



/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


Sliders parameters;

Pt      a, b, c, d;

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
  facePts.add(d);
  Face f = new Face(facePts);

  obj.add(f);

  nIteration = 0;

  addFourth = false;
}

void initForm(){

  a = Anar.Pt( -60, -60);
  b = Anar.Pt(60, -60);
  c = Anar.Pt(60,60);
  d = Anar.Pt( -60,60);

  Pts facePts = new Pts();
  facePts.add(a);
  facePts.add(b);
  facePts.add(c);
  facePts.add(d);
  Face f = new Face(facePts);

  obj.add(f);

  parameters = new Sliders(a);
  // println(parameters);

}

void weavingIteration(){
  nIteration++;
  println(nIteration);

  float z = 2f;

  ArrayList newFaces = new ArrayList();

  for (int k = 0; k<obj.numOfFaces(); k++){
    Face f = obj.face(k);

    if(f.numOfPts()==4){

      // float param;
      // if (positive) param = z / (nIteration * nIteration) ;
      // else param = - z / (nIteration * nIteration) ;

      float param = z;

      Pts pp = new Pts();
      Pts subdiv = new Pts();

      // layout of pp in quad
      // 3 6 7 2


      // 0 4 5 1

      // get the vertices of the triangle
      pp.add(f.pt(0));
      pp.add(f.pt(1));
      pp.add(f.pt(2));
      pp.add(f.pt(3));

      // get the middle points
      Pts AB = new PtsMid(pp.pt(0),pp.pt(1),3);
      Pts BC = new PtsMid(pp.pt(1),pp.pt(2),3);
      Pts CD = new PtsMid(pp.pt(2),pp.pt(3),3);
      Pts DA = new PtsMid(pp.pt(3),pp.pt(0),3);

      pp.add(Anar.Pt(AB.pt(1)));
      pp.add(Anar.Pt(AB.pt(2)));

      pp.add(Anar.Pt(CD.pt(2)));
      pp.add(Anar.Pt(CD.pt(1)));

      // interior points
      Pts AB1CD2 = new PtsMid(pp.pt(4),pp.pt(6),3);
      Pts AB2CD1 = new PtsMid(pp.pt(5),pp.pt(7),3);

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


      // up
      for (int i = 4; i<12; i++){
        Pt p = subdiv.pt(i);
        p.translate(0f,0f,param);
      }

      // down
      for (int i = 16; i<24; i++){
        Pt p = subdiv.pt(i);
        p.translate(0f,0f, -param/2);
      }

      // add first batch (regular ones)
      int[] angle = {0, 2, 5, 8, 10, 16, 18};
      // int[] angle = {0, 2, 5, 8, 10};
      for (int i = 0; i<angle.length; i++){
        Pts fps = new Pts();
        fps.add(subdiv.pt(angle[i]+4));
        fps.add(subdiv.pt(angle[i]+5));
        fps.add(subdiv.pt(angle[i]+1));
        fps.add(subdiv.pt(angle[i]));
        newFaces.add(new Face(fps));
      }

      // add second batch (irregular ones)
      Pts fps = new Pts();
      fps.add(subdiv.pt(17));
      fps.add(subdiv.pt(18));
      fps.add(subdiv.pt(2));
      fps.add(subdiv.pt(1));
      newFaces.add(new Face(fps));

      fps = new Pts();
      fps.add(subdiv.pt(13));
      fps.add(subdiv.pt(14));
      fps.add(subdiv.pt(22));
      fps.add(subdiv.pt(21));
      newFaces.add(new Face(fps));
    }
    else{
      newFaces.add(f);
    }

  }

  obj = new Obj();

  for (int i = 0; i<newFaces.size(); i++)
    obj.add((Face)newFaces.get(i));

  Anar.camTarget(obj);


}

void squareIteration(){

  nIteration++;
  println(nIteration);

  float z = 10f;
  int n = 10;

  ArrayList newFaces = new ArrayList();

  for (int k = 0; k<obj.numOfFaces(); k++){
    Face f = obj.face(k);

    if(f.numOfPts()==4){
      // float param;
      // if (positive) param = z / (nIteration * nIteration) ;
      // else param = - z / (nIteration * nIteration) ;

      float param = z;

      Pts pp = new Pts();
      Pts subdiv = new Pts();

      // layout of the quad subdivision in pp
      // 3 2
      // 0 1
      // get the vertices of the triangle
      pp.add(f.pt(0));
      pp.add(f.pt(1));
      pp.add(f.pt(2));
      pp.add(f.pt(3));

      // get the middle points
      Pts AB = new PtsMid(pp.pt(0),pp.pt(1),n);
      Pts BC = new PtsMid(pp.pt(1),pp.pt(2),n);
      Pts CD = new PtsMid(pp.pt(2),pp.pt(3),n);
      Pts DA = new PtsMid(pp.pt(3),pp.pt(0),n);

      // layout of the quad subdivision in subdiv
      // up down
      // 6 5 4 10
      // 7 3 11 9
      // 0 1 2 8

      // 1st horizontal
      subdiv.add(pp.pt(0));
      subdiv.add(Anar.Pt(AB.pt(1)));
      subdiv.add(pp.pt(1));
      subdiv.add(Anar.Pt(BC.pt(1)));
      subdiv.add(pp.pt(2));
      subdiv.add(Anar.Pt(CD.pt(1)));
      subdiv.add(pp.pt(3));
      subdiv.add(Anar.Pt(DA.pt(1)));

      // duplicate points
      subdiv.add(Anar.Pt(AB.pt(1)));
      subdiv.add(Anar.Pt(BC.pt(1)));
      subdiv.add(Anar.Pt(CD.pt(1)));
      subdiv.add(Anar.Pt(DA.pt(1)));

      // up
      for (int i = 1; i<8; i = i+2){
        Pt p = subdiv.pt(i);
        p.translate(0f,0f,param);
      }

      // down
      for (int i = 8; i<12; i++){
        Pt p = subdiv.pt(i);
        p.translate(0f,0f, -param);
      }

      Pts fps;

      // add first batch (triangle ones)
      for (int i = 0; i<7; i = i+2){
        fps = new Pts();
        fps.add(subdiv.pt(i));
        fps.add(subdiv.pt(i+1));
        fps.add(subdiv.pt( (i+7)%8));
        newFaces.add(new Face(fps));
      }

      fps = new Pts();
      fps.add(subdiv.pt(1));
      fps.add(subdiv.pt(3));
      fps.add(subdiv.pt(5));
      fps.add(subdiv.pt(7));
      newFaces.add(new Face(fps));


      if(downAlso){
        // add second batch (triangle ones)
        for (int i = 0; i<4; i++){
          fps = new Pts();
          fps.add(subdiv.pt(2*i));
          fps.add(subdiv.pt(i+8));
          fps.add(subdiv.pt( (i+3)%4+8));
          newFaces.add(new Face(fps));
        }

        fps = new Pts();
        fps.add(subdiv.pt(8));
        fps.add(subdiv.pt(9));
        fps.add(subdiv.pt(10));
        fps.add(subdiv.pt(11));
        newFaces.add(new Face(fps));
      }


    }
    else{
      newFaces.add(f);
    }

  }


  obj.faces.clear();
  obj.faces = newFaces;

}


void draw(){
  background(153);

  // ParametricValue v = parameters.get(0);
  // v.set(v.get()+ random(10)-5);

  obj.draw();
}



boolean addFourth = false;
boolean positive  = false;
boolean downAlso  = false;

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
    break;
    case 't':
      squareIteration();
    break;
    case 'y':
      downAlso = !downAlso;
    break;


    case 'a':
      anar.tools.TextIO.write( ((Object)this).getClass().getName()+".lsp",obj.toAutocad());
    break;


  }


}

