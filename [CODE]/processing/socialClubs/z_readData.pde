void readDatabase() {
  reader = createReader("database.txt"); 
  try {
    textLine = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    textLine = null;
  }

  if (textLine == null) {
    noLoop();
  } 
  else {
    String[] d= split(textLine, ',');
    dataString = d;
  }
}

void getImages() {

  clubIm[0]=loadImage("image_01.png");
  clubIm[1]=loadImage("image_02.png");
  clubIm[2]=loadImage("image_03.png");
  clubIm[3]=loadImage("image_04.png");

  clubIm3D[0]=loadImage("3Dimage_01.png");
  clubIm3D[1]=loadImage("3Dimage_02.png");
  clubIm3D[2]=loadImage("3Dimage_03.png");
  clubIm3D[3]=loadImage("3Dimage_04.png");

  loopIm[0]=loadImage("loop_DET_01.png");
  loopIm[1]=loadImage("loop_DET_02.png");
  loopIm[2]=loadImage("loop_DET_03.png");
  loopIm[3]=loadImage("loop_DET_04.png");
  loopIm[4]=loadImage("loop_DET_05.png");
  loopIm[5]=loadImage("loop_DET_06.png");
  loopIm[6]=loadImage("loop_DET_07.png");
  loopIm[7]=loadImage("loop_DET_08.png");
  loopIm[8]=loadImage("loop_DET_09.png");
  loopIm[9]=loadImage("loop_DET_10.png");
  loopIm[10]=loadImage("loop_DET_11.png");
  loopIm[11]=loadImage("loop_DET_12.png");
  loopIm[12]=loadImage("loop_DET_13.png");
  loopIm[13]=loadImage("loop_DET_14.png");
  loopIm[14]=loadImage("loop_DET_15.png");
  loopIm[15]=loadImage("loop_DET_16.png");
  loopIm[16]=loadImage("loop_DET_17.png");
  loopIm[17]=loadImage("loop_DET_18.png");
  loopIm[18]=loadImage("loop_DET_19.png");
  loopIm[19]=loadImage("loop_DET_20.png");
  loopIm[20]=loadImage("loop_DET_21.png");
  loopIm[21]=loadImage("loop_DET_22.png");
  loopIm[22]=loadImage("loop_DET_23.png");
  loopIm[23]=loadImage("loop_DET_24.png");
  loopIm[24]=loadImage("loop_DET_25.png");
  loopIm[25]=loadImage("loop_DET_26.png");  

  Inst_Image=loadImage("Instructions.png"); 

  typeImage[0]=loadImage("type_00.png"); 
  typeImage[1]=loadImage("type_01.png"); 
  typeImage[2]=loadImage("type_02.png"); 
  typeImage[3]=loadImage("type_03.png"); 
  typeImage[4]=loadImage("type_04.png");
}

