import JMyron.*;
JMyron m;

//CAMERA DIMS
int cWidth = 640;
int cHeight = 480;
//LETTERBOX TOLERNACES;
int wTol=20;
int hTol=40;
int cTol=20;

void setup(){
  size(cWidth,cHeight); 

  m = new JMyron(); 
  m.start(cWidth,cHeight); 
  cameraSettings();  //adjust the camera settings

}

void draw(){
  background(255,255,255);
  drawCamera();
  drawBoxes();
}

void drawBoxes(){
  int[][] b = m.globBoxes();//get the center points

  //draw the boxes
  stroke(255,0,0);
  for(int i=0;i<b.length;i++){
    rect( b[i][0] , b[i][1] , b[i][2] , b[i][3] );
  }
}
