import processing.opengl.*;
import anar.*;







Obj beam,truss;
Pts axis = new Pts(Anar.Pt(100,0,50),Anar.Pt(0,20,100),Anar.Pt(0,20,90)).color(255,0,0);

void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  Anar.drawAxis();
  
  Pts.globalRender = new RenderPtsAll();
  
  beam = hBeam(100,10,20,2,2).translateY(50);
  truss= truss(100,10,20,2,2).rotateX(0);
  truss.rotateZ(Param.PI.half()); 
  truss.rotateX(Param.PI);
  truss.rotateY(Param.PI.half()); 
  truss.place(axis.pt(0),axis.pt(2),axis.pt(1));
  
  println(beam.area()+"|"+beam.numOfFaces());
  Anar.sliders(beam,truss);
}  

Obj truss(float size, float width, float height, float widthDelta, float heightDelta){
  Param w = new Param(width,0,50).tag("W");
  Param h = new Param(height,0,50).tag("H");
  Param t = new Param(heightDelta,0,5).tag("T");
  Param u = new Param(widthDelta,0,5).tag("U");
  Param s = new Param(size,0,200).tag("s");
  
  Param w2 = w.half();
  Param h2 = h.half();
  Param u2 = u.half();
  
  Obj fourFaces = new Obj();
  
  Face f = new Rect(t,w2.minus(u2)).translateY(u2).rotateY(PI/2);
  f.translateZ(h2);
  fourFaces.add(f);
  
  fourFaces.add(f.copy().apply(new MirrorZ()));
  fourFaces.add(fourFaces.copy().apply(new MirrorY()));
  fourFaces.translateZ(h2.inv());
  fourFaces.face(0).reverse();
  fourFaces.face(3).reverse();
  
  Obj out = new Obj();
  for(int i=0; i<fourFaces.numOfFaces(); i++)
    out.add(new Extrude(fourFaces.face(i),s));
  
  ///INSIDE
  Pt ori = Anar.PtNull(0,0,0);
  Pts l1 = new Pts(ori,ori.copy().translateX(s.inv())).discretization(10);
  Pts l2 = l1.copy().translateZ(h.inv());
  
  Pts l3 = new Pts();
  
  for(int i=0; i<l1.numOfPts(); i++)
    l3.add(l1.pt(i),l2.pt(i));
  
  out.add(l3);
  println(l3);
  
  return out;
  //return new Obj().add(H);
}  

Obj hBeam(float size, float width, float height, float widthDelta, float heightDelta){
  Param w = new Param(width,0,50).tag("W");
  Param h = new Param(height,0,50).tag("H");
  Param t = new Param(heightDelta,0,5).tag("T");
  Param u = new Param(widthDelta,0,5).tag("U");
  Param s = new Param(size,0,200).tag("s");
  
  Param w2 = w.half();
  Param h2 = h.half();
  
  Pt ori = Anar.PtNull(0,0,0);
  
  Pt a = ori.copy().translateY(w2).translateZ(h2);
  Pt b = a.copy().translateZ(t.inv());
  Pt c = b.copy().translateY(w2.minus(u.half()).inv());
  
  Face H = new Face(a,b,c);
  
  H.add(H.copy().apply(new MirrorZ()).reverse());
  H.add(H.copy().apply(new MirrorY()).reverse());
  
  H.translateZ(h2.inv());
  
//    H.add(H.pt(2).copy().apply(my));
//    H.add(H.pt(1).copy().apply(my));
//    H.add(H.pt(0).copy().apply(my));
  
  return new Extrude(H,s);
  //return new Obj().add(H);
}


void draw(){
  background(155);
  beam.draw();
  truss.draw();
  axis.draw();
}




