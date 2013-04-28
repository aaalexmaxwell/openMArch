
void cameraSettings(){ 
  m.trackColor(181,185,84,80);//R, G, B, and range of similarity
  m.minDensity(100); //minimum pixels in the glob required to result in a box
  //m.maxDensity(300); //maximum pixels in the glob required to result in a box
}

void drawCamera(){
  m.update();
  int[] img = m.image(); //get the normal image of the camera
  loadPixels(); 
  
  int p;
  p =(((height - cHeight)/2) * width) + ((width - cWidth)/2); //starting pixel

  for (int j = 0; j<cHeight; j++){
    int px = p+(j*width);
    int step = cWidth*j;
    for (int i=0; i<cWidth; i++){
      int pix = px+i;
      pixels[pix] = img[i+step];
    }
  }
  updatePixels(); 
}


