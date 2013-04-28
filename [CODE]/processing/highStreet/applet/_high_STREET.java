import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class _high_STREET extends PApplet {

PImage eleImW;
PImage eleImE;

PImage[] sliceDataIm = new PImage[100];

PFont font1;
PFont font2;
PFont font3;
PFont font4;

///manually change values to reflect number of walks
PShape[] sliceIm = new PShape[100];
PShape[] sliceData = new PShape[100];
int nSlices = 50;

PShape graphIm;

int elePos=2000;
int eleX=4800;
int eleY=150;

int sliceRef=25;
int prevSliceRef=24;
int sliceDir=1;
int ratio;
int liveWalk;

int mPos;
int mPosPrev;

///manually change values to reflect number of walks
int numWalks=2;
boolean[] dispWalk = new boolean[10];
boolean dispDistantSlices=false;
boolean dispGraph=true;

public void setup() {

  size(800,600);
  smooth();

  font1 = loadFont("CordiaNew-20.vlw"); 
  font2 = loadFont("CordiaNew-Bold-20.vlw"); 
  font3 = loadFont("CordiaNew-Italic-20.vlw");
  font4 = loadFont("CordiaNew-BoldItalic-20.vlw");

  ratio = (eleX/width);
  elePos = (eleX/2)+(width/2);

  ////////////////GET IMAGES..............................................
  eleImW = loadImage("eleImageW.png");
  eleImE = loadImage("eleImageE.png");  

  getSliceImData();

  getSlices();
  getGraph();
}

public void draw() {

  cursor(ARROW);  
  background(255,255,255);

  selectSlice();
  dispEle(); 
  displayImData();

  //////////////////SELECT DISPLAY STYLE, detailed view or overlayed walks.............
  if (dispDistantSlices==false) {
    dispCurrentSlice();
  }
  if (dispDistantSlices==true) {
    dispDistSlices();
  }

  headUpDisp();

  if (dispGraph==true) {
    showGraph();
  }

  showCounter();
}

public void dispCurrentSlice() {

  for (int i=0; i<numWalks; i++) {
    if (dispWalk[i]==true) {      
      fill(255,200,0,150);
      stroke(255,130,0);
      strokeWeight(1);
      shape(sliceIm[sliceRef+(nSlices*i)], 0, 150);
    }
  }  
  strokeWeight(10);
  stroke(255);
  fill(255,200,0,150);
  rect(352,0,96,150);
  rect(352,450,96,150);
}

////////////////////////////////////////////////////////////////////////

public void dispDistSlices() {

  int tempsSliceRef=0;

  for (int i=0; i<numWalks; i++) {
    if (dispWalk[i]==true) { 
      tempsSliceRef=sliceRef+(nSlices*i);
      liveWalk=i+1;
    }
  }

  if (liveWalk!=0) {

    ////////////////////////////////////////DISPLAY UP TO 5 SLICES INFRONT

    if (sliceDir>0) {
      int k = (49-sliceRef); 
      if (k>4) {
        k=5;
      }
      for (int i=0; i<k; i++) {

        //        fill(0,150,255,100-(i*20));
        fill(150,200,60,125-(i*10));
        strokeWeight(20);
        stroke(255,100-(i*10));
        shape(sliceIm[tempsSliceRef+i],0,150);

        stroke(255);
        strokeWeight(10);
        //        fill(0,150,255,100-(i*20));
        fill(153,204,0,75-(i*20));
        rect(352-(96*(i+1)),0,96,150);
        rect(352+(96*(i+1)),450,96,150);
      }
    }
    else {
      int k = sliceRef;
      if (k>4) {
        k=5;
      }
      for (int i=0; i<k; i++) {
        //        fill(0,150,255,100-(i*20));
        fill(150,200,60,125-(i*10));
        strokeWeight(20);
        stroke(255,100-(i*10));
        shape(sliceIm[tempsSliceRef-i],0,150);

        stroke(255);
        strokeWeight(10);
        //        fill(0,150,255,100-(i*20));
        fill(153,204,0,75-(i*20));
        rect(352-(96*(i+1)),450,96,150);
        rect(352+(96*(i+1)),0,96,150);
      }
    }

    ////////////////////////////////////////DISPLAY SELECTED SLICE    
    //    fill(0,150,255,125);
    //    stroke(0,150,255);

    fill(153,204,0,100);
    stroke(153,204,0);

    strokeWeight(2);
    shape(sliceIm[tempsSliceRef], 0, 150);

    stroke(255);
    strokeWeight(10);
    //    fill(0,150,255,150);
    fill(153,204,0,100);
    rect(352,0,96,150);
    rect(352,450,96,150);

    ////////////////////////////////////////DISPLAY SLICE BEHIND
    if ((sliceRef>0) && (sliceRef<49)) {
      noFill();
      //      stroke(0,255,255);
      stroke(153,204,0);
      strokeWeight(1);
      shape(sliceIm[tempsSliceRef-sliceDir],0,150);

      strokeWeight(10);
      stroke(255);
      //      fill(0,255,255,150);
      fill(153,204,0,125);
      rect(352+((96*sliceDir)),0,96,150);
      rect(352-((96*sliceDir)),450,96,150);
    }
  }
}

public void displayImData() { 

  for (int i=0; i<numWalks; i++) {
    if (dispWalk[i]==true) {
      if (dispDistantSlices==true) { 
        noTint();     
        if (dispWalk[0]==true) { /////image data limited to walk 1 only////////
          image(sliceDataIm[sliceRef], 0,0);
        }
      }
    }
  }
}






public void selectSlice() {

  prevSliceRef = sliceRef;

  if(mouseY>height-eleY) {
    //    sliceRef=mouseX/(width/nSlices);
    sliceRef=nSlices-(mouseX/(width/nSlices))-1;
    elePos=0-mouseX*(ratio)+(width/2);
    cursor(HAND);
  }
  if(mouseY<eleY) {
    sliceRef=nSlices-(mouseX/(width/nSlices))-1;
    elePos=0-mouseX*(ratio)+(width/2);
    cursor(HAND);
  }

  //////////////////CALCULATE DIRECTION BASED ON CURRENT AND PREVIOUS SLICES
  if (sliceRef != prevSliceRef) {
    sliceDir= sliceRef-prevSliceRef;
  }

  if (sliceDir>0) {
    sliceDir = 1;
  }
  else {
    sliceDir = -1;
  }
}

public void keyReleased() {
  if(key=='1') {
    if (dispWalk[0]==false) {
      dispWalk[0]=true;
      if (dispDistantSlices==true) {
        dispWalk[1]=false;
      }
    }
    else {
      dispWalk[0]=false;
      if (dispDistantSlices==true) {
        dispWalk[0]=true;
      }
    }
  }
  if(key=='2') {
    if (dispWalk[1]==false) {
      dispWalk[1]=true;
      if (dispDistantSlices==true) {
        dispWalk[0]=false;
      }
    }
    else {
      dispWalk[1]=false;
      if (dispDistantSlices==true) {
        dispWalk[1]=true;
      }
    }
  }

  if (key=='d') {
    if(dispDistantSlices==true) {
      dispDistantSlices=false;
    }
    else {
      dispDistantSlices=true;
      dispWalk[0]=true;

      for (int i=1;i<10;i++) {
        dispWalk[i]=false;
      }
    }
  }

  if (key=='g') {
    if (dispGraph==false) {
      dispGraph=true;
    }
    else {
      dispGraph=false;
    }
  }
}

public void getSlices() {
  int j=0;
  for (int k=1; k<numWalks+1; k++) {
    for (int i=1; i<nSlices+1; i++) {
      sliceIm[j] = loadShape("walk_" + k + "_sec_" + i + ".svg");
      sliceIm[j].disableStyle();
      j++;
    }
  }
}

public void getGraph() {
  graphIm=loadShape("graph_Image.svg");
}

public void getSliceImData() {
  int j=0;
  for (int k=1; k<numWalks+1; k++) {
    for (int i=1; i<nSlices+1; i++) {
      sliceDataIm[j] = loadImage("walk_" + k + "_data_" + i + ".png");
      j++;
    }
  }
}


public void dispEle() {
  //bottom image
  tint(255, 100);
  image(eleImE, elePos, height-eleY);
  //top image
  int nElePos=(elePos*-1)-4000;
  tint(255, 100);
  image(eleImW, nElePos, 0);
}


public void headUpDisp() {

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

public void showGraph() {
  shape(graphIm, 0, 150);
}

public void showCounter() {
  int count = sliceRef+1;
  fill(0);
  textFont(font3); 
  text("street ref " + count, 25,25);
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#F0F0F0", "_high_STREET" });
  }
}
