void keyReleased(){
  
  if (key == 't' || key == 'T') {
    tweetNewImage();
  }
  if (key=='1'){
    displayType1 = true;
    displayType2 = false;
    displayType3 = false;
    displayType4 = false;
    displayType5 = false;
  }
  if (key=='2'){
    displayType1 = false;
    displayType2 = true;
    displayType3 = false;
    displayType4 = false;
    displayType5 = true;
  }
  if (key=='3'){
    displayType1 = false;
    displayType2 = false;
    displayType3 = true;
    displayType4 = false;
    displayType5 = true;
  }
  if (key=='4'){
    displayType1 = false;
    displayType2 = false;
    displayType3 = false;
    displayType4 = true;
    displayType5 = true;
  }
}
