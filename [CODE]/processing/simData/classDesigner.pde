class teamType1{
  
  String name;
  
  int numFloors;
  int numZones;   

  String [] simData;
  int xDim;
  int yDim;
  String data [] [];
  String startDay;
  String startMonth;
  float avTemp;
/////////////////////////////////////////////////
  teamType1(String id){
    name=id;
  }
/////////////////////////////////////////////////
void displayID(){
   int posX = 0;
   int posY = 0;
   fill(0);
   textFont(smallText);
   textAlign(LEFT);
   text("   zone-"+activeZone, 50, h-10);
}
/////////////////////////////////////////////////
void displayGrid(int time, int active){
  int posX=0;
  int posY=0;
  int pos2X = 0;
  int pos2Y = 0;
  
  for (int i=0; i<numZones; i++){
    for (int j=time; j<yDim-1; j=j+24){  
      float tempInt = int(data[j] [i+4]);
      posX = 50+(i*10);
      posY = ((j/24)*1);
      fill(255, 255-(tempInt*10), 0);
      noStroke();
      rect(posX, posY, 10,1);
    }
  }
  
//  for (int i=0; i<numZones-1; i++){
//    for (int j=time; j<yDim-1; j=j+24){  
//      int index = i+4;
//      float tempInt = int(data[j] [index]);
//      float temp2Int = int(data[j] [index+1]);
//      posX = 50+(i*30);
//      posY = ((j/24)*1);
//      pos2X = posX+30;
//      pos2Y  = posY;
//      if (tempInt>temp2Int){
//        fill(255, tempInt*4, 0);
//        noStroke();
//        rect(posX, posY, 30,1);
//      }else{
//        fill(tempInt*4,255, 0);
//        noStroke();
//      }
//      rect(posX, posY, 30,1);
//    }        

//  }
  
}
/////////////////////////////////////////////////
  void displayYearCircle(int time, int active){
   
    float cenX = w/2;
    float cenY = h/2;
    float posX = cenX;
    float posY = cenY;
    float r = 0;
    float rD = 0;

    for (int i=0; i<numZones; i++){

      for (int j=time; j<yDim-1; j=j+24){  
        
          float tempInt = int(data[j] [i+4]);
          r = i*30;
          r= r+ +(tempInt);
          rD = (j/24)/(180/PI);
          posX=cenX +r*(cos(rD));
          posY=cenY +r*(sin(rD));
//          stroke(255,255-((tempInt-20)*10), 0, 250);
//          fill(255,255-((tempInt-20)*10), 0, 100);
          fill(255-((tempInt-20)*10),150-((tempInt-20)*10), 0, 100);
          ellipse(posX, posY, 33, 33); 
 
      }
    }
  }
/////////////////////////////////////////////////
  void displayTemps(int time, int active){
    int posX = 85 + ( 2*(((int(startMonth)-1)*30)+int(startDay)));
    int posY = h/2;
    
    int liveZone = activeZone+4;

    for (int j=time; j<yDim-1; j=j+24){ 
      posX=posX+2;
      noStroke();
      int tempInt = int(data[j] [liveZone])*2;
      int tempExt = int(data[j] [1])*2;
      fill(150,255,0);
      ellipse(posX,posY-tempExt,2,2);
      ellipse(posX,posY+tempExt,2,2);
      fill(0,255,0);
      ellipse(posX,posY-tempInt,2,2);
      ellipse(posX,posY+tempInt,2,2);
    }
  }

/////////////////////////////////////////////////
  void displayYearElevation(int time, int active){
    int posX = 85 + ( 2*(((int(startMonth)-1)*30)+int(startDay)));
    int posY = h/2;
    int liveZone = activeZone+4;
    int dayCount = 0;
    avTemp = 0;
    
    println(activeZone);
    println(liveZone);
    
    for (int j=time; j<yDim-1; j=j+24){ 
      
        float dif = int(data[j] [liveZone])- int(data[j] [1]);
        ///the spacing between the bars of the graph
        posX=posX+2;
        
        println(activeZone);
        println(liveZone);
       
        stroke(70);
        strokeWeight(1);
        line(posX,posY+dif,posX,posY-dif);
        strokeWeight(1);
        
        if ((dif/2)<8){
          stroke(0,150,255);
          line(posX,posY+dif,posX,posY-dif);
        }
        if (int(data[j] [4])>30){
          stroke(255,0,0);
          line(posX,posY+dif,posX,posY-dif);
        }
        
        avTemp = avTemp + float(data[j] [4]);
        dayCount++;
    }
    avTemp = avTemp/dayCount;
  }
/////////////////////////////////////////////////
  void loadSimData(){
    
   String fileName = "simDataX" + name + ".csv" ;
    while (simData == null){
      println(simData);
      simData = loadStrings (fileName);//("simData.csv");
    }
//    println (">>updated");
  }
/////////////////////////////////////////////////
  void sortData(){

    ///add data to a 2D array - THIS TAKES THE OUTSIDE TEMPERATURE AND THE FIRST COLUMN OF FLOOR DATA
    String []tempXLen = split(simData[1],',');
    xDim = tempXLen.length;
    yDim = simData.length; 
  
    String sortData [] [] = new String [yDim-1] [xDim];
//    data = sortData;
    
    for (int j=0; j<yDim-1; j++){ 
      String []tempX = split(simData[j+1],','); 
      for (int i=0; i<xDim; i++){
        sortData [j] [i] = tempX[i];
//        if (i>4){
//          sortData [j] [i] = str(random(0,35));
//        }
      } 
    }
    data = sortData;
    
  
    ///calculate the number of floors based on the x dim of the csv table 
    ///based on always 4 columns before the first column containing floor data 
    numZones = xDim - flrCalc;
      
    ///calculate the start date of the simulation
    startMonth = sortData [0] [0].substring(1,3); 
    startDay = sortData [0] [0].substring(4,6);
    
//    saveStrings("data.txt", simData);
      
//      println (startMonth);
//      println (startDay);  
//      println (numZones);  
//      println (">>sorted");
  }

}
