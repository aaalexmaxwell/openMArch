void mousePressed(){
  m.settings();//click the window to get the settings
}

public void stop(){
  m.stop();//stop the object
  super.stop();
}

//++++++++++++++EACH OF THE KEY COMMANDS HERE ARE DUMMIES REPLACING THE LASER BEAM AND ARE USED FOR TESTING ONLY
//++++++++++++++THE BOOLEAN VALUES THAT THEY CONTROL MUST BE USED IN THE LASER BEAM FUNCTION AND THE BLINK FUNCTION
void keyReleased(){
  //THIS SIMULATES THE LASER BEAM TO START THE CODE FOR THE USER
  if (key == 'l' ) {
    user = true;
  }
  //THIS SIMULATES THE BLINKING TO CHANGE IMAGE
  if (key==TAB){
    swapImage=true;
  }
  // THIS SIMULATES THE LASER BEAM TO END THE CODE FOR THE USER 
  if (key == 'e' ) {
    exitUser = true;
  }
  if (key == 'c' ) {
    if (calibrate==false){
    calibrate = true;
    } else{
      calibrate = false;
    }
  }
}

//++++++++++++++USE THIS SUBROUTINE TO DETECT USER
void mouseReleased(){
  if(user==false){
    user = true;
  } else {
    exitUser = true;
  }  
}
