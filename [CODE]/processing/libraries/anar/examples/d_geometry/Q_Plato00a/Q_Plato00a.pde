import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */





void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  Anar.drawAxis();
  tetrahedron();
  octahedron();
  cube();
  dodecahedron();
}


void tetrahedron(){
  Anar.mainReset();
  Anar.slidersReset();
  
  Obj plato = new Obj();
  
  Param h0 = new Param(100);
  Param h2 = h0.divide(2);
  Param h3 = h0.divide(3);
  Param h6 = h3.divide(2);
  Param s1 = h2.square().minus(h6.square()).sqrt(); 
  Param third = new Param(2*PI/3);
  
  Pt origin = new PtABS();
  Pt N = origin.copy().translateZ(h3.multiply(2));
  //Pt S = N.copy().translateZ(h0.inv());
  Pt P0 = origin.copy().translateX(s1);
  Pt P1 = P0.copy().rotateZ(third);
  Pt P2 = P1.copy().rotateZ(third);
  
  plato.add(new Face(P0,N,P1));
  plato.add(new Face(P1,N,P2));
  plato.add(new Face(P2,N,P0));
  plato.add(new Face(P0,P1,P2));
  
  Anar.add(plato);
  Anar.sliders(h0);
 }


void octahedron(){
  Anar.mainReset();
  Anar.slidersReset();
  
  Obj plato = new Obj();
  
  Param h0 = new Param(100);
  Param h2 = h0.divide(2);
  Param angle = new Param(PI/2);
  
  Pt origin = new PtABS();
  Pt N = origin.copy().translateZ(h2);
  Pt S = origin.copy().translateZ(h2.inv());
  Pt P0 = origin.copy().translateX(h2);
  Pt P1 = P0.copy().rotateZ(angle);
  Pt P2 = P1.copy().rotateZ(angle);
  Pt P3 = P2.copy().rotateZ(angle);
  
  plato.add(new Face(P0,N,P1));
  plato.add(new Face(P1,N,P2));
  plato.add(new Face(P2,N,P3));
  plato.add(new Face(P3,N,P0));
  
  plato.add(new Face(P0,S,P1));
  plato.add(new Face(P1,S,P2));
  plato.add(new Face(P2,S,P3));
  plato.add(new Face(P3,S,P0));    

  Anar.add(plato);
  Anar.sliders(h0);
 }

void cube(){
  Anar.mainReset();
  Anar.slidersReset();
  
  Param h0 = new Param(100);
  Obj plato = new Box(h0); //Easy no? 

  Anar.add(plato);
  Anar.sliders(h0);
 }  

void dodecahedron(){
  Anar.mainReset();
  Anar.slidersReset();
  
  Param h0 = new Param(100);
  Obj cube = new Box(h0); //Easy no? 
  Obj plato = new Obj(); //Easy no? 
  
  cube.face(0).fill(255,0,0).indexOffset(1);
  cube.face(2).fill(0,255,0).indexOffset(1);
  
  Param goldenRatio = new Param((float)(1+Math.sqrt(40))/2,-10,10).addToSlidersMain();
  
  Param roof = null;
  Param rooL = null;
      
  for(int i=0; i<cube.numOfFaces(); i++)
  {
    Face f = cube.face(i);
    Pt A = f.pt(0);
    Pt B = f.pt(1);
    Pt C = f.pt(2);
    Pt D = f.pt(3);
    
    Pt E = new PtMid(A,B);
    Pt F = new PtMid(C,D);
    Pt G = new PtMid(E,F);
    
    Pt H = new PtCurve(new Pts(G,E),goldenRatio.invert());
    Pt I = new PtCurve(new Pts(G,F),goldenRatio.invert());
    
    if(roof==null)
    {
      roof = new ParamLength(H,G);
      rooL = new ParamLength(E,H);
    }
    
    Pt K = new PtNormal(B,H,A,rooL);
    Pt L = new PtNormal(C,I,A,rooL);
    //println(new Pts(H,K).length());
    
    cube.add(new Pts(E,H));
    cube.add(new Pts(F,I));
    cube.add(new Pts(H,K));
    cube.add(new Pts(I,L));
    
    plato.add(new Face(A,B,K));
    plato.add(new Face(C,D,L));
    plato.add(new Face(B,C,L,K));
    plato.add(new Face(A,D,L,K));
  }
  
  Obj wellFormed = new Obj();
  
  for(int i=0; i<plato.numOfFaces(); i++)
    for(int j=i; j<plato.numOfFaces(); j++)
      if(plato.face(i)!=plato.face(j))
        if(plato.face(i).pt(0)==plato.face(j).pt(0) || plato.face(i).pt(0)==plato.face(j).pt(1))
          if(plato.face(i).pt(1)==plato.face(j).pt(0) || plato.face(i).pt(1)==plato.face(j).pt(1))
          {
            //MERGE TWO FACES
            Face trig,quad;
            
            if(plato.face(i).numOfPts()==3)
            {
              trig =  plato.face(i);
              quad =  plato.face(j);
            }else
            {
              trig =  plato.face(j);
              quad =  plato.face(i);   
            }
            
            AColor c = new AColor(Anar.rndi(255),Anar.rndi(255),Anar.rndi(255));
            trig.fill(c).reverse();
            quad.fill(c);
            
//              println(trig.numOfPts()+"|"+quad.numOfPts());
            
//              Face pentagon = new Face();
//              pentagon.add(trig.pt(0));
//              pentagon.add(trig.pt(2));
//              pentagon.add(trig.pt(1));
//              pentagon.add(quad.pt(2));
//              pentagon.add(quad.pt(3));
//              
//              wellFormed.add(pentagon);
          }
  
  //Anar.add(cube);
//    Anar.add(wellFormed);
  Anar.add(plato);
  Anar.add(plato.copy().translateX(100));
  Anar.add(plato.copy().rotateZ(new Param(10).addToSlidersMain()).translateX(50).translateZ(50));
  Anar.sliders(h0);
 }    



void draw(){
  background(255);
  Anar.draw();
  Anar.camTarget();
  //tetrahedron();s
}


void keyPressed(){
  dodecahedron();
}


