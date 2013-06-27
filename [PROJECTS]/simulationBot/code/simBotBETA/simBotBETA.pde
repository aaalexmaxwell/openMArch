String teamName = "teamNameGoesHere";
String baseFolderLoc = "C:\\Users\\plangley\\Dropbox\\WORKSHOP\\";

int flrCalc=4;
int simHours = 24;
int w = 1200;
int h = 700;

int nTeams=3;
teamType1[] team = new teamType1[nTeams];

sunType1 sun;
tweetCol tweetCollector;

PFont largeText;
PFont smallText;

boolean reMakeTeams = false;

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
//   noLoop();
  background(sun.posY+70, sun.posY+70, sun.posY+70);
  
  sun.timeCheck();
  sun.display();

  int ind = int(sun.clockTime);

  for (int i=0; i<nTeams; i++){
//    team[i].displayYearCircle(ind);
    team[i].displayYearGraph(ind);
  }
  
  tweetCollector.displayTweets();
  
  if (reMakeTeams==true){
    for (int i=0; i<nTeams; i++){
      team[i].update();
      team[i].loadSimData();
      team[i].sortData();
    }
    reMakeTeams = false;
    println("tweet up-dated");
  }
}
