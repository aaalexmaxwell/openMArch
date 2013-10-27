class sunType1{
  
  int posX;
  int posY=10;
  float dia;
  float col;
  boolean grow = true;
  int clockTime;
  int realTime;
  
  sunType1(){
  }
  
  void timeCheck(){
    
    if (mouseX<50){
      activeZone = mouseY/(h/numZones);
    }
    
    if (mouseX>w-50){
      clockTime = mouseY/(h/24);
    }

  }
  
  void display(){

    fill(80);
    textFont(largeText);
    textAlign(RIGHT);
    text(clockTime +"h", w-70,70);
    
    fill(sun[0].posY+70, sun[0].posY+70, sun[0].posY+70);
    rect(0,0,50,h);
    rect(w-50,0,50,h);
    
    fill(0, 150);
    float sX = 0;
    float sY = (activeZone)*(h/numZones);
    rect(sX, sY, 50, h/numZones);    
    
    fill(0, 150);
    sX = w-50;
    sY = (clockTime)*(h/24);
    rect(sX, sY, 50, h/24); 

  }
}

