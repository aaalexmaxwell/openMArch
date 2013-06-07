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
  
  void display(){
    
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
    ///draw moon
    dia = 48-(posX/2);
    noStroke();
    fill(255,280-posY);
    ellipse(w-200, 120+posY,dia,dia);
    ///draw sun
    dia = (posY/2)+50;
    noStroke();
    fill(255, posY,0, posY);
    ellipse(w-200,h-posY,dia,dia);
    ///draw moon
//    dia = 48-(posX/5);
//    noStroke();
//    fill(255,280-posY);
//    ellipse(w-200, 240-posY,dia,dia);
    ///draw clock
    fill(80);
    textFont(largeText);
    textAlign(RIGHT);
    text(clockTime +"h", w-20,70);

  }
}

