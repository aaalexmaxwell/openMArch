
class teamType1{
  
  int name;
  int numZones;   
  String dataLoc;
  String [] simData;
  String data [] [];
  int xDim;
  int yDim;
  String startDay;
  String startMonth;
  float avTemp;
  
/////////////////////////////////////////////////
  teamType1(int id){
    name=id;
  }
/////////////////////////////////////////////////

/////////////////////////////////////////////////
  void displayYearCircle(int time){
   
    float cenX = (name*300)+150;
    float cenY = h - 150;
    float posX = cenX;
    float posY = cenY;
    float r = 0;
    float rD = 0;
    
    for (int i=0; i<numZones; i++){
      int startInd = ((int(startMonth)-1)*30)+ int(startDay);
      
      for (int j=time; j<yDim-1; j=j+24){  
          float tempInt = int(data[j] [i+4]);
          r = (i*5)+5;
          r= r+ +(tempInt);
          rD = (((j/24)+startInd)/(180/PI))- (PI/2);

          posX=cenX +r*(cos(rD));
          posY=cenY +r*(sin(rD));
      
          noStroke();
          fill(355-((tempInt-20)*10),200 -((tempInt-20)*10), 0, 100);
          ellipse(posX, posY, 10, 10);  
      }
    }
  }
/////////////////////////////////////////////////
  void displayYearGraph(int time){
    
    int posX = 150+ (name*300);
    int posY = 0;
    
    int dayCount = 0;
    avTemp = 0;
    
    for (int j=time; j<yDim-1; j=j+24){ 
        ///the spacing between the bars of the graph
        posY=posY+2;
        
        int tempInt = int(data[j] [4]);
        int tempExt = int(data[j] [1]);
        float dif =(tempInt - tempExt)*2; 

        ///display internal temps
        strokeWeight(1);
        if (tempInt>22){
          stroke(255, 255-(tempInt-15)*10,0);
          line(posX+tempInt,posY,posX-tempInt,posY);
        }
        if (tempInt<18){
          stroke(0,255,255);
          line(posX+tempInt,posY,posX-tempInt,posY);
        }
        ///display external temps
        if (tempExt>18){
          stroke(0,250,0);
          line(posX+tempExt,posY,posX-tempExt,posY);
        }
        if (tempExt<14){
          stroke(0,(tempInt-15)*10,255);
          line(posX+tempExt,posY,posX-tempExt,posY);
        }
        
        ///calculate the average temperature
        avTemp = avTemp + float(data[j] [4]);
        dayCount++;
    }
    avTemp = avTemp/dayCount;
  }
  
/////////////////////////////////////////////////
  void loadSimData(){
    simData = loadStrings (dataLoc);
  }
/////////////////////////////////////////////////
  void sortData(){
  
    ///add data to a 2D array - THIS TAKES THE OUTSIDE TEMPERATURE AND THE FIRST COLUMN OF FLOOR DATA
    String []tempXLen = split(simData[1],',');
    xDim = tempXLen.length;
    yDim = simData.length; 
  
    String sortData [] [] = new String [yDim-1] [xDim];
    data = sortData;

    for (int j=0; j<yDim-1; j++){ 
      String []tempX = split(simData[j+1],','); 
      for (int i=0; i<xDim; i++){
        sortData [j] [i] = tempX[i];
      } 
    }
  
    ///calculate the number of zones based on the x dim of the csv table 
    ///based on always 4 columns before the first column containing floor data 
    numZones = xDim - flrCalc;
      
    ///calculate the start date of the simulation
    startMonth = sortData [0] [0].substring(1,3); 
    startDay = sortData [0] [0].substring(4,6); 

  }
  
  void update(){
    dataLoc = baseFolderLoc + tweetCollector.teamName[name] + "\\" +  tweetCollector.sketchName[name] + "\\" + "data" + "\\" + "simData.csv";
  }

  
}


