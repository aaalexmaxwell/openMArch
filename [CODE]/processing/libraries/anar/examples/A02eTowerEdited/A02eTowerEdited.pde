import processing.opengl.*;
import anar.*;






/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */




Face f;

Obj  myObj = new Obj();


void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  initForm();

  Pts.globalRender = new RenderPtsLine();
  Anar.drawAxis(true);
}


void initForm(){

  f = new Star(100,50,6);

  Transform t = new Transform();
  t.translate(0,0,5);
  t.scale(0.98f,0.95f,1);
  t.rotateZ(.1f);

  for (int i = 0; i<50; i++){
    Face tmpFace = new Face(f,t);
    myObj.add(tmpFace);
    f = tmpFace;
  }


  Anar.camTarget(myObj);

}


void draw(){
  background(200);

  myObj.draw();


}


Translate mv = new Translate(1,2,3);

void keyPressed(){

  Face g = (Face) myObj.faces.get(Anar.rndi(myObj.faces.size()));
  g.apply(mv);
}



