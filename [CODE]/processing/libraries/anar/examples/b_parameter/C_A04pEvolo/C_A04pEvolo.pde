import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


Obj tower = new Obj();


void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  Anar.drawAxis();
  initForm();
}

void initForm(){

  // /////////////////////////////////////////////////////
  Param outLength = new Param(50,15,100).tag("out").addToSlidersMain();
  Param inLength = new Param(25,5,100).tag("in").addToSlidersMain();
  Param numSides = new Param(5);

  Face floorPlan = new Star(outLength,inLength,numSides);
  tower.add(floorPlan);

  // /////////////////////////////////////////////////////
  Pt center = floorPlan.center();
  tower.add(center);

  // CREATE ALL BARY
  // for (int k = 0; k<10; k++){
  //
  // Pts sub = new Pts();
  // for (int i = 0; i<floorPlan.numOfPts(); i++){
  //
  // float[] w = new float[floorPlan.numOfPts()];
  //
  // for (int j = 0; j<w.length; j++)
  // if(j==i)
  // w[j] = k*4+2;
  // else
  // w[j] = 1;
  //
  // sub.add(new PtBary(floorPlan,w));
  // }
  //
  // tower.add(sub);
  //
  // }


  // /////////////////////////////////////////////////////
  // INSIDE CORE
  Pts insideCore = new Pts();
  for (int i = 0; i<floorPlan.numOfPts(); i++){
    float[] w = new float[floorPlan.numOfPts()];
    for (int j = 0; j<w.length; j++)
      if(j==i)
        w[j] = 10;
      else
        w[j] = 1;

    insideCore.add(new PtBary(floorPlan,w).normalizeWeight());
  }
  insideCore.add(Anar.Pt(insideCore.pt(0)));
  tower.add(insideCore);


  // /////////////////////////////////////////////////////
  // INSIDE CORE
  Pts outsideCore = new Pts();
  for (int i = 0; i<floorPlan.numOfPts(); i++){
    float[] w = new float[floorPlan.numOfPts()];
    for (int j = 0; j<w.length; j++)
      if(j==i)
        w[j] = 40;
      else
        w[j] = 1;
    outsideCore.add(new PtBary(floorPlan,w).normalizeWeight());
  }
  tower.add(outsideCore);
  outsideCore.add(Anar.Pt(outsideCore.pt(0)));
  println("Length of Outside Radius: "+outsideCore.length());
  // println("Length of Outside Radius: "+new Face(outsideCore).length());


  // /////////////////////////////////////////////////////
  // HALLS
  Obj halls = new Obj();
  for (int i = 0; i<outsideCore.numOfPts(); i++)
    halls.add(new Pts(insideCore.pt(i),outsideCore.pt(i)));
  tower.add(halls);


  // //////////////////////////////////////////////////////
  // //////////////////////////////////////////////////////
  // SLOPE
  Pts slope = new Pts(insideCore);
  for (int i = 1; i<slope.numOfPts()+1; i++){

    Param l = new ParamLength(insideCore.pt(i-1),insideCore.pt(i%slope.numOfPts()));
    Param d = new ParamMul(l,0.02f*i);

    TranslateZ tz = new TranslateZ(d);

    slope.pt(i%slope.numOfPts()).apply(tz);
  }
  tower.add(slope);


  // //////////////////////////////////////////////////////
  // CALCULATE DISTANCE
  Pts d = new Pts(slope.pt(0),slope.ptEnd());
  println("Length of FloorHeight: "+d.length());
  println("Length of Slope Radius: "+slope.length());
  println(d.pt(0));
  println(d.ptEnd(1));

  Param floorHeight = new ParamLength(slope.pt(0),slope.ptEnd());


  // //////////////////////////////////////////////////////
  // COPY
  for (int i = 0; i<20; i++){
    Pts slopeTmp = new Pts(slope);
    slopeTmp.apply(new TranslateZ(floorHeight));
    slopeTmp.stroke(i* (255/20));
    tower.add(slopeTmp);
    slope = slopeTmp;
  }


  // //////////////////////////////////////////////////////
  // //////////////////////////////////////////////////////
  // SLOPE OUT
  Pts slopeOut = new Pts(outsideCore);
  for (int i = 1; i<slopeOut.numOfPts()+1; i++){

    Param l = new ParamLength(insideCore.pt(i-1),insideCore.pt(i%slopeOut.numOfPts()));
    Param dd = new ParamMul(l,0.02f*i);

    TranslateZ tz = new TranslateZ(dd);

    slopeOut.pt(i%slopeOut.numOfPts()).apply(tz);
  }
  tower.add(slopeOut);


  // //////////////////////////////////////////////////////
  // CALCULATE DISTANCE
  d = new Pts(slopeOut.pt(0),slopeOut.ptEnd());
  println("Length of FloorHeight: "+d.length());
  println("Length of Slope Radius: "+slopeOut.length());
  println(d.pt(0));
  println(d.ptEnd(1));

  floorHeight = new ParamLength(slopeOut.pt(0),slopeOut.ptEnd());


  // //////////////////////////////////////////////////////
  // COPY
  for (int i = 0; i<20; i++){
    Pts slopeTmp = new Pts(slopeOut);
    slopeTmp.apply(new TranslateZ(floorHeight));
    slopeTmp.stroke(i* (255/20));
    tower.add(slopeTmp);
    slopeOut = slopeTmp;
  }


  Anar.camTarget(tower);
  // Anar.switchToMidiSliders();
}


void draw(){
  background(155);
  tower.draw();
}


void keyPressed(){
  if(key==' ')
    RhinoScript.export(tower,"curveTest");
}


