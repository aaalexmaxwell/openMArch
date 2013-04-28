import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


Obj myObj = new Obj();

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

  Param c = new Param(1,0,20).addToSlidersMain();
  Param z = new Param(0);
  Param one = new Param(1);
  
  // /////////////////////////////
  Transform t = new Transform();
  Param angleHelix = new Param(PI/14f,0,PI/4).addToSlidersMain();
  t.rotateZ(angleHelix);
  t.translate(Anar.Pt(c,z,c));
  t.scale(1.02f,1f,.99f);
  
  // /////////////////////////////
  // First construction: a helix
  Pts helix = new Pts();
  Pt previous = origin;

  for (int i = 0; i<200; i++){
    Pt newPt = Anar.Pt(previous);
    newPt.apply(t);
    helix.add(newPt);
    previous = newPt;
  }
          
  module.add(helix);

  // Create set of Points from an uniform distribution of points
  Pts helixRedim = helix.discretization(200);
  
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
}


void keyPressed(){

  if(key==' ')
    RhinoScript.export(myObj,"curveTest");
}


