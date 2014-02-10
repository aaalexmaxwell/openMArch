/////////SEND TWEETS
void tweetNewImage(){ 
      String imLoc= savePath("");
      String imName = "simpleName" + ".png";
      save(imName);
      String tweetText = "...a simple tweet ";
      String tag = "#odCode";
      String message = tweetText + tag;
      
      try {
        
        File imageFile = new File(imLoc + imName);
        StatusUpdate status = new StatusUpdate(message);
        status.setMedia(imageFile);  
        twitterTweet.updateStatus(status);
        println("tweet sent"); 
        
      } catch(TwitterException e) {
        println("Send tweet: " + e + " Status code: " + e.getStatusCode());
      }
}


