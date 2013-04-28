float checkDist(float px,float py, float pz, float qx, float qy, float qz){
  float a = sq(px-qx);
  float b = sq(py-qy);
  float c = sq(pz-qz);
  float cDis = sqrt(a+b+c);
  return cDis;
}

void mouseDragged(){
  rotX += (mouseX - pmouseX) * 0.005;
  rotY -= (mouseY - pmouseY) * 0.005;
  redraw();
}

void enviroDraw(){

  noFill();
  stroke(100,10);
  box(H);
  
//  (H/2)
//  (H/-2)
//  ((H/12)*5)
//  ((H/-12)*5)
  
  stroke(10,100);
  
  line((H/2),(H/2),(H/2),((H/12)*5),(H/2),(H/2));
  line((H/2),(H/2),(H/2),(H/2),((H/12)*5),(H/2));
  line((H/2),(H/2),(H/2),(H/2),(H/2),((H/12)*5));

  line((H/2),(H/-2),(H/2),((H/12)*5),(H/-2),(H/2));
  line((H/2),(H/-2),(H/2),(H/2),((H/-12)*5),(H/2));
  line((H/2),(H/-2),(H/2),(H/2),(H/-2),((H/12)*5));

  line((H/-2),(H/2),(H/2),((H/-12)*5),(H/2),(H/2));
  line((H/-2),(H/2),(H/2),(H/-2),((H/12)*5),(H/2));
  line((H/-2),(H/2),(H/2),(H/-2),(H/2),((H/12)*5));

  line((H/-2),(H/-2),(H/2),((H/-12)*5),(H/-2),(H/2));
  line((H/-2),(H/-2),(H/2),(H/-2),((H/-12)*5),(H/2));
  line((H/-2),(H/-2),(H/2),(H/-2),(H/-2),((H/12)*5));

  line((H/2),(H/2),(H/-2),((H/12)*5),(H/2),(H/-2));
  line((H/2),(H/2),(H/-2),(H/2),((H/12)*5),(H/-2));
  line((H/2),(H/2),(H/-2),(H/2),(H/2),((H/-12)*5));

  line((H/2),(H/-2),(H/-2),((H/12)*5),(H/-2),(H/-2));
  line((H/2),(H/-2),(H/-2),(H/2),((H/-12)*5),(H/-2));
  line((H/2),(H/-2),(H/-2),(H/2),(H/-2),((H/-12)*5));

  line((H/-2),(H/2),(H/-2),((H/-12)*5),(H/2),(H/-2));
  line((H/-2),(H/2),(H/-2),(H/-2),((H/12)*5),(H/-2));
  line((H/-2),(H/2),(H/-2),(H/-2),(H/2),((H/-12)*5));

  line((H/-2),(H/-2),(H/-2),((H/-12)*5),(H/-2),(H/-2));
  line((H/-2),(H/-2),(H/-2),(H/-2),((H/-12)*5),(H/-2));
  line((H/-2),(H/-2),(H/-2),(H/-2),(H/-2),((H/-12)*5));

//  line(300,300,300,250,300,300);
//  line(300,300,300,300,250,300);
//  line(300,300,300,300,300,250);
//
//  line(300,-300,300,250,-300,300);
//  line(300,-300,300,300,-250,300);
//  line(300,-300,300,300,-300,250);
//
//  line(-300,300,300,-250,300,300);
//  line(-300,300,300,-300,250,300);
//  line(-300,300,300,-300,300,250);
//
//  line(-300,-300,300,-250,-300,300);
//  line(-300,-300,300,-300,-250,300);
//  line(-300,-300,300,-300,-300,250);
//
//  line(300,300,-300,250,300,-300);
//  line(300,300,-300,300,250,-300);
//  line(300,300,-300,300,300,-250);
//
//  line(300,-300,-300,250,-300,-300);
//  line(300,-300,-300,300,-250,-300);
//  line(300,-300,-300,300,-300,-250);
//
//  line(-300,300,-300,-250,300,-300);
//  line(-300,300,-300,-300,250,-300);
//  line(-300,300,-300,-300,300,-250);
//
//  line(-300,-300,-300,-250,-300,-300);
//  line(-300,-300,-300,-300,-250,-300);
//  line(-300,-300,-300,-300,-300,-250);

}

void statusBar(){

//  rectMode(CORNERS);
//  fill(50,40);
//  noStroke();
//  rect(0,(H-(H/10)),H,H);
//
//  rectMode(CORNERS);
//  fill(50,40);
//  noStroke();
//  rect(0,(H-(H/10)),H/10,H);

  PFont font1, font2;
  font1 = loadFont("Georgia-30.vlw");
  font2 = loadFont("LucidaConsole-30.vlw");

  textFont(font1);
  fill(10);
  textAlign(LEFT);
  if (KEY_COUNT<10){
    text(KEY_COUNT,(3*H/100),(H-(3*H/100)));
  }
   if (KEY_COUNT>=10){
    text(KEY_COUNT,(2*H/100),(H-(3*H/100)));
  }

}

void keyPressed() {
  if (key == 'e') record = true;
  if (key == TAB) runStep = true;
  if (key == 'r') runCon = true;
  if (key == 'R') runCon = true;
  if (key == 's') runCon = false;
  if (key == 'S') runCon = false;
  if (key =='p'){
    rotX = 0;
    rotY = 0;
  } 
}

void fileName() {

  String s1[]= new String[2];
  String kc;

  kc = nf(KEY_COUNT, 4);

  s1[0]="output";
  s1[1]=kc;

  String join01 = join(s1, "_"); 

  String s2[]= new String[2];
  s2[0] = join01;
  
  if (filePdf == true) s2[1] = "pdf";
  if (fileDxf == true) s2[1] = "dxf";

  fileIndex = join(s2, "."); 
  
  println(fileDxf);

}

