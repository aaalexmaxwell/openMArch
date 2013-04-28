void checkUser(){
  
  if (user==true){ 
    userScreen();
    if (startScreenCount==true){
      sCount = secs;
      startScreenCount=false;
    }
    if (secs>sCount+3) {
      startScreenCount = true;
      user=false;
      runCode = true;
    }    
  }
  
}

void userScreen(){
  
  String userText;
  
  if (runCode==false){
    
    int d = day(); 
    int m = month(); 
    int y = year(); 
    int s = second();  // Values from 0 - 59
    int mi = minute();  // Values from 0 - 59
    int h = hour();
    
    userDate = d + "/" + m + "/" + y;
    userTime = h + ":" + mi + "." + s;
    
    stroke(0,0,0);
    fill(0,0,0);
    
    userText = "user" + " " + userIndex;
    font = loadFont("ArialMT-24.vlw"); 
    textFont(font); 
    text(userText, width/4, height/2);
    
    userText = userDate;
    font = loadFont("ArialMT-24.vlw"); 
    textFont(font); 
    text(userText, width/4, height/2+40);
    
    userText = userTime; 
    font = loadFont("ArialMT-24.vlw"); 
    textFont(font); 
    text(userText, width/4, height/2+80);
    
    userOutput = "user" + userIndex + "," + userTime;

  }
}

void updateData(){
  userOutput = userOutput + "," + liveImage + "," + imTiming;
}


void resetEyePos(){
  for (int i = 0; i< eyePos.length; i++){
    eyePos[i]=0;
  }
  eyePosCount=0;
}
