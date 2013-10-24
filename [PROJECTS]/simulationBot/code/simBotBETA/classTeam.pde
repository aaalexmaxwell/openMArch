
class teamType1{
  
  int name;
  int numZones;   
  //String dataLoc = "C:\\Users\\plangley\\Dropbox\\WORKSHOP\\teamName\\sketchName\\sim\\test.csv";
  //String dataLoc = baseFolderLoc + teamName + "\\" + sketchName + "\\" + "sim\\test.csv";
  String dataLoc = "C:\\Users\\plangley\\Documents\\[PHIL]\\GitHub\\openPHD\\[PROJECTS]\\simulationBot\\code\\simBotBETA\\data\\test.csv";
  String [] testForData;
  String [] simData;
  String data [] [];
  int xDim;
  int yDim;
  String startDay;
  String startMonth;
  float avTemp;
  
/////////////////////////////////////////////////CONSTRUCTOR
  teamType1(int id){
    name=id;
  }  
/////////////////////////////////////////////////CONSTRUCTOR
/////////////////////////////////////////////////
/////////////////////////////////////////////////GRAPHING DATA
  void displayYearCircleGraph(int time){
    strokeCap(SQUARE);
    if (testForData!= null){
      if (simData.length>0){
        //////////////////
        float cenX = (name*300)+150;
        float cenY = 200;
        float posX = cenX;
        float posY = cenY;
        float r = 0;
        float rD = 0;
        
        for (int i=0; i<1; i++){
          float tempPtsX[] = new float[365];
          float tempPtsY[] = new float[365];
          float tempPtsX2[] = new float[365];
          float tempPtsY2[] = new float[365];
          float colInd[] = new float[365];
          
          int startInd = ((int(startMonth)-1)*30)+ int(startDay);
          /////////////////draw  lines
          for (int j=time; j<yDim-1; j=j+24){  
            
            float tempInt = int(data[j] [i+5]);
            r =100;

            ////collect data for the blobs
            float tempRad1 = r; // -(tempInt*2);
            float tempRad2 = r +((tempInt*tempInt)/10);
            tempPtsX2[j/24]=cenX +tempRad2*(cos(rD));
            tempPtsY2[j/24]=cenY +tempRad2*(sin(rD));
            tempPtsX[j/24]=cenX +tempRad1*(cos(rD));
            tempPtsY[j/24]=cenY +tempRad1*(sin(rD));
            colInd[j/24] = tempInt;
            
            ///calculate radial data
            r= r +(tempInt);
            rD = (((j/24)+startInd)/(180/PI))- (PI/2);
            posX=cenX +r*(cos(rD));
            posY=cenY +r*(sin(rD));
  
          }

          noStroke();
          for (int k=1; k<364; k++){
            fill(255, 355-(colInd[k]-15)*10,0,100);
            noStroke();
            triangle(tempPtsX2[k], tempPtsY2[k],tempPtsX2[k+1], tempPtsY2[k+1], cenX, cenY);
          }
          for (int k=1; k<364; k++){
            fill(255);
            strokeWeight(1);
            stroke(255);
            triangle(tempPtsX[k], tempPtsY[k],tempPtsX[k+1], tempPtsY[k+1], cenX, cenY);
          }

          for (int k=1; k<364; k++){ 
            strokeWeight(2); 
            stroke(255, 355-(colInd[k]-15)*10,0);
            line(tempPtsX[k], tempPtsY[k],tempPtsX[k+1], tempPtsY[k+1]);
//            strokeWeight((mouseY/10)+1);
            strokeWeight(2);
            line(tempPtsX2[k], tempPtsY2[k],tempPtsX2[k+1], tempPtsY2[k+1]);
//            stroke(255, 355-(colInd[k]-15)*10,0); 
//            fill(255, 355-(colInd[k]-15)*10,0); 
//            ellipse(tempPtsX2[k], tempPtsY2[k],mouseY/20,mouseY/20);
//            strokeWeight(1);   
          }
          fill(sun.posY+65, sun.posY+65, sun.posY+65);
//          strokeWeight(1); 
//          stroke(sun.posY-10, sun.posY-10, sun.posY-10);
          noStroke();
          ellipse(cenX, cenY, 199,  199);
          
        }

       ////////////////// 
      }
    }
    
  }

/////////////////////////////////////////////////GRAPHING DATA
  void displayAverageSq(int time){
    strokeCap(ROUND);
    if (testForData!= null){
      if (simData.length>0){  
        
        ////////////////// 
        int cardWidth = 200;
        int basePosX = 100+(name*300);
        int posY = 0;
        int nPosX = 0;
        int [] tempInt = new int [365];   
        int ySpace = (mouseY/20)+1;  
        int ySpaceTempInt = 0;
        int count = 0;
        
        for (int i = 0; i<numZones; i++){
          nPosX = basePosX+(i*(cardWidth/numZones));
          posY=0;
          ///collect 1 year of data forthe specified hour
          count = 0;
          for (int j=time; j<yDim-1; j=j+24){
            tempInt [count] = int(data[j] [5+i]);
            count++;
          }
          
          int tempIndex = 0;
          ///calculate average temp for ySpace interval
          ///loop through each days data
          for (int m=0; m<365/ySpace; m++){
//            println("M- " +m);
            int tempTemp = 0;
            
            for (int  n=0; n<ySpace; n++){
              tempIndex = (m*ySpace)+n;
//              println(tempIndex);
              tempTemp = tempTemp + tempInt [tempIndex];
            }
            tempTemp = tempTemp/ ySpace;
//            println("tempTemp - "+ tempTemp);

            noStroke();
            rectMode(CORNER);
            if (tempTemp>22){
              fill(255, 355-(tempTemp-15)*10,0);
              rect(nPosX, posY, (cardWidth/numZones), (ySpace*2));
            }
            if (tempTemp<18){
              fill(0,255,255);
              rect(nPosX, posY, (cardWidth/numZones), (ySpace*2));
            }
            posY=posY+(ySpace*2);
            //////////////////////////////////////////////
          }

        }
        //////////////////
      }
    }
  }
/////////////////////////////////////////////////GRAPHING DATA
  void displayDots(int time){
    strokeCap(ROUND);
    if (testForData!= null){
      if (simData.length>0){
        //////////////////
        float cenX = (name*300)+150;
        float cenY = 200;
        float posX = cenX;
        float posY = cenY;
        float r = 0;
        float rD = 0;
        
        for (int i=0; i<numZones; i++){
          int startInd = ((int(startMonth)-1)*30)+ int(startDay);
          
          for (int j=time; j<yDim-1; j=j+24){  
              float tempInt = int(data[j] [i+5]);
              r = (i*9)+50;
//              r= r +(tempInt);
              rD = (((j/24)+startInd)/(180/PI))- (PI/2);
    
              posX=cenX +r*(cos(rD));
              posY=cenY +r*(sin(rD));
          
//              noStroke();
//              fill(355-((tempInt-20)*10),200 -((tempInt-20)*10), 0, 100);
//              ellipse(posX, posY, 10, 10);  

            noStroke();
//            noFill();
            if (tempInt>22){
              fill(255, 355-(tempInt-15)*10,0, 100);
              ellipse(posX, posY, 10, 10);
            }
            if (tempInt<18){
              fill(0,255,255, 100);
              ellipse(posX, posY, 10, 10);
            }

          }
        }
       ////////////////// 
      }
    }
  }
/////////////////////////////////////////////////GRAPHING DATA
  void displayExtTempGraph(int time){
    strokeCap(SQUARE);
    if (testForData!= null){
      if (simData.length>0){   
        ////////////////// 
        int posX = 200 + (name*300);
        int posY = 0;
        
        int dayCount = 0;
        avTemp = 0;
        
        for (int j=time; j<yDim-1; j=j+24){ 
            ///the spacing between the bars of the graph
            posY=posY+2;
            
            int tempInt = int(data[j] [5]);
            
            int tempExt = int(data[j] [1]);
            float dif =(tempInt - tempExt); 
    
            ///display internal temps
//            strokeWeight(1);
// 
//            if (tempInt>22){
//              stroke(255, 355-(tempInt-15)*10,0);
//              line(posX+tempInt,posY,posX-tempInt,posY);
//            }
//            if (tempInt<18){
//              stroke(0,255,255);
//              line(posX+tempInt,posY,posX-tempInt,posY);
//            }
            
            ///display external temps
            //strokeWeight((mouseY/20)+1); 
            strokeWeight(1); 
            if (tempExt>18){
              stroke(0,250,0);
              line(posX+tempExt,posY,posX-tempExt,posY);
            }
            if (tempExt<14){
              stroke(0,(tempInt-15)*10,255);
              line(posX+tempExt,posY,posX-tempExt,posY);
            }
        }
        //////////////////
      }
    }
  }
  /////////////////////////////////////////////////GRAPHING DATA
    void displayAverageCirc(int time){
    if (testForData!= null){
      if (simData.length>0){  
        
        ////////////////// 
        int [] tempIn = new int [365];   
        int ySpace = (mouseY/60)+1;  
        int ySpaceTempInt = 0;
        int count = 0;
        
        float cenX = (name*300)+150;
        float cenY = 200;

        float r = 0;
        float rD = 0;
        int startInd = ((int(startMonth)-1)*30)+ int(startDay);
        
        ///collect 1 year of data forthe specified hour
        count = 0;
        for (int j=time; j<yDim-1; j=j+24){
          tempIn [count] = int(data[j] [5]);
          count++;
        }
        
        int tempIndex = 0;
        ///calculate average temp for ySpace interval
        ///loop through each days data
          for (int m=0; m<365/ySpace; m++){
            int tempTemp = 0;     
            for (int  n=0; n<ySpace; n++){
              tempIndex = (m*ySpace)+n;
              tempTemp = tempTemp + tempIn [tempIndex];
            }
            tempTemp = tempTemp/ ySpace;
            //////////////////////////////////////////////
            float tempPtsX[] = new float[365/ySpace];
            float tempPtsY[] = new float[365/ySpace];
            float tempPtsX2[] = new float[365/ySpace];
            float tempPtsY2[] = new float[365/ySpace];
            float colInd[] = new float[365/ySpace];
            /////////////////draw  lines     
            r =50;
            ////collect data for the blobs
            rD = (((tempIndex)+startInd)/(180/PI))- (PI/2);
            float tempRad1 = r + (float(tempTemp)*4);
            tempPtsX[m]=cenX +tempRad1*(cos(rD));
            tempPtsY[m]=cenY +tempRad1*(sin(rD));
            
//            float tempRad2 = r -(tempInt);
//            tempPtsX2[m]=cenX +tempRad2*(cos(rD));
//            tempPtsY2[m]=cenY +tempRad2*(sin(rD));
            
            strokeWeight((mouseY/20)+1);
            stroke(255,355-(tempTemp*10),0);
            line(cenX, cenY,tempPtsX[m], tempPtsY[m]);
            
//            noFill();
//            strokeWeight(1);
//            stroke(200,255,0);
//            ellipse(cenX, cenY, 2*(r+36), 2*(r+36));
//            ellipse(cenX, cenY, 2*(r+44), 2*(r+44));
            
            noStroke();
            fill(sun.posY+70, sun.posY+70, sun.posY+70);
            ellipse(cenX, cenY, 50, 50);
          }
        }
      } 
    }
/////////////////////////////////////////////////DATA LOADING AND SORTING  
/////////////////////////////////////////////////DATA LOADING AND SORTING
    void loadSimData(){
      testForData = loadStrings (dataLoc);
      println(dataLoc);
      if (testForData!= null){
        simData = loadStrings (dataLoc);
      }
    }
  /////////////////////////////////////////////////DATA LOADING AND SORTING
    void sortData(){
      if (testForData!= null){  
        if (simData.length>0){
          //////////////////
          ///add data to a 2D array - THIS TAKES THE OUTSIDE TEMPERATURE AND THE FIRST COLUMN OF FLOOR DATA
          String []tempXLen = split(simData[1],',');
          xDim = tempXLen.length;
          yDim = simData.length; 
        
          String sortData [] [] = new String [yDim-1] [xDim];
          data = sortData;
          
          ///calculate the number of zones based on the x dim of the csv table 
          ///based on always 5 columns before the first column containing floor data 
          ///and the spreadsheet containing 6 pieces of information about each zone
          numZones = ((xDim-1)-5)/6;
          //println("XDIM....." + xDim);
          //println("NUMZONES....." + numZones);
      
          for (int j=0; j<yDim-1; j++){ 
            String []tempX = split(simData[j+1],','); 
            for (int i=0; i<xDim; i++){
              sortData [j] [i] = tempX[i];
            } 
          }
          //println(sortData [0] [5]);
          ///calculate the start date of the simulation
          startMonth = sortData [0] [0].substring(1,3); 
          startDay = sortData [0] [0].substring(4,6); 
          
        ////////////////// 
        }else{
          String sortData [] [] = new String [1] [1];
          data = sortData;
        }
        //////////////////
      }
  }

/////////////////////////////////////////////////DATA LOADING AND SORTING
  void update(){
    dataLoc = baseFolderLoc + tweetCollector.teamName[name] + "\\" +  tweetCollector.sketchName[name] + "\\" + "sim" + "\\" + "test.csv";
  }
/////////////////////////////////////////////////DATA LOADING AND SORTING
}

