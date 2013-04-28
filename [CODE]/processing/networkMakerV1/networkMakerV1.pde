int numNodes = 100;
float nodeDist = 100;

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
  size(600, 600); 
  smooth();
  cursor(CROSS);

  font01 = loadFont("Georgia-20.vlw"); 
  font02 = loadFont("Georgia-12.vlw"); 
  font03 = loadFont("Georgia-10.vlw"); 

  //  PImage img;
  //  img = loadImage("back_test.jpg");
  //  tint(255, 30);
  //  image(img, 0,0);
  
  numNodes = 50;

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
    node[i] = new NodeType1(random(50,500),random(200,550), 1);
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
    for(int i=0; i<numNodes; i++){
      nodeCount=0;
      if (node[i].pos[1]>150){
        for(int j=0; j<numNodes; j++){
          measDist = checkDist(node[i].pos[0], node[i].pos[1], node[j].pos[0], node[j].pos[1]);
          if (nodeDist > measDist){
            stroke(((measDist/nodeDist)*255),150);
            nodeCount++;
            line(node[i].pos[0], node[i].pos[1], node[j].pos[0], node[j].pos[1]);
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
          fill(100,40);
          noStroke();
          ellipse(node[i].pos[0], node[i].pos[1], node[i].dia[0], node[i].dia[0]);
///draw node body
          stroke(1);
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
  text(nCntA, 580, 40);
  text(nCntB, 580, 80);
  text(nDist, 580, 120);

}

void showInst(){
  
  noStroke();
  fill(255, 150);
  rect(0,0,600,600);

  fill(50);
  textAlign(CENTER);
  textFont(font01);
  text("network maker", 300, 300);
  text(". . . .", 300, 325);

  textFont(font03);
  text("select and move node with cursor", 300, 350);
  text("press tab to deselect", 300, 360);
  text("press n for an array of nodes", 300, 370);
  text("or", 300, 380);
  text("press m for a random set", 300, 390);
  text("or", 300, 400);
  text("press r to reset", 300, 410);
  text("press i for instructions", 300, 420);
  textFont(font01);
  text(". . . .", 300, 440);
  
  textFont(font02); 
  textAlign(RIGHT);
  text("number of active nodes", 530, 40);
  text("initial node set", 530, 80);
  textFont(font03); 
  text("to increase press z - to decrease press x", 530, 90);
  textFont(font02); 
  text("connection tolerance", 530, 120);
  textFont(font03); 
  text("to increase press q - to decrease press a", 530, 130);
  text("press d to display", 530, 140);

  
  if (nodeDraw==false){
    textFont(font01); 
    int nDist = int(nodeDist);
    textAlign(RIGHT);
    text("0", 580, 40);
    text(numNodes, 580, 80);
    text(nDist, 580, 120);
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






