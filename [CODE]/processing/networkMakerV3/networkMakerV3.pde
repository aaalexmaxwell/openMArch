
PImage img;

int numNodes = 25;
float nodeDist = 100;
int[] c = {};

float measDist;
int nodeCount;

boolean drawDist=false;
boolean nNodes=false;
boolean mNodes=false;
boolean dispDraw=false;
boolean nodeDraw=false;
boolean instDraw=true;

NodeType1[] node = new NodeType1[numNodes];

PFont font01;
PFont font02;
PFont font03;

void setup(){
  size(1000, 600); 
  smooth();
  cursor(CROSS);

  font01 = loadFont("Georgia-20.vlw"); 
  font02 = loadFont("Georgia-12.vlw"); 
  font03 = loadFont("Georgia-10.vlw"); 

  img = loadImage("sheffield.jpg");

  numNodes = 25;
  
  for (int i=0; i<numNodes; i++){
    c = append(c,color(random(255),random(255),random(255)));
  }

}

////////////////////////////////////////////////////////////////////////////////////////INITIALISE
void createNodesLine(){
  for (int i=0;i<numNodes;i+=1){  
    float xp =0;
    float yp= 0;
    if (i<100){
      xp =(30+(10*i)-800);
      yp=70;
      if (i<80){
        xp =(30+(10*i)-400);
        yp=50;
        if(i<40){
         xp =(30+(10*i));
         yp=30;
        }
      }
    } 

    node[i] = new NodeType1(xp,yp,1);
  }
  nNodes=false;
}

void createNodesRandom(){
//  randomSeed(0);
  for (int i=0;i<numNodes;i+=1){  
    node[i] = new NodeType1(random(50,950),random(200,550), 1);
  }
  mNodes=false;
}

///--------------------------------------------------------------------------------------------------------------------------------------------
void draw(){

  background(255);

  if (instDraw==true) showInst();

  if (nNodes == true) {
    createNodesLine();
    dispDraw=true;
    nodeDraw=true;
    instDraw=false;
  }
  if (mNodes == true) {
    createNodesRandom();
    dispDraw=true;
    nodeDraw=true;
    instDraw=false;
  }

  if (dispDraw==true) displayDraw();

  if (nodeDraw==true){
//////////////////////////////////////////////////////////////////////////////DRAW CONNECTIONS
    voronoi();
    
    tint(255, 50);
    image(img, 0,0);
    
    for(int i=0; i<numNodes; i++){
      nodeCount=0;
      if (node[i].pos[1]>150){
        for(int j=0; j<numNodes; j++){
          measDist = checkDist(node[i].pos[0], node[i].pos[1], node[j].pos[0], node[j].pos[1]);
          if (nodeDist > measDist){
            //strokeWeight((nodeDist/measDist)/2);
            //stroke(((measDist/nodeDist)*255),150);
            strokeWeight(2);
            stroke(((measDist/nodeDist)*255),150);
            nodeCount++;
            line(node[i].pos[0], node[i].pos[1], node[j].pos[0], node[j].pos[1]);
            strokeWeight(1);
          }
        }
        node[i].dia[0] = (nodeCount*5);
      } 
       
      
    }
    
    
//////////////////////////////////////////////////////////////////////////////END DRAW CONNECTIONS

//////////////////////////////////////////////////////////////////////////////DRAW NODES
    for(int i=0; i<numNodes; i++){
      if (node[i].pos[1]>nodeDist){
//////////////////////////////////////////////////////////////////////////////BELOW THE LINE
        if (node[i].selected == true){
///SELECTED NODE
///update node position
          node[i].pos[0]=mouseX;
          node[i].pos[1]=mouseY;
///circle indicating number of connections
          fill(255,0,100,50);
          noStroke();
          ellipse(node[i].pos[0], node[i].pos[1], node[i].dia[0], node[i].dia[0]);
///draw node body     
          stroke(255,0,110);
          fill(255);
          ellipse(node[i].pos[0], node[i].pos[1], 12, 12);
///draw circle indicating tolerance
          if (drawDist==true){
            stroke(255,0,110,100);
            noFill();
            ellipse(node[i].pos[0], node[i].pos[1], nodeDist*2, nodeDist*2);
          }
///UNSELECTED NODE
        } else {
///circle indicating number of connections
          fill(255,80);
          //noStroke();
          stroke(255,150);
          ellipse(node[i].pos[0], node[i].pos[1], node[i].dia[0], node[i].dia[0]);
///draw node body
          stroke(2);
          fill(1);
          ellipse(node[i].pos[0], node[i].pos[1], 3, 3);
        }
      } else {
//////////////////////////////////////////////////////////////////////////////ABOVE THE LINE
        if (node[i].selected == true){
///SELECTED NODE
///update node position
          node[i].pos[0]=mouseX;
          node[i].pos[1]=mouseY;
          stroke(255,0,110);
          fill(255);
          ellipse(node[i].pos[0], node[i].pos[1], 20, 20);
///UNSELECTED NODE
        } else {
          stroke(1);
          fill(255);
          ellipse(node[i].pos[0], node[i].pos[1], 10, 10);
        }        
      }
    }
////////////////////////////////////////////////////////////////////////////////////////END DRAW NODES

  }
  
  if (instDraw==true) showInst();
}
///--------------------------------------------------------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////DISPLAY
void displayDraw(){

  int nCntA=0;
  int nCntB=0;
  for (int i=0;i<numNodes;i++){
    if (node[i].pos[1]>nodeDist){
      nCntA++;
    }
  }

  nCntB=numNodes-nCntA;

  int nDist = int(nodeDist);

  textFont(font01); 
  fill(50);
  textAlign(RIGHT);
  text(nCntA, 980, 40);
  text(nCntB, 980, 80);
  text(nDist, 980, 120);

}

void showInst(){
  
  noStroke();
  fill(255, 150);
  rect(0,0,1000,1000);

  fill(50);
  textAlign(CENTER);
  textFont(font01);
  text("network maker", 500, 300);
  text(". . . .", 500, 325);

  textFont(font03);
  text("select and move node with cursor", 500, 350);
  text("press tab to deselect", 500, 360);
  text("press n for an array of nodes", 500, 370);
  text("or", 500, 380);
  text("press m for a random set", 500, 390);
  text("or", 500, 400);
  text("press r to reset", 500, 410);
  text("press i for instructions", 500, 420);
  textFont(font01);
  text(". . . .", 500, 440);
  
  textFont(font02); 
  textAlign(RIGHT);
  text("number of active nodes", 930, 40);
  text("initial node set", 930, 80);
  textFont(font03); 
  text("to increase press z - to decrease press x", 930, 90);
  textFont(font02); 
  text("connection tolerance", 930, 120);
  textFont(font03); 
  text("to increase press q - to decrease press a", 930, 130);
  text("press d to display", 930, 140);

  
  if (nodeDraw==false){
    textFont(font01); 
    int nDist = int(nodeDist);
    textAlign(RIGHT);
    text("0", 980, 40);
    text(numNodes, 980, 80);
    text(nDist, 980, 120);
  }
}

////////////////////////////////////////////////////////////////////////////////////////CLASSES
class NodeType1{
  float[] pos = new float[2];
  float[] dia = new float[1];
  boolean selected = false;

  NodeType1(float pX, float pY, float d){
    pos[0] = pX;
    pos[1] = pY;
    dia[0] = d;
  }
}

////////////////////////////////////////////////////////////////////////////////////////MEASUREMENTS
float checkDist(float px,float py, float qx, float qy){
  float a = sq(px-qx);
  float b = sq(py-qy);
  float cDis = sqrt(a+b);
  return cDis;
}

void findNear(float xPos, float yPos){

  float tempDist=10000;
  float z=0;
  int nNode=0;

  for(int i = 0;i<numNodes; i++){
    node[i].selected=false;
    float holdDist = checkDist(xPos, yPos, node[i].pos[0], node[i].pos[1]);
    if (holdDist < tempDist){
      tempDist = holdDist;
      nNode = i;
    }
  }
  node[nNode].selected=true;

}

////////////////////////////////////////////////////////////////////////////////////////CONTROLS
void  mouseClicked() {
  if(nodeDraw==true){
  findNear(mouseX, mouseY);
  }
}

void  keyPressed() {
  if (key == TAB){ 
    for (int i = 0; i<numNodes; i++){
        node[i].selected =false;
    }
  }
  if (key == 'r') {
    nNodes=false;
    mNodes=false;
    instDraw=true;
    dispDraw=false;
    nodeDraw=false;
  }
  if (key == 'n') nNodes=true;
  if (key == 'm') mNodes=true;
  if (key == 'i') {
    if (instDraw==true){
      instDraw=false;
    } else{
      instDraw=true;
    }
  }
  if (instDraw==true){
    if (key == 'z') numNodes++;
    if (key == 'x') numNodes--;
  }
  if (key == 'q') nodeDist++;
  if (key == 'a') nodeDist--;
  if (key == 'd'){ 
    if (drawDist==false){
      drawDist = true;
    }
    else{
      drawDist = false;
    }
  }

}

void voronoi (){
  color col = color(0,0,0);
  
  for( int xx=0; xx<width && (numNodes > 0); xx=xx+1 ) {
    for( int yy=0; yy<height; yy=yy+1 ) {
      int idx = 0;
      float dd;
      dd = dist(node[0].pos[0],node[0].pos[1],xx,yy);
      for( int i=1; i<numNodes; i++ ) {
        float d0 = dist(node[i].pos[0],node[i].pos[1],xx,yy);
        if( dd > d0 ) {
          dd = d0;
          idx = i;
          col = color((dd*(255/nodeDist)),(dd*(255/nodeDist)),(dd*(255/nodeDist)));
          col = color(dd,dd,dd);
        }
      }
//      set(xx,yy,c[idx]);
      set(xx,yy,col);
    }
  }
//  fill(255,150);
//  rect (0,0, 1000,600);
    
}






