void drawWalk() {
  
  int rowMax = dataTableGPS.getRowCount();
  float tempPosX=0;
  float tempPosY=0;

  //////LOOP THROUGH THE DATA AGAIN TO COLLECT THE POSITION DATA
  //////DRAW A LINE BETWEEN THEM
  for (int i=4; i<rowMax; i++) {

    posX = (dataTableGPS.getFloat(i, 3)-lonMin)*SCALEFACTOR;
    posX = posX+(BOARDER/2);
    posY = H-(dataTableGPS.getFloat(i, 2)-latMin)*SCALEFACTOR;
    posY = posY-(BOARDER/2);
   
    
    if (i>4) {
      stroke(255,0,0);
      strokeWeight(1);
      line(tempPosX, tempPosY, posX, posY);
    }

    tempPosX=posX;
    tempPosY=posY;
  }
 
}

