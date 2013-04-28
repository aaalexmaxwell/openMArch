void loadActiveImage(){
  PImage im;
  im = loadImage(liveImage + ".jpg");
  image(im, 0, 0);
}

void rndImage(){
  liveImage = "IM"; 
  float l = random(1,nImages+1);
  int live = int(l);
  
  if (live<10){
    liveImage = liveImage + "000";
  }
  if (live<100 && live>9){
    liveImage = liveImage + "00";
  }
  if (live<1000 && live>99){
    liveImage = liveImage + "0";
  }
  liveImage = liveImage + live;
  imageChange = false;
}

void beginImageTime(){
  imSCount = secs;
  imStartCount = false;
}

void endImageTime(){
  imECount = secs;
  if (imECount<imSCount){
    imTiming = imECount + (60- imSCount);
  }else{
    imTiming = imECount - imSCount;
  }
  imEndCount = false;
}

//void changeImage(){
//  filterImageData();
//  selectNextImage();
//}
