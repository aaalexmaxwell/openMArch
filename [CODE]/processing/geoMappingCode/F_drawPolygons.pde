void drawPoly() {
  
  int rowMax = dataTablePoly.getRowCount();
  int colMax = dataTablePoly.getColumnCount();
    
  float tempPosX=0;
  float tempPosY=0;
   
  for (int j=0; j<rowMax; j++) {

    tempPosX = (dataTablePoly.getFloat(j, 1)-lonMin)*SCALEFACTOR;
    tempPosX = tempPosX+(BOARDER/2);
    tempPosY = H-(dataTablePoly.getFloat(j, 2)-latMin)*SCALEFACTOR;
    tempPosY = tempPosY-(BOARDER/2);
  
    for (int i=4; i<colMax; i=i+3) {
  
      posX = (dataTablePoly.getFloat(j, i)-lonMin)*SCALEFACTOR;
      posX = posX+(BOARDER/2);
      posY = H-(dataTablePoly.getFloat(j, i+1)-latMin)*SCALEFACTOR;
      posY = posY-(BOARDER/2);

      stroke(255,255,0);
      strokeWeight(1);
      line(tempPosX, tempPosY, posX, posY);
  
      tempPosX=posX;
      tempPosY=posY;
    }

  }

 
}

