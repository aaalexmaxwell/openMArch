class tweetCol{
   
  String[] tweetText = new String[nTeams];
  String[] tweetMedia = new String[nTeams];
  String[] teamName = new String [nTeams];
  String[] sketchName = new String [nTeams];
  int index;
  
  tweetCol(){
    ///initialize temp values
    for (int i=0; i<nTeams; i++){
      tweetText[i] = "#team"+str(i)+"#sketch1";
    }
    for (int i=0; i<nTeams; i++){
      tweetMedia[i] = baseFolderLoc;
    }
    for (int i=0; i<nTeams; i++){
      teamName[i] = "team" + i;
    }
    for (int i=0; i<nTeams; i++){
      sketchName[i] = "sketch1";
    }
    ///initialize temp values
  }
  
  void displayTweets(){

    //////////////////////////////////////////
    ////display the tweet content....
    fill(255,0,0);
    textFont(smallText);
    textSize(15);
    textAlign(LEFT);
    for (int i=0; i<nTeams; i++){
      
      ///split tweet by hash tag
      String []tempT = split(tweetText[i],'#'); 
      trim(tempT);

      ///show team name
      teamName[i] = trim(tempT[1]);
      noStroke();
      fill(70);
      rect((300*i), 0, 25,25);
      text(teamName[i], (300*i)+30, 15);
      
      ///show sketch name
      sketchName[i] = trim(tempT[2]);
      noStroke();
      fill(70);
      rect((300*i), 0, 25,25);
      text(sketchName[i], (300*i), 60);
      
      ///show tweet content
      text(tweetText[i], (300*i), 80);
    
      ///show images
      tweetMedia[i] = baseFolderLoc + teamName[i] + "\\" + sketchName[i] + "\\" + sketchName[i] + ".jpg";
      PImage img = loadImage(tweetMedia[i]);
      image(img, 10+(300*i), h-120, 90, 65);
      
    }
    ////display the tweet content....
    //////////////////////////////////////////

  }

}
