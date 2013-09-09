
Table dataTable;

void setup(){
 size(600,365);
 dataTable = loadTable("test.csv", "csv");
 noLoop();
}

void draw(){
  background(255);
  displayByHr();
}


void displayByHr(){
  int pX = 0;
  for (int k=1; k<25; k++){
    for (int i=5;i<11;i++){
      int pY = 0;
      for (int j=k;j<(365*24)+1; j=j+24){
        float tempCol = float(dataTable.getString(j, i));
        float temp = float(dataTable.getString(j, i));
        ///////////////////////////////////////////////////////////////
//        tempCol = tempCol*10;
//        tempCol = (tempCol-10)*10;
        tempCol = tempCol*(tempCol-15);
        int c =int(tempCol);
        println(c);
        color c1 = color(c, 0, 0);
        if (temp <=18){
          c1 = color(0 ,0, c);
        }
        if (temp >18 & temp<=23){
          c1 = color(0, c, 0);
        }
        set(pX,pY, c1);
        /////////////////////////////////////////////////////////////// 
        pY++;
      }
      pX++;

    }
  } 
}
