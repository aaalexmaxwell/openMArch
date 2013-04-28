//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

//CALIBRATE CONTROL
boolean calibrate = true;

//TIMING VARIABLES
int secs;
int sCount;
boolean startScreenCount = true;
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

//GENERIC VARIABLES
PFont font;
int count;
int sec;
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

//VARIABLES RELATING TO USER 
String userDate;
String userTime;
int userIndex;
String userOutput = "";
boolean user = false;
boolean exitUser;
int[] eyePos = new int [20000]; // collects the X,Y values of globs for later use
int eyePosCount;
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

// VARIABLES FOR CONTROL OF WHEN TO EXECUTE CODE
boolean runCode;
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

//VARIABLES FOR CONTROL OF IMAGE DISPLAY
String liveImage;
Boolean imStartCount=true;
Boolean imEndCount=false;
Boolean imageChange;
int imSCount;
int imECount;
int imTiming;
//int imTime; //length of time, in seconds that image has been viewed
boolean swapImage;
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

// VARIABLES FOR READING AND WRITING TO TEXT FILES
BufferedReader reader;
PrintWriter output;
String textLine; 
String imageBank[];    //string array of all image data read from text file
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

//VARIABLES RELATING TO IMAGES, CATEGORIES, PARAMETERS AND RATINGS
int nImages; //calculated from the image database text file
int nCat=3;
int nPara;   //calculated from the image database text file

int imLength = nPara+1; // the 'length' of the image data in terms of csv elements
int imCat;
int chCat;
String[] liveImagePara = new String[nPara];      //categorized parameters of live image 
String[] liveImageParaVal = new String[nPara];   //values of categorized parameters of live image
String[] simImages = new String[1000];           //list of images with matching parameters [of inverted importance] to live image
String[] exactImages = new String[1000];         // list of images with matching parameters AND psrsmter values [of inverted importance] to live image
int nLivePara;     //the number of parameters of the live image contained in the relevant category
int nLiveParaVal;  //the number of parameter values of the live image contained in the relevant category
int nSimImages;    //total number of images containing relevant parameters
int nExactImages;  //total number of images with matching parameters AND parameter values
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

//VARIABLES RELATING TO WEBCAM INPUT
import JMyron.*;
JMyron m;
//MONITOR BLINK
boolean eye=false;
//CAMERA DIMS
int cWidth = 352; //640;
int cHeight = 288; //480;
//LETTERBOX TOLERNACES;
int wTol=20;
int hTol=40;
int cTol=20;
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

void setup(){
  size(960,720); 
//  size(1280, 1024);
  
  //START THE CAMERA FEED
  m = new JMyron(); 
  m.start(cWidth,cHeight); 
  cameraSettings();  //adjust the camera settings

  getUserIndex();    //find the number index of the last user
  readImageData();   //read in the image database text file
  sortImageData();   //sort image database and count images and parameters
  rndImage();        // select a random image for display
}

void draw(){
  
  frameRate(10);
  secs = second();  
  background(255,255,255);
  
  if (calibrate==true){
    tint(255, 128);
    drawCamera();//draw the camera to the screen  
    translate((width-cWidth)/2, (height-cHeight)/2); 
    blinkCheckTemp();
    drawLetterboxTemp();
    translate(-(width-cWidth)/2, -(height-cHeight)/2); 
  } else {
    noTint();
    m.update();
//    drawCamera();//draw the camera to the screen  
    translate((width-cWidth)/2, (height-cHeight)/2); 
    blinkCheck();     
    translate(-(width-cWidth)/2, -(height-cHeight)/2);
  }

  checkUser();  //check if their is a user
  
  if (runCode==true){
    
    loadActiveImage();
  
    if (imStartCount == true){
      beginImageTime();
    }

    if (swapImage==true){
      endImageTime();
      updateData();
      selectNextImage();
      resetImageData();
      writeEyePos();
      resetEyePos();
      imStartCount=true;
      swapImage=false;
    }
    
    if (exitUser==true){
      endImageTime();
      writeUserData();
      userIndex = userIndex+1;
      writeUserIndex();
      
      user=false;
      runCode = false;
      imStartCount = true;
      exitUser=false;
    }  
  }
}





  

