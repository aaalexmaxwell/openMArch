import processing.pdf.*;
boolean EXPORT=false;

PImage[] clubIm = new PImage[4];
PImage[] clubIm3D = new PImage[4];
PImage[] loopIm = new PImage [26];
PImage Inst_Image;
PImage[] typeImage = new PImage[5];

int noButtons=0;
int showLoopIndex=0;
int ACTIVECLUB=10;
int ACTIVELOOP=10;
int attCount=0;

float ATTRACT= -0.03;
float REPEL= 0.03;
float TENSION = 0.3;

float COUNT;

boolean attRepOn=false;    
boolean mReset=false;
boolean envirOn=true;
boolean meshOn=false;
boolean disInst = false;

PFont font01;

String textLine;
String dataString[];
BufferedReader reader;

int exIn=0;

int H=600;
int W=800;

float ROTX=-0.9;                        
float ROTY=-0.5;
float VSCALE;
float XTRANSLATE;
float YTRANSLATE;

////////////////////////MUST BE UPDATED MANUALLY------------------------
int noLoopsType = 25;
loopsType[] loops = new loopsType[noLoopsType];
////////////////////////MUST BE UPDATED MANUALLY------------------------

int mMax = 20;
int spaceDim = (H+500)/(mMax-1);
int offSet = (H+500)/2;
int noMeshNodes = ((mMax-2)*(mMax-2))*6;

meshNodeType[] mNode = new meshNodeType[noMeshNodes];
meshMemNodeType[] memNode  = new meshMemNodeType[noMeshNodes];

void setup() {

  size(W,H, P3D);
  //frameRate(30);
  cursor(CROSS);

  textureMode(IMAGE);

  VSCALE=30;
  XTRANSLATE=7000;
  YTRANSLATE=0;

  initializeMesh();
  meshDefine();
  initializeLoops();
  getImages();
}

void draw() {

  if (EXPORT==true) {
    hint(ENABLE_DEPTH_SORT);
    beginRaw(PDF, "export.pdf");
  }

  background(255);

  pushMatrix();

  translate(XTRANSLATE, YTRANSLATE, -35000);
  rotateX(ROTY);
  rotateY(ROTX); 
  scale(VSCALE);
  
  ///////////////////////////////////////////////////////////////////////////////DO   
  ////////////////////////////////////////attract repel  
  if (attRepOn==true) {   
    if (attCount<100) {
      /////////// attract to target loop node
      for (int i = 0; i<noMeshNodes; i++) {
        mNode[i].attract();
      }
      ///////////calibaate surface tension of mesh
      for (int i = 0; i<noMeshNodes; i++) {
        mNode[i].tension();
      }
      attCount++;
    }
  } 

  if (attCount>=100) {
    attRepOn=false;
    attCount=0;
  }

  //////////////////////////////////////reset the mesh    
  if (mReset==true) {
    initializeMesh();
    mReset=false;
    for (int j=0; j<noLoopsType; j++) {
      loops[j].highlight=false;
    }
  }
  
  ///////////////////////////////////////////////////////////////////////////////DRAW
  //////////////////////////////////////draw the graph  
  if (envirOn==true) {
    enviroDraw();
  } 
  //////////////////////////////////////draw the mesh        
  meshDraw();
  //////////////////////////////////////draw the loops           
  for (int i=0; i<noLoopsType; i++) {
    if (loops[i].show==true) {
      loops[i].display();
    }
  }

  popMatrix();
  //////////////////////////////////////draw the interface       
  uiDisplay();

  if (EXPORT==true) {
    endRaw();
    EXPORT=false;
  }

  if (ACTIVELOOP<10) {
    image(typeImage[ACTIVELOOP],200,0, 600,600);
  }

  COUNT++;

}

