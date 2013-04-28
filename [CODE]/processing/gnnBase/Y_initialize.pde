void initializeTps(){
  for (int i=0;i<numTrPts;i+=1){
    trainPt[i] = new TrainType1(random(-H/2,H/2),random(-H/2,H/2),random(-H/2,H/2), i);
  }
}

void initializeNetwork(){
  for (int i=0;i<numNodes;i+=1){  
    liveNodeInd[i] = i;
    node[i] = new NodeType1(random(-H/6,H/6),random(-H/6,H/6),random(-H/6,H/6));
    //    ///TEST NODE INDEXING WITH RANDOM ALIVE STATUS
    //    float z = random(0,1);
    //    if (z<0.2){
    //      node[i].alive=false;
    //    }
    //    ///TEST NODE INDEXING WITH RANDOM ALIVE STATUS
  }
}

