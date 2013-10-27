String teamName = "teamNameGoesHere";

int flrCalc=4;
int simHours = 24;
int w = 900;
int h = 600;

int nTeams=1;
teamType1[] team = new teamType1[nTeams];

int nSuns=1;
sunType1[] sun = new sunType1[nSuns];

int activeZone = 0;
int numZones=0;

PFont largeText;
PFont smallText;

boolean dispCirc = true;

void setup(){ 

  background(255);
  size (w, h);
  largeText = loadFont("Swiss721BT-BoldCondensedOutline-72.vlw");
  smallText = loadFont("Swiss721BT-BoldCondensedOutline-24.vlw");;
  
  initializeTeams();
  initializeSun();
}

void draw(){
  
  background(255);
  noStroke();
  fill(sun[0].posY+70, sun[0].posY+70, sun[0].posY+70);
  rect(0,0,50,h);
  rect(w-50,0,50,h);
  
  sun[0].timeCheck();
  sun[0].display();
 
  int ind = int(sun[0].clockTime);
  
  if (dispCirc==true){
    team[0].displayYearCircle(ind, activeZone);
//      team[0].displayGrid(ind, activeZone);
  } else{
     team[0].displayYearElevation(ind, activeZone);
     team[0].displayTemps(ind, activeZone);
     team[0].displayID();
  }

}

void initializeTeams(){
  for (int i=0; i<nTeams; i++){
    String tempName = str(i);
    team[i] = new teamType1(tempName);
    team[i].loadSimData();
    team[i].sortData();
    numZones = team[i].numZones;
  }
}

void initializeSun(){
    sun[0] = new sunType1();
}

void keyReleased() {
  if (key == ENTER) {
    if (dispCirc == false){
      dispCirc=true;
    } else {
      dispCirc = false;
    }
  }
}


