String teamName = "teamNameGoesHere";

int flrCalc=4;
int simHours = 24;
int w = 1200;
int h = 600;

int nTeams=3;
teamType1[] team = new teamType1[nTeams];

int nSuns=1;
sunType1[] sun = new sunType1[nSuns];

PFont largeText;
PFont smallText;

void setup(){ 
  ////////////////establish twitter connection
  ///connectTwitter();
  ////////////////establish twitter connection 
  background(255);
  size (w, h);
  largeText = loadFont("Swiss721BT-BoldCondensedOutline-72.vlw");
  smallText = loadFont("Cambria-12.vlw");
  
  initializeTeams();
  initializeSun();
}

void draw(){

  background(sun[0].posY+70, sun[0].posY+70, sun[0].posY+70);

  sun[0].timeCheck();
  sun[0].display();

  int ind = int(sun[0].clockTime);

  for (int i=0; i<nTeams; i++){
    team[i].displayYearCircle(ind);
    team[i].displayIDVer();
//    team[i].displayYearElevation(ind);
//    team[i].displayTemps(ind);
//    team[i].displayIDHor();
  }
}

void initializeTeams(){
  for (int i=0; i<nTeams; i++){
    String tempName = str(i);
    team[i] = new teamType1(tempName);
    team[i].loadSimData();
    team[i].sortData();
  }
}

void initializeSun(){
    sun[0] = new sunType1();
}


