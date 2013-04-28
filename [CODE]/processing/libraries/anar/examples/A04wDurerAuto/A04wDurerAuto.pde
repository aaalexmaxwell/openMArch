import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */

boolean isTracing = true;


Pts     trace     = new Pts();
Pt      tip;


void setup(){

    size(1000,500,OPENGL);
  Anar.chy(this);
  Anar.drawAxis(true);

  createMechanism();
  trace.render = new RenderPtsLineDotted(new AColor(255,40,50));

  Obj lastPart = new Obj();
  Pts l = new Pts();
  l.add(Anar.Pt(10,0, -10));
  l.add(Anar.Pt(0,0, -10));
  l.add(Anar.Pt(0,0,0));

  lastPart.add(l);


  for (int i = 0; i<5; i++){
    Obj part = new Obj();

    // Add previous part
    part.add(lastPart);


    // Place the new part in the direction previous part
    // It is inverted!
    Pts axis = lastPart.lineEnd();

    Param t = new Param(20,0,100);
    Param z = new ParamCycle(0, -PI*2,PI*2,t);
    Anar.sliders(z);

    Obj tmp = createDurerPart();
    tmp.rotateX(alph);
    Transform position = new Transform(axis.pt(2),axis.pt(0),axis.pt(1)).rotateY(z);
    position.postTransform = false;
    tmp.apply(position);

    // This part is oriented, then add it to the new part
    part.add(tmp);

    lastPart = part;
  }


  tip = lastPart.lineEnd().pt(2);


  Anar.add(lastPart);
}

int   id;

Param wi    = new Param( -10);
Param alph  = new Param(PI/2);

Obj   mechObj;
float depth = 1;

void createMechanism(){
  Face mech = new Star(10,4,12);
  mechObj = new Extrude(mech,depth);
  mechObj.translateZ( -depth/2);

  mechObj.rotateX((float)Math.PI/2);
}


Obj createDurerPart(){

  Pt origin = Anar.Pt(0,0,0);

  Param t = new Param( (3-id%2)*2+id*0.001f,0,200);
  Param w = new Param(100/ (id+1),0,100);
  Param r = new ParamCycle(0, -PI*2,PI*2,t);
  // Param r = new Param(0, -PI*2,PI*2);

  Anar.sliders(t);
  Anar.sliders(w);
  Anar.sliders(r);

  Obj part = new Obj();

  Pt head = Anar.Pt(origin);
  head.translateZ(w);

  Pt tail = Anar.Pt(origin);
  tail.translateZ(wi);

  Pt rd3 = Anar.Pt(origin);
  rd3.translateX( -10);

  Obj headO = new Cone(1,10);
  headO.translateZ( -10);
  headO.translate(head);

  part.add(headO);


  Obj mech = new Obj(mechObj);
  mech.rotateZ(0);
  part.add(mech);

  Pts l = new Pts();
  l.add(rd3);
  l.add(tail);
  l.add(head);
  l.stroke(160);


  part.add(l);
  part.rotateY(r); // This one is ok


  id++;
  return part;
}


void draw(){
  background(200);
  Anar.main.draw();

  if(isTracing)
    if(trace.numOfPts()==0|| !tip.equalsPt(trace.ptEnd()))
      trace.add(Anar.Pt(tip.x(),tip.y(),tip.z()));

  trace.draw();


}


void keyPressed(){
  isTracing = (isTracing) ? false:true;
  println(isTracing);
}


