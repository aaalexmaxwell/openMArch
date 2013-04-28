import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


Obj myObj = new Obj();


void setup(){
    size(800,400,OPENGL);
  frameRate(200);

  Anar.init(this);
  Anar.drawAxis(true);

  initForm();
}


void initForm(){


  // CREATE TWO CONTAINERS TO STORE THE POINTS
  // TWO LINES PARRALELS WITH POINTS
  Pts ptsA = new Pts();
  Pts ptsB = new Pts();


  // SET TWO TRANSFORMATIONS FOR REUSE
  Translate sideWidth = new Translate(0,30,0);
  Translate sideHeight = new Translate(10,0,0);


  // CREATE A FIRST POINT
  // ASECOND FOR THE NEXT LINE
  Pt oriA = Anar.Pt(10,20,30);
  Pt oriB = Anar.Pt(oriA,sideWidth);


  RotateZ r = new RotateZ(new Param(PI/16,-PI/4,PI/4));

  Transform mergedTransform = new Transform();

  mergedTransform.apply(sideHeight);
  mergedTransform.apply(r);


  ptsA.add(oriA);
  ptsB.add(oriB);


  // CREATE ALL POINTS FROM sideHeight at EACH STEPS
  for (int i = 0; i<18; i++){

    Transform orientedTranslationA = new Transform(oriA,oriB,mergedTransform);
    Pt tmpA = Anar.Pt(ptsA.ptEnd(),orientedTranslationA);


    Transform orientedTranslationB = new Transform(oriA,oriB,mergedTransform);
    Pt tmpB = Anar.Pt(ptsB.ptEnd(),orientedTranslationB);

    ptsA.add(tmpA);
    ptsB.add(tmpB);
  }


  // myObj.add(ptsA);
  // myObj.add(ptsB);


  // I HAVE THEN TWO PARRALLEL LINES
  // I'LL CREATE FACES FROM EACH PAIRS
  for (int i = 0; i<ptsA.numOfPts()-1; i++){

    // FIRST TRIANGLE ADJ
    Face triangleA = new Face();
    triangleA.add(ptsA.pt(i));
    triangleA.add(ptsA.pt(i+1));
    triangleA.add(ptsB.pt(i));

    myObj.add(triangleA);


    // FIRST TRIANGLE OPPOSITE
    Face triangleB = new Face();
    triangleB.add(ptsB.pt(i));
    triangleB.add(ptsB.pt(i+1));
    triangleB.add(ptsA.pt(i+1));

    myObj.add(triangleB);


  }


  myObj.fill(255,255,0);

  Anar.camTarget(myObj);
  Anar.sliders(myObj);
}


void draw(){
  background(155);

  myObj.draw();
}


