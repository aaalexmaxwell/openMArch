String teamName = "phil";
String sketchName = "simBotBase";
String baseFolderLoc = "C:\\Users\\plangley\\Dropbox\\sketchbook-workshop\\";
boolean displayType1 = false;
boolean displayType2 = false;
boolean displayType3 = false;
boolean displayType4 = false;
boolean displayType5 = false;

int flrCalc=4;
int simHours = 24;
int w = 1200;
int h = 730;

int nTeams=3;
teamType1[] team = new teamType1[nTeams];
sunType1 sun;
tweetCol tweetCollector;

PFont largeText;
PFont smallText;

boolean reMakeTeams = false;
boolean tweetImage = false;

void setup(){ 
//////////////////establish twitter connection
  connectTwitter();
//////////////////establish twitter connection 

  background(255);
  size (w, h);
  largeText = loadFont("Swiss721BT-BoldCondensedOutline-72.vlw");
  smallText = loadFont("Cambria-12.vlw");
  
  initializeTweetCollector();
  initializeTeams();
  initializeSun();
  
}

void draw(){

  background(sun.posY+70, sun.posY+70, sun.posY+70);

  sun.timeCheck();
  sun.display();
  int ind = int(sun.clockTime);

  for (int i=0; i<nTeams; i++){
    
  if (displayType1==true){team[i].displayAverageSq(ind);}
  if (displayType2==true){team[i].displayAverageCirc(ind);}
  if (displayType3==true){team[i].displayYearCircleGraph(ind);}
  if (displayType4==true){team[i].displayDots(ind);}
  if (displayType5==true){ team[i].displayExtTempGraph(ind);}
  }

  tweetCollector.displayTweets();
  
  if (tweetImage==true){
    println(tweetImage);
//    tweetNewImage();
    tweetImage = false;  
  }
  
  if (reMakeTeams==true){
    for (int i=0; i<nTeams; i++){
      tweetCollector.updateTweetData();
      team[i].update();
      team[i].loadSimData();
      team[i].sortData();
    }
    tweetImage = true;
    reMakeTeams = false;
    println("tweet up-dated");
  }
}
