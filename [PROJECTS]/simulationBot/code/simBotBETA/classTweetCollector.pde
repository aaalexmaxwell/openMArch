class tweetCol{
   
  String[] tweetText = new String[nTeams];
  String[] tweetMedia = new String[nTeams];
  String[] teamName = new String [nTeams];
  String[] sketchName = new String [nTeams];
  int index;
  
  tweetCol(){

    ///initialize temp values
    for (int i=0; i<nTeams; i++){
      tweetText[i] = "#phil" + "#simBotBase" + "#simBotBETA";
      //tweetText[i] = "#" + teamName + "#" + sketchName + "#simBotBETA";
    }
    for (int i=0; i<nTeams; i++){
      tweetMedia[i] = " ";
    }
    for (int i=0; i<nTeams; i++){
      teamName[i] = " ";
    }
    for (int i=0; i<nTeams; i++){
      sketchName[i] = " ";
    }
    ///initialize temp values
    
  }
  
  void updateTweetData(){
    
    for (int i=0; i<nTeams; i++){
      ///split tweet by hash tag
      String []tempT = split(tweetText[i],'#'); 
      trim(tempT);
      ////assign tweet data
      teamName[i] = trim(tempT[1]);
      sketchName[i] = trim(tempT[2]);
      tweetMedia[i] = baseFolderLoc + teamName[i] + "\\" + sketchName[i] + "\\" + sketchName[i] + ".jpg";
    }
  }
  
  void displayTweets(){

    //////////////////////////////////////////
    ////display the tweet content....
    fill(255,0,0);
    textFont(smallText);
    textAlign(LEFT);
    
    for (int i=0; i<nTeams; i++){
      ///show team name
      noStroke();
      fill(70);
      rect((300*i), 0, 25,25);
      textSize(15);
      text(teamName[i], (300*i)+30, 15);
      
      ///show sketch name
      noStroke();
      fill(70);
      rect((300*i), 0, 25,25);
      textSize(15);
      text(sketchName[i], (300*i), 60);
      
      ///show tweet content
      String []tempT = split(tweetText[i],'#');
      noStroke();
      textSize(10); 
      text(tempT[0], (300*i), 90);
//      for (int j=0; j<tempT.length-1; j++){
//        text(tempT[j], (300*i), 60+(20*j));
//      }
    
      ///show images
      PImage img = loadImage(tweetMedia[i]);
      println(tweetMedia[i]);
      image(img, 10+(300*i), h-120, img.width/2, img.width/2);
    }
    ////display the tweet content....
    //////////////////////////////////////////

  }

}
