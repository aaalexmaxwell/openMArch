import processing.opengl.*;
import anar.*;




/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


Face f;

Obj  myObj        = new Obj();
Obj  contourLines = new Obj();
Obj  verticales   = new Obj();

void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  initForm();

  Pts.globalRender = new RenderPtsAll();
  Anar.drawAxis(true);
}

void initForm(){

  f = new Square(100);

  Transform t = new Transform();
  t.translate(0,0,10);
  t.scale(0.98f,0.95f,1);
  t.rotateZ(.1f);

  int numberOfNodes = 8;

  for (int i = 0; i<20; i++){

    Face tmpFace = new Face(f,t);
    myObj.add(tmpFace);

    f = tmpFace;

    Pts ptContour;
    Pts ptCollector = new Pts(); // Where I store all points

    for (int j = 0; j<f.numOfPts(); j++){
      int jj = (j+1)%f.numOfPts();

      ptContour = new PtsMid(f.pt(j),f.pt(jj),numberOfNodes);
      ptContour.remove(f.pt(jj));
      ptCollector.addPointsFrom(ptContour);
    }

    contourLines.add(ptCollector);
  }


  for (int j = 0; j<contourLines.line(0).numOfPts(); j++){
    Pts ptCollector = new Pts(); // Where I store all points

    for (int i = 0; i<contourLines.numOfLines(); i++){
      Pts a = (Pts)contourLines.line(i);
      // Pts b = (Pts) contourLines.parent(i + 1);
      ptCollector.add(a.pt(j));
    }

    verticales.add(ptCollector);
  }


  // Assign a render to contourLines
  contourLines.render = new RenderObjPts();
  verticales.render = new RenderObjPts();


  println(myObj.primitiveToString( -1));

}

void draw(){
  background(200);

  myObj.draw();
  // contourLines.draw();
  verticales.draw();
}


