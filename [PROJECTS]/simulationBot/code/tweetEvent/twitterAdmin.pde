////////////////////////////////////////////////////////////////////////////////////
///////////////////////////// Config twitter setup here ////////////////////////////
// create twitter objects here
TwitterFactory twitterFactory;
Twitter twitter;
RequestToken requestToken;

static String OAuthConsumerKey = "JSnZ0NdCQvCAAaDdVSdIw";
static String OAuthConsumerSecret = "xDgfjqsi83LyEsQuBbOFG9skc4g8ieVnDO0ZH5fJCfs";
static String AccessToken = "1490165892-1awck08TTO9YwaJqFtNIG0eZyZfCH9rIgSSdy9L";
static String AccessTokenSecret = "GjYO8tC8YhEpAaAXZTlumVZQi9bMu2bSOv2wDON2r8";
///////////////////////////// End twitter config ////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

// Initial connection
void connectTwitter() {
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey(OAuthConsumerKey);
  cb.setOAuthConsumerSecret( OAuthConsumerSecret );
  cb.setOAuthAccessToken( AccessToken);
  cb.setOAuthAccessTokenSecret( AccessTokenSecret );
  twitterFactory = new TwitterFactory(cb.build());
  twitter = twitterFactory.getInstance();
  println("connected");
}

// Loading up the access token
private static AccessToken loadAccessToken() {
  return new AccessToken(AccessToken, AccessTokenSecret);
}

//Save image and end Tweet on key press
void keyReleased() {
  if (key == 't' || key == 'T') {
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
        String message = "oh good...a new image from..." + " #" +teamName + " #" + imNameTag +time; // + " sent-" h + "-" + m + "-" + s;
        File imageFile = new File(imLoc + imName);
        StatusUpdate status = new StatusUpdate(message);
        status.setMedia(imageFile);
        
        twitter.updateStatus(status);
        println("Successfully updated the status"); 
        
      } catch(TwitterException e) {
        println("Send tweet: " + e + " Status code: " + e.getStatusCode());
      }
      ///////////////////////sendTweet
  }
}


