void initializeTeams(){
  for (int i=0; i<nTeams; i++){
    team[i] = new teamType1(i);
    team[i].update();
    team[i].loadSimData();
    team[i].sortData();
  }
}

void initializeSun(){
   sun = new sunType1();
}

void initializeTweetCollector(){
   tweetCollector = new tweetCol();
}
