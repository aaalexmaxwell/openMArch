class sunType1{
  
  int posX;
  int posY=120;
  float dia;
  float col;
  boolean grow = true;
  int clockTime;
  int realTime;
  
  sunType1(){
  }
  
  void timeCheck(){
    
    if (posY==10){grow=true;} 
    if (posY==250){grow=false;}

    if (grow==true) {
      clockTime = posY/20;
      posY++; 
    }
    if (grow==false) {
      clockTime = 24-(posY/20);
      if (clockTime==24){clockTime=0;}
      posY--;
    }
  }
  
  void display(){
    ///draw panel
    noStroke();
    fill(0,50);
    rect(w-200,0, 200, h);
    ///draw moon
    dia = 48;
    posX=w-100;
    noStroke();
    fill(255,280-posY);
    ellipse(posX, 120+posY,dia,dia);
    ///draw sun
    dia = (posY/2)+50;
    noStroke();
    fill(255, posY,0, posY);
    ellipse(posX,h-posY,dia,dia);
    ///draw clock
    fill(80);
    textFont(largeText);
    textAlign(RIGHT);
    text(clockTime +"h", w-20,70);
  }
}

