class TrainType1{

  float[] pos = new float[3];
  float[] vec = new float[3];
  int index;
  int winNode;                     ///INDEX OF WINNING (I.E.NEAREST) NODE

  TrainType1(float pX, float pY, float pZ, int ind){
    pos[0] = pX;
    pos[1] = pY;
    pos[2] = pZ;
    vec[0] = pX;
    vec[1] = pY;
    vec[2] = pZ;
    index = ind;
  }

  void display(){
    translate(pos[0],pos[1],pos[2]);
//    stroke(255,0,0,50);
//    fill(255,0,0,50);
//    box(2);
    stroke(0,50);
    strokeWeight(2);
    noFill();
    box(5);
    translate(-pos[0],-pos[1],-pos[2]);
    strokeWeight(1);
  }

  void findWinner(){

    float nearDist=10000;
    int nearNode=0;

    for (int i=0; i<liveNodes; i++){
      int ind = liveNodeInd[i];
      float z = checkDist(pos[0], pos[1], pos[2], node[ind].pos[0], node[ind].pos[1], node[ind].pos[2]);
      if (z<nearDist){
        nearDist=z;
        nearNode=liveNodeInd[i];
      } 
    }
    node[nearNode].winner=true;
    node[nearNode].send=true;
    node[nearNode].receive=false;
    winNode=nearNode;    
  }


  void winnerUpdate(){ 
    for (int i=0; i<3; i++){
      float distMove = pos[i]-node[winNode].pos[i];
      node[winNode].vecLimbo[i] = node[winNode].vecLimbo[i] + distMove*WINLEARN;
      node[winNode].vec[i] = node[winNode].vecLimbo[i];
    }
  }


  void winnerIdent(){  
    //translate(node[winNode].pos[0],node[winNode].pos[1],node[winNode].pos[2]);
    //noStroke();
    //fill(255,0,50,50);
    //box(15);
    //translate(-node[winNode].pos[0],-node[winNode].pos[1],-node[winNode].pos[2]);
  }


}

