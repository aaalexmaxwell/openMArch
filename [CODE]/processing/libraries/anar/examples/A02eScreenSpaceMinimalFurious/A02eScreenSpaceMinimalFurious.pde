import processing.opengl.*;
import anar.*;



import java.util.Iterator;




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

  Face.globalRender = new QuakeNoise(10);
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


  float cf;

  Quake(float cf){
    this.cf = cf;
  }

  void draw(Pts pts){
    beginShape();

    Iterator j = pts.iterator();
    while (j.hasNext()){
      Pt pt = (Pt)j.next();
      vertex((float)pt.x()+rnd(),(float)pt.y()+rnd(),(float)pt.z()+rnd());
    }

    endShape(2);// CLOSE
  }

  float rnd(){
    return (float) ((float)Math.random()*cf*2-cf);
  }

}

int count;
int lastFrame = 0;


  float cf;


  QuakeNoise(float cf){
    this.cf = cf;
  }

  void draw(Pts pts){
    if(lastFrame!=frameCount){
      count = lastFrame;
      lastFrame = frameCount;
    }

    beginShape();

    Iterator j = pts.iterator();
    while (j.hasNext()){
      Pt pt = (Pt)j.next();
      vertex((float)pt.x()+rnd(),(float)pt.y()+rnd(),(float)pt.z()+rnd());
    }

    endShape(2);// CLOSE
  }

  float rnd(){
    return (float) (noise(count++/100f)*cf*2-cf);
  }

}



