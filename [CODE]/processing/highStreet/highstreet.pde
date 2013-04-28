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

void setup() {

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

void draw() {

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

