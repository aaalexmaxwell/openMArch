
void dispEle() {
  //bottom image
  tint(255, 100);
  image(eleImE, elePos, height-eleY);
  //top image
  int nElePos=(elePos*-1)-4000;
  tint(255, 100);
  image(eleImW, nElePos, 0);
}


void headUpDisp() {

  for (int i=0; i<10; i++) {
    if (i<3) {
      if (dispWalk[i]==true) {
        fill(0);
      }
      else {
        fill(200);
      }
    }
    int k=i+1;
    textFont(font1); 
    if (k<10) {
      text("0"+k, 750,(175+(i*30)));
    }
    else {
      text(k, 750,(175+(i*30)));
    }
  }
}

void showGraph() {
  shape(graphIm, 0, 150);
}

void showCounter() {
  int count = sliceRef+1;
  fill(0);
  textFont(font3); 
  text("street ref " + count, 25,25);
}

