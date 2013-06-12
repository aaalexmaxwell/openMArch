
class teamType1{
  
  String name;
  
  int numFloors;
  int numZones;   

  String [] simData;
  String data [] [];
  
  int xDim;
  int yDim;
  
  String startDay;
  String startMonth;
  float avTemp;
  
/////////////////////////////////////////////////
  teamType1(String id){
    name=id;
  }
/////////////////////////////////////////////////
void displayIDHor(){
   int posX = 0;
   int posY = (h -((int(name)+1)*100))-50;
   
   noStroke();
   fill(70);
   rect(posX, posY, 25,25);

    textFont(smallText);
    textAlign(LEFT);
    text("   teamName_0"+name, posX+25,posY+10);
}
/////////////////////////////////////////////////
void displayIDVer(){
   int posX = ((int(name))*300)+0;
   int posY = 100;
   
   noStroke();
   fill(70);
   rect(posX, posY, 25,25);

    textFont(smallText);
    textAlign(LEFT);
    text("   teamName_0"+name, posX+25,posY+10);
}
/////////////////////////////////////////////////
  void displayYearCircle(int time){
   
    float cenX = ((int(name))*300)+150;
    float cenY = h - 150;
    float posX = cenX;
    float posY = cenY;
    float r = 0;
    float rD = 0;
    
    for (int i=0; i<numZones; i++){
      int startInd = ((int(startMonth)-1)*30)+ int(startDay);
      
      for (int j=time; j<yDim-1; j=j+24){  
          float tempInt = int(data[j] [i+4]);
          r = (i*10)+10;
          r= r+ +(tempInt);
          rD = (((j/24)+startInd)/(180/PI))- (PI/2);

          posX=cenX +r*(cos(rD));
          posY=cenY +r*(sin(rD));
   
          noStroke();
//          stroke(255,255-((tempInt-20)*10), 0, 250);
//          fill(255,255-((tempInt-20)*10), 0, 100);
          fill(355-((tempInt-20)*10),200 -((tempInt-20)*10), 0, 100);
          ellipse(posX, posY, 20, 20);  
      }
    }
  }
/////////////////////////////////////////////////
  void displayTemps(int time){
    int posX = 50 + ( 2*(((int(startMonth)-1)*30)+int(startDay)));
    int posY = h -((int(name)+1)*100);

    for (int j=time; j<yDim-1; j=j+24){ 
      posX=posX+2;
      
      int tempInt = int(data[j] [4]);
      int tempExt = int(data[j] [1]);
      noStroke();
      fill(150,255,0);
      ellipse(posX,posY-tempExt,2,2);
      ellipse(posX,posY+tempExt,2,2);
      fill(0,255,0);
      ellipse(posX,posY-tempInt,2,2);
      ellipse(posX,posY+tempInt,2,2);
    }
  }
/////////////////////////////////////////////////
  void displayYearElevation(int time){
    int posX = 50 + ( 2*(((int(startMonth)-1)*30)+int(startDay)));
    int posY = h -((int(name)+1)*100);
    
    int dayCount = 0;
    avTemp = 0;
    
    for (int j=time; j<yDim-1; j=j+24){ 
      
        float dif = int(data[j] [4])- int(data[j] [1]);
        ///the spacing between the bars of the graph
        posX=posX+2;
        
        stroke(70, 100);
        strokeWeight(3);
        line(posX,posY+dif,posX,posY-dif);
        strokeWeight(1);
        
        if (dif<8){
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
    String fileName = "simData" + name + ".csv" ;
    simData = loadStrings (fileName);//("simData.csv");
//    println (">>updated");
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
  
    ///calculate the number of floors based on the x dim of the csv table 
    ///based on always 4 columns before the first column containing floor data 
    numZones = xDim - flrCalc;
      
    ///calculate the start date of the simulation
    startMonth = sortData [0] [0].substring(1,3); 
    startDay = sortData [0] [0].substring(4,6); 
      
//      println (startMonth);
//      println (startDay);  
//      println (numZones);  
//      println (">>sorted");
  }

}
