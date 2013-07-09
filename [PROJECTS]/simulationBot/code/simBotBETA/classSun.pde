class sunType1{
  
  int posX;
  int posY=120;
  float dia;
  float col;
  boolean grow = true;
  int clockTime;
  int realTime;
  int numStars = 500;
  int [] starPosX = new int[numStars];
  int [] starPosY = new int[numStars];
  int [] starDia = new int[numStars];
  
  sunType1(){
    ////generate random positins for the stars
    for (int i=0;i<numStars; i++){
      starPosX[i] =int(random(0,w));
      starPosY[i] =int(random(0,500));
      starDia[i] =int(random(1,4));
    }
    for (int i=0;i<numStars; i=i+2){
      starPosX[i] =int(random(0,w));
      starPosY[i] =int(random(0,200));
      starDia[i] =int(random(1,4));
    }
  }
  
  void timeCheck(){
    
    if (posY==10){grow=true;} 
    if (posY==250){grow=false;}

    if (grow==true) {
      clockTime = posY/20;
//      posY++; 
      posY=posY+1;
    }
    if (grow==false) {
      clockTime = 24-(posY/20);
      if (clockTime==24){clockTime=0;}
//      posY--;
      posY=posY-1;
    }
  }
  
  void display(){
    ///draw panel
//    noStroke();
//    fill(0,50);
//    rect(w-200,0, 200, h);
    
    ///draw stars
    for (int i=0;i<numStars; i++){
      noStroke();
      fill(255,280-posY);
      ellipse(starPosX[i], starPosY[i],starDia[i],starDia[i]);
    }
    
    ///draw moon
    dia = 48;
    posX=w-100;
    noStroke();
    fill(255);
    ellipse(posX, 100+posY,dia,dia);
    
    ///draw sun
    dia = (posY/2)+50;
    noStroke();
    fill(255, posY,0, posY);
    ellipse(posX,h-posY-100,dia,dia);
    ///draw clock
    fill(80);
    textFont(largeText);
    textAlign(RIGHT);
    text(clockTime +"h", w-20,h-25);
  }
}

