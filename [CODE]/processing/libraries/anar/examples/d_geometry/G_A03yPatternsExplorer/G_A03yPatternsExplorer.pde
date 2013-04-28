import processing.opengl.*;
import anar.*;




// TODO: (1) Create this example of all possible patterns in teh world


/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */



Obj   myObj;
Param w = new Param(10,0,50);

void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  Anar.drawAxis();

  initForm();
}

void initForm(){
  myObj = new Obj();

  Anar.slidersReset();
  Anar.sliders(w);


  Obj module = createModule();

  Translate decal = new Translate(w,w);

  Obj pattern = module;

  for (int i = 0; i<4; i++){
    pattern = flipOnX(pattern);
    pattern = flipOnY(pattern);

    for (int j = 0; j< (i+1)*2; j++)
      pattern.apply(decal);

  }


  myObj.add(pattern);
  myObj.fill(255,random(255),random(255),random(150)+55);
  Anar.camTarget(myObj);
}


Obj createModule(){
  Obj module = new Obj();
  Face square = new Rect(w,w);

  for (int i = 0; i<square.numOfPts(); i++){
    Param radius = new Param(random(5)+5,5,10);
    Anar.sliders(radius);

    Face circ = new Rect(square.pt(i),radius,radius);
    module.add(circ);
  }

  return module;
}


Obj flipOnX(Obj moduleA){

  Obj moduleB = new Obj(moduleA);
  moduleB.apply(new TranslateX(w));
  moduleB.apply(new MirrorX());

  Obj subPatch = new Obj();
  subPatch.add(moduleA);
  subPatch.add(moduleB);

  return subPatch;
}

Obj flipOnY(Obj moduleA){

  Obj moduleB = new Obj(moduleA);
  moduleB.apply(new TranslateY(w));
  moduleB.apply(new MirrorY());

  Obj subPatch = new Obj();
  subPatch.add(moduleA);
  subPatch.add(moduleB);

  return subPatch;
}


void draw(){
  background(155);
  myObj.draw();
}

void keyPressed(){
  if(key==' ')
    initForm();
}

