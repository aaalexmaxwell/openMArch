int numNodesX = 20;
int numNodesY = 20;

float nodeDist = 50;
float gridDist = 20;
int nodeTol = 5;

boolean createGrid = false;
boolean drawGrid = false;
boolean instDraw = true;
boolean dispDraw = false;
boolean drawNodeDist = false;
boolean nodeSelected = false;
boolean settleGrid = false;

float[] selectNode = new float [2];

NodeType1[][] node = new NodeType1[numNodesX+2][numNodesY+2]; 

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

  numNodesX = 5;
  numNodesY = 5;

  selectNode[0] = numNodesX;
  selectNode[1] = numNodesY;

  //  PImage img;
  //  img = loadImage("back_test.jpg");
  //  tint(255, 30);
  //  image(img, 0,0);

}

///----------------------------------------------------------------------------------------------------------------------------------

void draw(){

  background(255);

  if (instDraw==true) showInst();

  if (createGrid==true) {
    createNodeGrid();
    dispDraw=true;
    instDraw=false;
  }

  if (dispDraw==true) displayDraw();

  if (drawGrid==true){        
    ///----------

    calcTol();
    updateNodePosFromSelected();
    updateNodePosFromGrid();

    //////////////////// DRAW THE GRID & NODES 
    for (int i=0;i<numNodesX+2;i++){  
      for (int j=0;j<numNodesY+2;j++){ 

        ///draw the grid   
        if (i==0||j==0||i==numNodesX+1||j==numNodesY+1){
        } 
        else {       
          ///this draws the perimeter lines in white    
          float lineDist=0;
          int tol= 5;

          if (node[i][j].con1==true){
            //            lineDist = checkDist(node[i][j].pos[0], node[i][j].pos[1], node[i][j-1].pos[0],node[i][j-1].pos[1]);
            //            if (lineDist<gridDist+tol){
            //              stroke(1,30);
            //            }else{
            //              stroke(1,70);
            //            }
            stroke(1,30);
            line(node[i][j].pos[0], node[i][j].pos[1], node[i][j-1].pos[0],node[i][j-1].pos[1]);
          } 

          if (node[i][j].con2==true){
            //            lineDist = checkDist(node[i][j].pos[0], node[i][j].pos[1], node[i+1][j].pos[0],node[i+1][j].pos[1]);
            //            if (lineDist<gridDist+tol){
            //              stroke(1,30);
            //            }else{
            //              stroke(1,70);
            //            }
            stroke(1,30);
            line(node[i][j].pos[0], node[i][j].pos[1], node[i+1][j].pos[0],node[i+1][j].pos[1]);
          }  

          if (node[i][j].con3==true){
            lineDist = checkDist(node[i][j].pos[0], node[i][j].pos[1], node[i][j+1].pos[0],node[i][j+1].pos[1]);
            //            if (lineDist<gridDist+tol){
            //              stroke(1,30);
            //            }else{
            //              stroke(1,70);
            //            }
            stroke(1,30);
            line(node[i][j].pos[0], node[i][j].pos[1], node[i][j+1].pos[0],node[i][j+1].pos[1]);
          }  

          if (node[i][j].con4==true){
            //            lineDist = checkDist(node[i][j].pos[0], node[i][j].pos[1], node[i-1][j].pos[0],node[i-1][j].pos[1]);
            //            if (lineDist<gridDist+tol){
            //              stroke(1,30);
            //            }else{
            //              stroke(1,70);
            //            }
            stroke(1,30);
            line(node[i][j].pos[0], node[i][j].pos[1], node[i-1][j].pos[0],node[i-1][j].pos[1]);
          } 

          ///use this to draw all lines
          //          line(node[i][j].pos[0], node[i][j].pos[1], node[i+1][j].pos[0],node[i+1][j].pos[1]);
          //          line(node[i][j].pos[0], node[i][j].pos[1], node[i][j+1].pos[0],node[i][j+1].pos[1]);
          //          line(node[i][j].pos[0], node[i][j].pos[1], node[i-1][j].pos[0],node[i-1][j].pos[1]);
          //          line(node[i][j].pos[0], node[i][j].pos[1], node[i][j-1].pos[0],node[i][j-1].pos[1]);

        }  

        ///draw selected node   
        if (node[i][j].selected==true){
          node[i][j].pos[0]=mouseX;
          node[i][j].pos[1]=mouseY; 
          fill(255,0,110, 100);
          noStroke();
          ellipse(node[i][j].pos[0], node[i][j].pos[1], 20, 20);
          fill(255);
          stroke(255,0,110);
          ellipse(node[i][j].pos[0], node[i][j].pos[1], 10, 10);
          ///display topologic node tolerance
          if (drawNodeDist==true){
            noFill();
            float dim = (1/node[i][j].tol)*nodeDist;
            ellipse(node[i][j].pos[0], node[i][j].pos[1], dim, dim);
          }
        } 
        else{
          ///draw the other nodes         
          if (i==0||j==0||i==numNodesX+1||j==numNodesY+1){
            ///corner nodes - as white
            if  ((i==0&&j==numNodesY+1)||(i==0&&j==0)||(i==numNodesX+1&&j==0)||(i==numNodesX+1&&j==numNodesY+1)){
              fill(255);
            }
            else{
              ///edge nodes - as white
              fill(255);
            }
            noStroke();
            //              ellipse(node[i][j].pos[0], node[i][j].pos[1], 2, 2);
          } 
          else{
            fill(1);
            stroke(1);
            ellipse(node[i][j].pos[0], node[i][j].pos[1], 2, 2);
            ///display topologic node tolerance
            if (drawNodeDist==true){
              if (nodeSelected==true){
                noFill();
                stroke(1,50);
                float dim = (1/node[i][j].tol)*100;
                ellipse(node[i][j].pos[0], node[i][j].pos[1], dim, dim);

                stroke(1,100);
                fill(50,20);
                int iPos = int (selectNode[0]);
                int jPos = int (selectNode[1]);
                float dis = checkDist(node[i][j].pos[0], node[i][j].pos[1], node[iPos][jPos].pos[0], node[iPos][jPos].pos[1]);
                dis = (1/dis*400)*(1/node[i][j].tol); 
                ellipse(node[i][j].pos[0], node[i][j].pos[1], dis, dis);

              } 
              else{
                noFill();
                stroke(1,40);
                ellipse(node[i][j].pos[0], node[i][j].pos[1], nodeDist/2, nodeDist/2);
              }
            }
          }
        }
        ///----------
      }
    }
  }
  //////////////////// END DRAW THE GRID & NODES
  if (instDraw==true) showInst();
}
///----------------------------------------------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////INITIALISE
void createNodeGrid(){
  for (int i=0;i<numNodesX+2;i++){  
    for (int j=0;j<numNodesY+2;j++){
      float xp = float(i);
      float yp = float(j);
      xp = xp*gridDist+(300-((numNodesX+2)*gridDist/2))+gridDist/2;
      yp = yp*gridDist+(300-((numNodesY+2)*gridDist/2))+gridDist/2;
      node[i][j] = new NodeType1(xp,yp,10);

      if (j==1) node[i][j].con1=false;
      if (i==numNodesX) node[i][j].con2=false;
      if (j==numNodesY)node[i][j].con3=false;
      if (i==1) node[i][j].con4=false;
    }
  }
  createGrid=false;
  drawGrid=true;
}

void calcTol(){
  for (int i=0;i<numNodesX+2;i++){  
    for (int j=0;j<numNodesY+2;j++){ 

      if (nodeSelected == true){
        if (node[i][j].selected==false){
          float a = sqrt(sq(i-selectNode[0]));
          float b = sqrt(sq(j-selectNode[1]));
          node[i][j].tol=a+b; 
        }
      }
      else{
        node[i][j].tol=nodeDist;
      }

    }
  }
}

void updateNodePosFromSelected(){
  for (int i=1;i<numNodesX+1;i++){  
    for (int j=1;j<numNodesY+1;j++){ 
      ////////////////////////
      if (nodeSelected == true){
        if (node[i][j].selected==false){
          ////////////////////////
          int iPos = int (selectNode[0]);
          int jPos = int (selectNode[1]);
          float testDist = checkDist(node[i][j].pos[0], node[i][j].pos[1], node[iPos][jPos].pos[0], node[iPos][jPos].pos[1]);
          if (testDist*(1/node[i][j].tol) > nodeDist){
            float tolFact = 0.01*(nodeTol/node[i][j].tol);
            if (testDist < nodeDist){
              node[i][j].pos[0] = node[i][j].pos[0] + (((node[i][j].pos[0]-node[iPos][jPos].pos[0]) * tolFact));
              node[i][j].pos[1]= node[i][j].pos[1] + (((node[i][j].pos[1]-node[iPos][jPos].pos[1]) * tolFact));
            } 
            else {
              node[i][j].pos[0] = node[i][j].pos[0] + (((node[i][j].pos[0]-node[iPos][jPos].pos[0]) * -tolFact));
              node[i][j].pos[1]= node[i][j].pos[1] + (((node[i][j].pos[1]-node[iPos][jPos].pos[1]) * -tolFact));
            }
          }  
          //////////////////////// 
        }
      }
      ////////////////////////
    }
  }
}

void updateNodePosFromGrid(){

  if (settleGrid==true){
    for (int i=1;i<numNodesX+1;i++){  
      for (int j=1;j<numNodesY+1;j++){

        for (int k=0; k<4; k++){

          int n = 0;
          int m = 0;

          if (k==0){
            n= i-1;
            m= j;
          }
          if (k==1){
            n= i-1;
            m= j;
          }
          if (k==2){
            n= i;
            m= j-1;
          }
          if (k==3){
            n= i;
            m= j+1;
          }

          float testDist = checkDist(node[i][j].pos[0], node[i][j].pos[1], node[n][m].pos[0], node[n][m].pos[1]);
          if (testDist < gridDist){
            node[i][j].pos[0] = node[i][j].pos[0] + ((node[i][j].pos[0]-node[n][m].pos[0]) * 0.01);
            node[i][j].poslimbo[1]= node[i][j].pos[1] + ((node[i][j].pos[1]-node[n][m].pos[1]) * 0.01);
          } 
          else {
            node[i][j].pos[0] = node[i][j].pos[0] + ((node[i][j].pos[0]-node[n][m].pos[0]) * -0.01);
            node[i][j].pos[1]= node[i][j].pos[1] + ((node[i][j].pos[1]-node[n][m].pos[1]) * -0.01);
          }
        }

        //////////////////////// 
      }  
    }

  }


}

////////////////////////////////////////////////////////////////////////////////////////DISPLAY
void displayDraw(){
  textFont(font01); 
  fill(50);
  textAlign(RIGHT);
  text(numNodesX, 580, 40);
  text(numNodesY, 580, 80);
  int gDist = int(gridDist);
  text(gDist, 580, 120);
  int nTol = int(nodeTol);
  text(nTol, 580, 160);
}

void showInst(){

  noStroke();
  fill(255, 150);
  rect(0,0,600,600);

  fill(50);
  textAlign(CENTER);
  textFont(font01);
  text("elastic surface", 300, 300);
  text(". . . .", 300, 325);
  textFont(font03);
  text("press g to draw surface", 300, 350);
  text("select and move node with mouse", 300, 370);
  text("press t to view tolerances", 300, 390);
  text("press i to view instructions", 300, 410);
  text("press g to reset", 300, 430);
  text("press r to return", 300, 450);
  textFont(font01);
  text(". . . .", 300, 470);

  textAlign(RIGHT);

  textFont(font02); 
  text("nodes in x", 530, 40);
  textFont(font03);
  text("press x to increase, z to decrease", 530, 50);

  textFont(font02); 
  text("nodes in y", 530, 80);
  textFont(font03);
  text("press q to increase, a to decrease", 530, 90);

  textFont(font02);
  text("distance between nodes", 530, 120);
  textFont(font03);
  text("press o to increase, p to decrease", 530, 130);

  textFont(font02);
  text("node tolerance", 530, 160);
  textFont(font03);
  text("press m to increase, n to decrease", 530, 170);
  text("press t to display", 530, 180);


  if (drawGrid==false){  
    textFont(font01); 
    fill(50);
    textAlign(RIGHT);
    text(numNodesX, 580, 40);
    text(numNodesY, 580, 80);
    int gDist = int(gridDist);
    text(gDist, 580, 120);
    int nTol = int(nodeTol);
    text(nTol, 580, 160);
  }
}

////////////////////////////////////////////////////////////////////////////////////////CLASSES
class NodeType1{
  float[] pos = new float[2];
  float[] poslimbo = new float[2];
  float[] dia = new float[1];

  boolean selected = false;
  float tol = 0;
  boolean con1=true;
  boolean con2=true;
  boolean con3=true;
  boolean con4=true;

  NodeType1(float pX, float pY, float d){
    pos[0] = pX;
    poslimbo[0] = pX;
    poslimbo[1] =pY;
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
  int xNode=0;
  int yNode=0;

  for(int i = 1;i<numNodesX+1; i++){
    for(int j = 1;j<numNodesY+1; j++){
      node[i][j].selected=false;
      float holdDist = checkDist(xPos, yPos, node[i][j].pos[0], node[i][j].pos[1]);
      if (holdDist < tempDist){
        tempDist = holdDist;
        xNode = i;
        yNode = j;
      }
    }
  }
  node[xNode][yNode].selected=true;
  nodeSelected = true;

  float xN = float(xNode);
  float yN = float(yNode);
  selectNode[0]=xN;
  selectNode[1]=yN;

}

////////////////////////////////////////////////////////////////////////////////////////CONTROLS
void  mouseClicked() {
  if (drawGrid==true){
    findNear(mouseX, mouseY);
  }
}

void  keyPressed() {

  if (key == 't'){ 
    if (drawNodeDist==false){
      drawNodeDist=true;
    }
    else{
      drawNodeDist=false;
    }
  }

  if (key == TAB){ 
    for (int i = 0; i<numNodesX+1; i++){
      for (int j = 0; j<numNodesY+1; j++){
        node[i][j].selected = false;
        nodeSelected = false;
      }
    }
  }

  if (key == 'r') {
    instDraw=true;
    dispDraw=false;
    drawGrid=false;
  }

  if (key == 'g') {
    createGrid=true;
    nodeSelected=false;
  }

  if (key == 'i') {
    if (instDraw==true){
      instDraw=false;
    } 
    else{
      instDraw=true;
    }
  }
  if (instDraw==true){
    if (key == 'z') numNodesX--;
    if (key == 'x') numNodesX++;
    if (key == 'q') numNodesY++;
    if (key == 'a') numNodesY--;  
    if (numNodesX<1) numNodesX=1;
    if (numNodesY<1) numNodesY=1;
    if (numNodesX>20) numNodesX=20;
    if (numNodesY>20) numNodesY=20;
  }

  if (key == 'o') gridDist--;
  if (key == 'p') gridDist++;
  if (gridDist<1) gridDist=1; 

  if (key == 'n') nodeTol--;
  if (key == 'm') nodeTol++;
  if (nodeTol<1) nodeTol=1;
  if (nodeDist<1) nodeDist=1;
  if (nodeDist>20) nodeDist=20;
  if (numNodesX<1) numNodesX=1;
  if (numNodesY<1) numNodesY=1;

  if (key =='s'){
    if (settleGrid==false){
      settleGrid=true;
    } 
    else{
      settleGrid=false;
    }
  }
}







