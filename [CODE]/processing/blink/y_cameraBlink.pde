void cameraSettings(){ 
  m.trackColor(20,20,20,80);//R, G, B, and range of similarity
  m.minDensity(100); //minimum pixels in the glob required to result in a box
  m.maxDensity(300); //maximum pixels in the glob required to result in a box
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

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
void blinkCheck(){
  
   boolean keepImage = false; 
  
  int[][] b = m.globBoxes();//get the center points
  for(int i=0;i<b.length;i++){
    if ((b[i][0] >(wTol)) && (b[i][0] <(cWidth -(2*wTol)))){      
      if ((b[i][1] >(hTol)) && (b[i][1] <(2*hTol))){
        if(b[i][3]>0){
          if (((b[i][2]/b[i][3])>0.5) && ((b[i][2]/b[i][3])<1.8)) {            
            if ((b[i][0]>((cWidth/2)+cTol)) || (b[i][0]<((cWidth/2)-cTol))){
              keepImage = true;
              eyePos[eyePosCount] = b[i][0];
              eyePos[eyePosCount+1] = b[i][1];
              eyePosCount = eyePosCount+2;
            }            
          }    
        }
      }
    }
  }
  
  if(keepImage==false){
    swapImage=true;
  }
}
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

void blinkCheckTemp(){
  
 boolean keepImage = false; 
  
  int[][] b = m.globBoxes();//get the center points
  stroke(255,0,0);
  noFill();
  for(int i=0;i<b.length;i++){
    if ((b[i][0] >(wTol)) && (b[i][0] <(cWidth -(2*wTol)))){      
      if ((b[i][1] >(hTol)) && (b[i][1] <(2*hTol))){
        if(b[i][3]>0){
          if (((b[i][2]/b[i][3])>0.5) && ((b[i][2]/b[i][3])<1.8)) {            
            if ((b[i][0]>((cWidth/2)+cTol)) || (b[i][0]<((cWidth/2)-cTol))){
              eye=true;
              keepImage = true;
              rect( b[i][0] , b[i][1] , b[i][2] , b[i][3] );
              eyePos[eyePosCount] = b[i][0];
              eyePos[eyePosCount+1] = b[i][1];
              eyePosCount = eyePosCount+2;
            }        
          }    
        }
      }
    }
  }
  
  if(keepImage==false){
    swapImage=true;
  }
  
} 

void drawLetterboxTemp(){ 
  
  stroke(0,0,255);
  noFill();
  rect((cWidth/2)-cTol,hTol,(cTol*2),hTol*2); 
  
  if (eye==false){
    fill(255,255,255,200);
  }else{
    noFill();
  }
  stroke(0,255,0);
  rect(wTol,hTol, cWidth-(wTol*2), hTol*2);
  eye = false;
}



