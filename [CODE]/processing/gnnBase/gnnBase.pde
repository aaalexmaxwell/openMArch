//things to be done...
//
//insert delete node function - check that it works
//fix winner routine in training points [nodes should only be able to be  winner of one node - refer to vba thesis code]
//txt file input - read training points data from txt file - as would be provided from a dxf export.
//training points adjuster - so that training points fit within 600x600x600 frame, with 0,0,0, as centre 
//clean up code so that in can be used generically - dimensions, nearDists, tolerances etc. 

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////
import processing.dxf.*;
import processing.pdf.*;

int H = 600;
int W = 600;

boolean record;
boolean runStep;
boolean runCon;
boolean filePdf = true;
boolean fileDxf = false;

String fileIndex;

float rotX;                        ///USED IN 'MOUSE DRAG' ROUTINE
float rotY;                        ///USED IN 'MOUSE DRAG' ROUTINE

//int MAXLOOP = 20;                ///NOT NEEDED WHEN gnnMain IS CALLED FROM draw LOOP
float WINLEARN = 0.4;              ///LEARNING PARAMETER
float OTHERLEARN = 0.4;            ///LEARNING PARAMETER
int LEARNINGRADIUS = 10;           ///FOR INFORMING NEIGHBOURHOOD
//float TOPO_LOOP = 1;               ///FOR INFORMING NEIGHBOURHOOD
//float TOPO_LOOP_FACTOR = 0.9;      ///FOR INFORMING NEIGHBOURHOOD
int TOL = 10;                      ///PROXIMITY OF NEIGHBOURING NODE USED TO DETERMINE ALIVE/ DEAD
int KEY_COUNT = 0;

int numTrPts = 10;
TrainType1[] trainPt = new TrainType1[numTrPts];

int numNodes = 50;                       ///THIS IS A RUNNING TOTAL OF ALL NODES USED, FOR INDEXING PURPOSES OF NEW BORN NODES
int liveNodes=numNodes;                  ///THIS IS A RUNNING TOTAL OF ALL LIVE NODES
NodeType1[] node = new NodeType1[numNodes];

int liveNodeInd[] = new int[numNodes];   ///THIS IS A INDEX OF ALL LIVING NODES

////////////////////////////////////////////////////////////
void setup(){
  size(H, W, P3D);
  frameRate(30);
//smooth();

  initializeTps();
  initializeNetwork();                               
  liveNodeUpdate();

  for(int i=0; i<liveNodes; i++){
    node[liveNodeInd[i]].defineNet(); 
  }

}

////////////////////////////////////////////////////////////
void gnnMain (){

  for(int j=0; j<numTrPts; j++){
    trainPt[j].findWinner();
    trainPt[j].winnerUpdate();          
  } 

  int tRad=LEARNINGRADIUS;
  while (tRad>0){
    ;
    for(int j=0; j<liveNodes; j++){
      int index=liveNodeInd[j];
      node[index].broadcast();
    }  
    for(int j=0; j<liveNodes; j++){
      int index=liveNodeInd[j];
      for (int k=0; k<3; k++){
        node[index].vec[k]=node[index].vecLimbo[k];
      }
      node[index].send=node[index].sendLimbo;
      node[index].receive=node[index].receiveLimbo;
    }
    tRad=tRad-1;
  }

  //    for(int j=0; j<liveNodes; j++){ 
  //      int index=liveNodeInd[j];
  //        println("---");
  //        println(node[index].winner);         
  //        println(node[index].send);      
  //        println(node[index].receive);   
  //        println("---");   
  //    }

  for(int j=0; j<liveNodes; j++){ 
    int index=liveNodeInd[j];
    node[index].nodeMove();         
    node[index].defineNet();
    node[index].clearDate();
  }

  liveNodeUpdate();
}


////////////////////////////////////////////////////////////
void draw(){
  
  if (runStep == true){
    gnnMain();
    KEY_COUNT++;
    runStep = false;
  }
  
  if (runCon == true){
    gnnMain();
    KEY_COUNT++;
  }
  
  
  if (fileDxf == true){
    if (record) {
      fileName();
      beginRaw(DXF, fileIndex);
    }
  }
  
    if (filePdf == true){
    if (record) {
      fileName();
      beginRaw(PDF, fileIndex);
    }
  }

  cursor(CROSS);

  pushMatrix();

  ///translate(width/2, height/2, -1000);
  translate(0, 0, -30000);
  rotateX(rotY);
  rotateY(rotX); 
  scale(30.0);

//  background(220,230,240);
  background(255);
  enviroDraw();

  for (int i=0; i<numTrPts; i++){
    trainPt[i].display();
    trainPt[i].winnerIdent();
  }
  for (int i=0;i<numNodes; i++){
    node[i].display();
  }

  popMatrix();
  
  if (record) {
    endRaw();
    record = false;
  }
  
  statusBar();

}

///////////////////////////////   
void liveNodeUpdate(){

  //  int numNodesTemp1=numNodes;      ///A COPY OF THE ORIGINAL TOTAL NODES LIST
  int liveNodesTemp=0;               ///A HOLDER FOR THE NEW TOTAL

  //CALCULATE THE NEW TOTAL OF LIVE NODES
  for (int i=0; i<numNodes; i++){
    if (node[i].alive==true){
      liveNodesTemp++;
    }
  }

  //AMEND THE LENGTH OF THE LIVE NODES ARRAY TO SUIT THE NEW TOTAL
  int test=liveNodes-liveNodesTemp; //TEST IS THE DIFFERENCE BETWEEN THE OLD TOTAL AND THE NEW TOTAL

  if (test!=0){
    if (test<0){
      test*=-1;
      for (int i=0; i<(test); i++){
        shorten(liveNodeInd);
      }
    } 
    else {
      liveNodeInd=expand(liveNodeInd,liveNodesTemp);
    }
  }

  //FILL THE LIVE NODES ARRAY WITH INDEX OF LIVING NODES
  int index=0;

  for (int i=0; i<numNodes; i++){
    if (node[i].alive==true){
      liveNodeInd[index]=i;
      index++;
    }
  }
  //UPDATE RUNNING TOTAL OF LIVE NODES
  liveNodes=liveNodesTemp;

}
///////////////////////////////   


