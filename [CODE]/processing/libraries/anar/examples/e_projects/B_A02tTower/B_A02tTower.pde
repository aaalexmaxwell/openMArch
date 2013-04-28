import processing.opengl.*;
import anar.*;






/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  Anar.debugTimeIn();
  initForm();
  Anar.debugTimeOut();
  Anar.drawAxis(true);
  Scene.gradientBackground = true;
}


void initForm(){

  Face star = new Face();
  int numberOfSides = 5;
  
  Param w1 = new Param(50,0,100).addToSlidersMain();
  Param w2 = new Param(50,0,100).addToSlidersMain();
  Transform rz = new RotateZ(PI/numberOfSides);
  
  Pt a = Pt.create(0,0,0).translateX(w1);
  Pt b = a.copy().translateX(w2).apply(rz);    
  
  for(int i=0; i<5; i++)
  {
    a = a.copy().apply(rz).apply(rz);
    b = b.copy().apply(rz).apply(rz);
    star.add(a,b);
  }
  
  Param height = new Param(5,0,30);
  
  Param d = new Param(100,80,110).tag("%").addToSlidersMain();
  Param sx = new Param(95,90,110).addToSlidersMain().div(d);
  Param sy = new Param(94,90,110).addToSlidersMain().div(d);
  Param sz = new Param(104,90,110).addToSlidersMain().div(d);
  Param r2 = new Param(6,-20,20).addToSlidersMain().div(d);

  Transform complex = new Transform();
  complex.translateZ(height);
  complex.scale(sx,sy,sz);
  complex.rotateZ(r2);
  
  for(int i=0; i<24; i++){
    Face floor = star.copy().apply(complex);
    Anar.add(floor);
    star = floor;
  }
  
  
  //////////////////////////////
  //Structure

  Obj pointsOnFloors = new Obj();
  Obj towerCore = Anar.main.obj(0);
  
  for (int i = 0; i<Anar.main.obj(0).numOfFaces(); i++)
    pointsOnFloors.add(floorPoints(towerCore.face(i),3.5f,0.2f,2.3f,0.15f));

  for (int i = 0; i<pointsOnFloors.numOfLines()-1; i++){
    Pts q = pointsOnFloors.line(i);
    Pts r = pointsOnFloors.line(i+1);
    for (int j = 0; j<q.size(); j += 4){
      Face p;

      for (int k = 0; k<4; k++){
        int n = j+k;
        int m = j+(k+1)%4;
        p = new Face();
        p.add(q.pt(n));
        p.add(r.pt(n));
        p.add(r.pt(m));
        p.add(q.pt(m));
        Anar.add(p);
      }
    }
  }

   Anar.slidersReset();
   Anar.sliders(Anar.main);
}




Pts floorPoints(Face shape,float cf1, float cf2,float cf3, float cf4){
  Pts structurePts = new Pts();
  for (int j = 0; j<shape.numOfPts(); j++){
    structurePts.add(getBary(shape,j,+1,cf1,cf2));
    structurePts.add(getBary(shape,j,-1,cf1,cf2));
    structurePts.add(getBary(shape,j,-1,cf3,cf4));
    structurePts.add(getBary(shape,j,+1,cf3,cf4));
  }
  return structurePts;
}





Pt getBary(Face shape, int j, int jj, float cf1, float cf2){
  float[] w = new float[shape.numOfPts()];
  w[j] = cf1;
  w[(j+jj+shape.numOfPts())%shape.numOfPts()] = cf2;
  
  return new PtBary(shape,w).normalizeWeight();
}






void draw(){
  background(200);
  Anar.camTarget(Anar.main);
  Anar.draw();
}



