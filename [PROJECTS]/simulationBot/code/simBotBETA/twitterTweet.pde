/////////SEND TWEETS
//void keyReleased() {
//  
//  if (key == 't' || key == 'T') {
void tweetNewImage(){

      ///////////////////////sendTweet  
      String imLoc= savePath("");
      String [] tempName = split(imLoc, "\\");
      String imNameTag = tempName[tempName.length-2];
      String imName = imNameTag + ".png";
      int s = second();  
      int m = minute();  
      int h = hour();    
      String time = " <" + str(h) + "-" + str(m) + "-" + str(s) + ">";

      try {
        save(imName);
        teamName = tweetCollector.teamName[0];
        sketchName = tweetCollector.sketchName [0];
        String message = "oh good...a new image from..." + " #" +teamName + " #" +sketchName + " #simBotSays" + time;
        File imageFile = new File(imLoc + imName);
        StatusUpdate status = new StatusUpdate(message);
        status.setMedia(imageFile);
        
        twitterTweet.updateStatus(status);
        println("tweet sent"); 
        
      } catch(TwitterException e) {
        println("Send tweet: " + e + " Status code: " + e.getStatusCode());
      }
      ///////////////////////sendTweet 
//  }        
}


