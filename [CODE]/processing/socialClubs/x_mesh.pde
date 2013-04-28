void initializeMesh() {

  int n= 0;
  int faceVal=0;

  for (int i=0; i<mMax; i++) {
    for (int j=0; j<mMax; j++) {
      for (int k=0; k<mMax; k++) {

        float xPos=0;
        float yPos=0;
        float zPos=0;
        boolean edgeNode=false;

        //////////////////////////////////choose pts on the cube face
        if ((i==0) || (i==mMax-1) || (j==0) || (j==mMax-1) || (k==0) || (k==mMax-1)) {

          //////////////////////////////////find edge nodes
          if ((i==0)&&(j==0)) {
            edgeNode=true;
          }
          if ((i==0)&&(j==mMax-1)) {
            edgeNode=true;
          }
          if ((i==mMax-1)&&(j==0)) {
            edgeNode=true;
          }
          if ((i==mMax-1)&&(j==mMax-1)) {
            edgeNode=true;
          }
          ///////////////////////////////////
          if ((i==0)&&(k==0)) {
            edgeNode=true;
          }
          if ((i==0)&&(k==mMax-1)) {
            edgeNode=true;
          }
          if ((i==mMax-1)&&(k==0)) {
            edgeNode=true;
          }
          if ((i==mMax-1)&&(k==mMax-1)) {
            edgeNode=true;
          }
          ///////////////////////////////////
          if ((j==0)&&(k==0)) {
            edgeNode=true;
          }
          if ((j==0)&&(k==mMax-1)) {
            edgeNode=true;
          }
          if ((j==mMax-1)&&(k==0)) {
            edgeNode=true;
          }
          if ((j==mMax-1)&&(k==mMax-1)) {
            edgeNode=true;
          }
          /////////////////////////////////// record cube face to create neighbours
          if (i==0) {
            faceVal=1;
          }
          if (i==mMax-1) {
            faceVal=6;
          }
          if (j==0) {
            faceVal=2;
          }
          if (j==mMax-1) {
            faceVal=5;
          }
          if (k==0) {
            faceVal=3;
          }
          if (k==mMax-1) {
            faceVal=4;
          }

          xPos = (i*spaceDim)-offSet;
          yPos = (j*spaceDim)-offSet;
          zPos = (k*spaceDim)-offSet; 

          if (edgeNode==false) {
            if (mReset== false) {
              mNode[n]=new meshNodeType(xPos, yPos, zPos,faceVal);
              memNode[n]=new meshMemNodeType(xPos, yPos, zPos);
            }
            else {
              mNode[n].pos.x = xPos;
              mNode[n].pos.y = yPos;
              mNode[n].pos.z = zPos;
              mNode[n].posLimbo = mNode[n].pos;
            }
            n=n+1;
          }
        }
      }
    }
  }
}


void meshDefine() {  
  int k=0;
  for (int i =0; i <noMeshNodes; i++) {
    for (int j=0; j <noMeshNodes; j++) {
      float dis = checkDist(mNode[i].pos, mNode[j].pos);
      if (dis == sqrt(sq(spaceDim)*2)) {
        if ( mNode[i].cubeFace != mNode[j].cubeFace) {
          mNode[i].neigh[k]=j;
          k=k+1;
        }
      }  
      if (dis==spaceDim) {
        mNode[i].neigh[k]=j;
        k=k+1;
      }
    }
    k=0;
  }
}

void meshDraw() {
  for (int i =0; i <noMeshNodes; i++) {
    mNode[i].display();
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class meshNodeType {

  PVector pos;
  PVector posLimbo;
  int cubeFace;
  int target;

  int[] neigh = new int [4];

  meshNodeType(float posX, float posY, float posZ, int faceVal) {
    pos = new PVector(posX,posY,posZ);    
    cubeFace = faceVal;
  }

  void display() {

    float cRef=COUNT/5;
    if (cRef<0) {
      cRef=0;
    }
    if (cRef>70) {
      cRef=70;
    }

    PVector colRef = new PVector(0,0,0);

    if (meshOn==true) {
      switch(ACTIVELOOP) {
      case 0:
        colRef.set(0,174,239);
        break;
      case 1:
        colRef.set(236,0,140);
        break;
      case 2:
        colRef.set(255,242,0);
        break;
      case 3:
        colRef.set(154,202,60);
        break;
      case 4:
        colRef.set(247,148,30);
        break;
      }

      stroke(colRef.x,colRef.y,colRef.z,cRef);

      for (int i=0; i<4; i++) {
        line(pos.x, pos.y, pos.z, mNode[neigh[i]].pos.x, mNode[neigh[i]].pos.y, mNode[neigh[i]].pos.z);
      }
      point(pos.x, pos.y, pos.z);
    }
  }

  void attract() {

    posLimbo=pos;
    float minDis=100000;
    //////////////////////////////select nearest loop only for attract repel///////////////////////   
    for (int i=0; i<noLoopsType; i++) {
      if (loops[i].show==true) {       
        float tempDis=pos.dist(loops[i].pv);
        if (tempDis<minDis) {
          minDis=tempDis;
          target=i;
        }
      }
    }
    ////////////////////////////////////////////////////////////////////////////      
    PVector tVec = PVector.sub(pos,loops[target].pv);
    float dis = pos.dist(loops[target].pv);

    if (dis>(loops[target].tem * 2)) {
      tVec.mult(ATTRACT);
    } 
    else {
      tVec.mult(REPEL);
    }

    posLimbo.add(tVec);
  }

  void tension() {

    PVector cVec = PVector.add(mNode[neigh[0]].pos,mNode[neigh[1]].pos);
    cVec.add(mNode[neigh[2]].pos);
    cVec.add(mNode[neigh[3]].pos);

    cVec.div(4);

    PVector tempVec = PVector.sub(cVec, pos);

    tempVec.mult(TENSION);
    posLimbo.add(tempVec);

    float dis =  posLimbo.dist(tempVec);
  }
}

////////////////////////////////////////////////////record the initial position of the mesh

class meshMemNodeType {
  PVector pos;

  meshMemNodeType(float posX, float posY, float posZ) {
    pos = new PVector(posX,posY,posZ);
  }
}


