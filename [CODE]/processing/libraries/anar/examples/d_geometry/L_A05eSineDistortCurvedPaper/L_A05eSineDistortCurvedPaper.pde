import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


Obj myObj = new Obj();
Obj debugObj = new Obj();

Pt origin = Anar.Pt(0,0,0).tag("origin");

void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  Anar.drawAxis();
  myObj = createModule();
}

Obj createModule(){
  // Initialize a local object
  Obj module = new Obj();

  Param c = new Param(.5f,.25f,5).addToSlidersMain();
  Param d = new Param(0,0,5).addToSlidersMain();
//    Param div1 = new Param(10,1,60);
//    Param div2 = new Param(10,1,60);
//    Param mult1 = new Param(12,0,20);
//    Param mult2 = new Param(50,0,50);
  Param div1 = new Param(10,1,60).addToSlidersMain();
  Param mult1 = new Param(12,0,20).addToSlidersMain();
  Param z = new Param(0);
  Param one = new Param(1);
  
  // /////////////////////////////
  Transform t = new Transform();
  t.translateX(c);
  
  // /////////////////////////////
  // First construction: a helix
  Pts helix = new Pts();
  Pt previous = origin;

  for (int i = 0; i<200; i++){
    Pt xPt = Anar.Pt(previous);
    xPt.apply(t);
    Param x = new ParamX(xPt);
    Pt newPt = Anar.Pt(x,z,z);
    newPt.translateZ(x.div(div1).cos().multiply(mult1));
          
    helix.add(newPt);
    previous = newPt;
    module.add(newPt);
  }

  

  
  module.add(helix);
  
  module.add(curvedPaper( helix));
  
  Anar.camTarget(helix);

  return module;
}


Obj curvedPaper( Pts ptsA) {

  // /////////////////////////////
  // this is the curved paper construction

  Param size = new Param(10,0,50).addToSlidersMain();

  Param z = new Param(0);
  Param one = new Param(1);
  Param mOne = new Param(-1);
  
  Pt origin = Anar.Pt(0,0,0).tag("origin");;
  
  Pts ptsB;
  Pts ptsC;
  
  ptsB = new Pts();
  ptsC = new Pts();
  
  Pt preDarboux = Anar.Pt(0,0);
  Param invDarboux =  new Param(1);
  
  // line on x axis representing distance between points on curve ptsA
  Pts flat = new Pts();

  flat.add(origin);
  
  // borders of paper leaf
  Pt leftOrigin =Anar.Pt(z,size,z);
  Pt rightOrigin =Anar.Pt(z,size.inv(),z);

  Pt leftDir =Anar.Pt(one,size,z);
  Pt rightDir =Anar.Pt(one,size.inv(),z);

  for (int i = 1; i<ptsA.numOfPts()-2; i++){
      Pt p0 = ptsA.pt(i-1);
      Pt p1 = ptsA.pt(i);
      Pt p2 = ptsA.pt(i+1);
      Pt p3 = ptsA.pt(i+2);

      PtDarboux omega = new PtDarboux(p0,p1,p2,p3,1);

      // find torsion sign : omega_B colinear with T multiplied by torsion
      Param sign = new ParamDot(omega.getOmegaB(),omega.getA().getT0()).sign();
      
      
      // compute angle between omega and ptsA
//        Param angle = new ParamAngle(omega,p1,p2).mul(sign);
      Param angle = new ParamIf(sign, z, new Param(PI/2), new ParamAngle(omega,p1,p2).mul(sign)).isEQUAL();
              
      // report angle on flat paper (keeping the right torsion side of omega)
      // translate to the right point
      flat.add(Anar.Pt(flat.ptEnd().translateX(new ParamLength(p0,p1))));
      Pt dir =  Anar.Pt(1,0,0).rotateZ(angle).translate(flat.ptEnd());        
      
      // intersect with borders at distance size on both sides of geodesic ptsA
      PtIntersect inter1 = new PtIntersect(flat.ptEnd(),dir,leftOrigin,leftDir);
      PtIntersect inter2 = new PtIntersect(flat.ptEnd(),dir,rightOrigin,rightDir);
           
      
      debugObj.add(new Pts(inter1,inter2));
      
      // get parameter for 2 intersections 
      Param l0 = inter1.getLambda();
      Param l1 = inter2.getLambda();
      
      // detect darboux inversion and  counter act
      Pt darboux = omega.getDarboux0();
      if (i==0) {
        preDarboux = darboux;
      }
      Param inv =  new ParamIf(new ParamDot(darboux,preDarboux), z, mOne, one).isLESS();
      preDarboux = darboux;

      invDarboux =  invDarboux.mul(inv);

      // use distances to generate border points
      // invDarboux records of darboux inversion
      ptsB.add(Anar.Pt(darboux).scale(l0.multiply(invDarboux)).translate(p1));
      ptsC.add(Anar.Pt(darboux).scale(l1.multiply(invDarboux)).translate(p1));
  }
  
  // now create a sweep between two borders of the curved paper 
  // from the sequence of points on the curve
  return new SweepTwoPaths(ptsC,ptsB);    
}


void draw(){
  background(155);
  myObj.draw();
  debugObj.draw();
}


void keyPressed(){

  if(key==' ')
    RhinoScript.export(myObj,"curveTest");
}


