void enviroDraw() {

  noStroke();
  fill(200,70);
  beginShape(QUADS);
  vertex(-300,400,-300);    
  vertex(300,400,-300);
  vertex(300,400,300);
  vertex(-300,400,300);
  endShape(CLOSE);

  PVector v1, v2, v3, v4, v5, v6;
  strokeWeight(1);
  noFill();
  stroke(200);

  int x, y, z;
  strokeWeight(1);
  noFill();

  ////////////////////////////////////////////////corner markers
  for (int i=0;i<4;i++) {

    strokeWeight(1);
    noFill();
    stroke(10,100);

    line((H/2),(H/2),(H/2)-i*200,((H/12)*5),(H/2),(H/2)-i*200);
    line((H/2),(H/2),(H/2)-i*200,(H/2),((H/12)*5),(H/2)-i*200);

    line((H/2),(H/-2),(H/2)-i*200,((H/12)*5),(H/-2),(H/2)-i*200);
    line((H/2),(H/-2),(H/2)-i*200,(H/2),((H/-12)*5),(H/2)-i*200);

    line((H/-2),(H/2),(H/2)-i*200,((H/-12)*5),(H/2),(H/2)-i*200);
    line((H/-2),(H/2),(H/2)-i*200,(H/-2),((H/12)*5),(H/2)-i*200);

    line((H/-2),(H/-2),(H/2)-i*200,((H/-12)*5),(H/-2),(H/2)-i*200);
    line((H/-2),(H/-2),(H/2)-i*200,(H/-2),((H/-12)*5),(H/2)-i*200);
  }

  ////////////////////////////////////////////////faces  

  for (int i=0;i<4;i++) { 
    if (ACTIVECLUB==i) {
      stroke(200);
      fill(0, 20);
      translate(0,0,(ACTIVECLUB*200-300));
      image(clubIm3D[ACTIVECLUB],-600,-300,1200,600);
      translate (0,0,-(ACTIVECLUB*200-300));
    } 
    else {    
      noStroke();
      noFill();
    }

    beginShape(QUADS);
    vertex((H/2),(H/2),((H/2)+i*200)-600);    
    vertex((H/-2),(H/2),((H/2)+i*200)-600);
    vertex((H/-2),(H/-2),((H/2)+i*200)-600);
    vertex((H/2),(H/-2),((H/2)+i*200)-600);
    endShape(CLOSE);
  }

  ////////////////////////////////////////////////graph points
  stroke(200,100);
  for (int i=0; i<4; i++) {
    for (int j = 0; j<4; j++) {
      for (int k=0; k<4; k++) {
        x=(i*200)-300;
        y=(j*200)-300;
        z=(k*200)-300;
        v1 = new PVector(-10+x,0+y,0+z);
        v2 = new PVector(10+x,0+y,0+z);
        v3 = new PVector(0+x,-10+y,0+z);
        v4 = new PVector(0+x,10+y,0+z);
        v5 = new PVector(0+x,0+y,-10+z);
        v6 = new PVector(0+x,0+y,10+z);    
        line(v1.x,v1.y,v1.z, v2.x,v2.y,v2.z);
        line(v3.x,v3.y,v3.z, v4.x,v4.y,v4.z);
        line(v5.x,v5.y,v5.z, v6.x,v6.y,v6.z);
      }
    }
  }
}

void uiDisplay() {

  //////////////////////////////////////////////flash white panel
  float colRef=255;
  if (COUNT==0) {
    colRef=0;
  } 
  else {
    colRef=255-COUNT*50;
  }
  fill(255,colRef); 
  rect(W/4,0,((W/4)*3),H);

  //////////////////////////////////////////////draw loop buttons and loop data
  int butPosX=0;
  int butPosY=0;
  //  strokeWeight(1);
  noStroke();
  fill(150,100);
  rect(butPosX,butPosY,20,800);

  for (int i=0; i<noLoopsType; i++) {
    if (loops[i].show==true) {
      if (loops[i].highlight==true) {
        fill(100,100);
        stroke(50,50);
      } 
      else {
        fill(255);
        stroke(100,100);
      }
      rect(butPosX,butPosY,20,20);
      butPosY=butPosY + 20;
    }
  }
  noButtons=butPosY/20;

  for (int i=0; i<noLoopsType; i++) {
    if (loops[i].show==true) {
      if (loops[i].highlight==true) {
        image(loopIm[i],200,0,600,600);
      }
    }
  }

  //////////////////////////////////////////////draw club buttons and club data
  butPosX=20;
  butPosY=0;
  noStroke();
  fill(150,100);
  rect(butPosX,butPosY,20,800);

  for (int i=0; i<4; i++) {
    if (ACTIVECLUB==i) {
      fill(100,100);
      stroke(50,50);
    } 
    else {
      fill(255);
      stroke(100,100);
    }
    rect(butPosX,butPosY,20,20);
    butPosY=butPosY + 20;
  }

  //////////////////////////////////////////////draw club data
  if (ACTIVECLUB<10) {
    println(ACTIVECLUB);
    image(clubIm[ACTIVECLUB],60,0,140,600);
  }

  //////////////////////////////////////////////activate network type
  butPosX=40;
  butPosY=0;
  noStroke();
  fill(150,100);
  rect(butPosX,butPosY,20,800);

  for (int i=0; i<5; i++) {
    if (ACTIVELOOP==i) {
      fill(100,100);
      stroke(50,50);
    } 
    else {
      fill(255);
      stroke(100,100);
    }
    rect(butPosX,butPosY,20,20);
    butPosY=butPosY + 20;
  }

  if (disInst==true) {
    fill(255,220);
    rect(60,0,740,600);
    fill(255,50);
    rect(0,0,60,600);
    image (Inst_Image, 0,0, 800, 600);
  }
}

float checkDist(PVector sp, PVector ep) {
  float a = sq(sp.x-ep.x);
  float b = sq(sp.y-ep.y);
  float c = sq(sp.z-ep.z);
  float cDis = sqrt(a+b+c);
  return cDis;
}

