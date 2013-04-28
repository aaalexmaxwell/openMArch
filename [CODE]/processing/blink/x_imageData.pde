void filterImageData(){
 
//TRANSLATE TIME TAKEN LOOKING AT IMAGE INTO CATEGORY
  if (imTiming<=3){
    imCat = 3;
  }
  if (imTiming>3 && imTiming<=6){
    imCat = 2;
  }
  if (imTiming>6){
    imCat = 1;
  }
   
//COLLECT IMAGE DATA FROM LIVE IMAGE
  for (int i=0; i<imageBank.length-1; i+=imLength){  
    if (imageBank[i].equals(liveImage)){
      for (int j=0; j<imLength-1; j++ ){          
        int index = i+(imLength-1)-j;
        String dataBit = imageBank[index].substring(0,1);
        int db = int(dataBit);         
        if (db==imCat){
          liveImagePara[j] =imageBank[index].substring(1,2);
          liveImageParaVal[j]= imageBank[index].substring(2,3);
        }         
      }  
    }
  }
  
  for (int i = 0; i<liveImagePara.length; i++){
    if (liveImagePara[i]!=null){
      nLivePara = nLivePara+1;
      nLiveParaVal = nLiveParaVal+1;
    }
  }
  
//SWAP CATEGORIES
  if (imCat == 3){
    chCat = 1;
  }
  if (imCat == 2){
    chCat = 1;
  }
  if (imCat == 1){
    chCat = 1;
  }

//FIND IMAGES WITH MATCHING CATEGORIES
  int k=0;  //index count of images with correct parameters
  int n=0;  //index count of images with exact parameter value matches
  
  //loop through image library
  for (int i=0; i<imageBank.length-1; i+=imLength){  
  //check that image is not liveImage   
    if (imageBank[i].equals(liveImage)){
    }else{
      // find parameter values within the correct category
      for (int j=0; j<imLength-1; j++ ){    
        
        int index = i+(imLength-1)-j; 
        String catBit = imageBank[index].substring(0,1);
        int cb = int(catBit);
        
        if(cb == chCat){
          String dataBit = imageBank[index].substring(1,2);
          //check category parameters of found image against all liveImage category parameters
          for (int m=0; m<nLivePara; m++){

            String paraBit = liveImagePara[m];
            if (dataBit.equals(paraBit)){
              // collect list of images with matching parameters
              simImages[k] = imageBank[i];
              k=k+1;
              
              //check parameter values
              String pBit = liveImageParaVal[m];
              String dBit = imageBank[index].substring(2,3);
              if (dBit.equals(pBit)){
                // collect list of images with exact matching parameters AND values
                exactImages[n]=imageBank[i];
                n=n+1;
              }
            }            
          }
        }          
      } 
    }
  }
  
//COUNT NUMBER OF SIMILAR AND EXACT IMAGES
  for (int i=0; i<simImages.length; i++){
    if (simImages[i]!= null){
      nSimImages = nSimImages+1;
    }
  }
  for (int i=0; i<exactImages.length; i++){
    if (exactImages[i]!= null){
      nExactImages = nExactImages+1;
    }
  }
  
}

void selectNextImage(){
  
   filterImageData();
 
   String live;
   
   if (nExactImages>0){
     float im = random(0,nExactImages-1);
     int ind = int(im);     
     live = exactImages[ind];
     
   }else{
     if (nSimImages>0){
       float im = random(0,nSimImages-1);
       int ind = int(im); 
       live = simImages[ind];
       
     }else{
       float im = random(1,nImages);
       int ind = int(im);
       String a = "IM";
       if (ind<10){
         a = a + "000";
       }
       if ((ind>9) && (ind<100)){
         a = a +"00";
       } 
       if ((ind>99) && (ind<1000)){
         a = a +"0";
       } 
       
       String num = str(ind);
       live = a + num;
       
     }
   }
    
  liveImage = live;
  imageChange = false;
      
}

void resetImageData(){
  for (int i = 0; i<liveImagePara.length; i++){
    liveImagePara[i]=null; 
    liveImageParaVal[i]=null;
  }
  for (int i = 0; i<simImages.length; i++){
    simImages[i]=null;
  }
  for (int i = 0; i<exactImages.length; i++){
    exactImages[i]=null;
  }
  nLivePara=0;
  nLiveParaVal=0;
  nSimImages = 0;
  nExactImages = 0;
}

void sortImageData(){
  
////count the number of parameters  
  String s = "[IM0002";
  for (int i=0; i<imageBank.length; i++){
    if (imageBank[i].equals(s)){
      nPara = i-1;
    }
  }

////tidy up imagebank [i.e. remove square brackets]
  for (int i =0;i<imageBank.length; i+=(nPara+1)){
    String st = imageBank[i].substring(1,7);
    imageBank[i] = st;
  }
  
  for (int i =(nPara);i<imageBank.length; i+=(nPara+1)){
    String st = imageBank[i].substring(0,3);
    imageBank[i] = st;
  }

////count the number of images  
  nImages = imageBank.length/(nPara+1);

}


