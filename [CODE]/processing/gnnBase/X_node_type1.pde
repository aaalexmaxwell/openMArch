class NodeType1{

  float[] pos = new float[3];              ///position
  int neighTot = 4;                        ///total no. of neighbours
  int[] neigh = new int[neighTot];         ///list of neighbours
  float[] vec = new float[3];              ///vectors
  float[] vecLimbo = new float[3]; 
  //  float[] transmission = new float[3];     ///message

  boolean send = false;
  boolean sendLimbo = false;
  boolean receive = true;
  boolean receiveLimbo = true;
  boolean winner = false;
  boolean alive = true;
  boolean newborn = false;

  NodeType1(float pX, float pY, float pZ){
    pos[0] = pX;
    pos[1] = pY;
    pos[2] = pZ;
    //    vec[0]= pX;
    //    vec[1]= pY;
    //    vec[2]= pZ;
  }

  void display(){ 
    if (alive == true){
      translate(pos[0],pos[1],pos[2]);
      stroke(255,0,50,5);
      stroke(255,0,50,5);
      strokeWeight(2);
      box(4);
      translate(-pos[0],-pos[1],-pos[2]);
      for(int j =0; j<neighTot;j++){
        int p = neigh[j];
//        stroke(195,255,0);
        stroke(255,0,50,20);
        strokeWeight(2);
        line(pos[0], pos[1], pos[2], node[p].pos[0], node[p].pos[1], node[p].pos[2]);
        strokeWeight(1);
        
      }
    }
  } 

  void defineNet(){  

    if (alive==true){

      float[] dists = new float[liveNodes];  /// ORIGINAL ARRAY
      float[] sortDists = new float[liveNodes];  /// SORTED ARRAY
      float[] origDists = new float[liveNodes];  /// COPY OF ORIGINAL ARRAY

      for (int j =0; j<liveNodes; j++){
        int ind = liveNodeInd[j];
        dists[j] = checkDist(pos[0],pos[1],pos[2], node[ind].pos[0], node[ind].pos[1], node[ind].pos[2]);
      }

      arraycopy(dists, origDists); 
      dists = sort(dists);
      arraycopy(dists, sortDists);  

      for (int k=0; k< neighTot; k++){
        for (int m=0; m<liveNodes; m++){
          if (origDists[m] == sortDists[k+1]){
            neigh[k]=liveNodeInd[m];
          }
        }
      }
    } 
  }

  void broadcast(){

    if (send==true){

      for (int i=0; i<neighTot; i++){
        int index = neigh[i];
        if (node[index].receive==true){
          for (int j=0; j<3; j++){
            node[index].vecLimbo[j]=node[index].vecLimbo[j]+((vec[j]-pos[j])* OTHERLEARN);
            //            node[index].vecLimbo[j]= node[index].vecLimbo[j]+ (vec[j] * OTHERLEARN);
          }
          sendLimbo = true;
          receiveLimbo = false;
        }
      }
      sendLimbo=false;
      receiveLimbo=false;
    } 

  }

  void nodeMove(){
    for (int i=0; i<3; i++){
      pos[i]=pos[i]+vec[i];
    }
  }

  void clearDate(){
    for (int i=0; i<3; i++){
      vecLimbo[i]=0;
      vec[i]=0;
    }
    winner=false;
  }

}


