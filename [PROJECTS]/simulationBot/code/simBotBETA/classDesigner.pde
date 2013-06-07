
class designerType1{
  
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
  designerType1(String id){
    name=id;
  }
/////////////////////////////////////////////////
void displayID(){
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
  void displayTemps(int time){
    int posX = 50 + ( 2*(((int(startMonth)-1)*30)+int(startDay)));
    int posY = h -((int(name)+1)*100);

    for (int j=time; j<yDim-1; j=j+24){ 
      posX=posX+2;
      noStroke();
      int tempInt = int(data[j] [4]);
      int tempExt = int(data[j] [1]);
      fill(150,255,0);
      ellipse(posX,posY-tempExt,2,2);
      ellipse(posX,posY+tempExt,2,2);
      fill(0,255,0);
      ellipse(posX,posY-tempInt,2,2);
      ellipse(posX,posY+tempInt,2,2);
    }
  }
/////////////////////////////////////////////////
  void displayYearSection(int time){
    int posX = 800;
    int posY = h -((int(name)+1)*100);

    for (int j=time; j<yDim-1; j=j+24){ 
      float dif =  (int(data[j] [4])- int(data[j] [1]));
      if (int(data[j] [4])>30){
        noFill();
        stroke(255,0,0,20);
        ellipse(posX,posY,dif*2,dif*2);
      }
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
        
        stroke(70);
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
    numFloors = xDim - flrCalc;
    
    ///calculate the number of zones by matching the date used in the first coloumn of the csv
    ///based on each simultion day is split into 24hrs 
    String tempFirstDate = sortData [0] [0].substring(1,6);
      for (int j=0; j<yDim-1; j++){ 
        String tempDate = sortData [j] [0].substring(1,6); 
        if (tempDate.equals(tempFirstDate) == true){
          numZones=(j+1)/simHours; 
//          println (tempDate);  
        }
      } 
      
      ///calculate the start date of the simulation
      startMonth = sortData [0] [0].substring(1,3); 
      startDay = sortData [0] [0].substring(4,6); 
      
//      println (startMonth);
//      println (startDay); 
//      println (numFloors);  
//      println (numZones);  
//      println (">>sorted");
  }

}
