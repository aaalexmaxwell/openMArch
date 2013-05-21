/*
SimpleTwitterStreaming
 Developed by: Michael Zick Doherty
 2011-10-18
 http://neufuture.com
 
 
 */

///////////////////////////// Config your setup here! ////////////////////////////

// This is where you enter your Oauth info
static String OAuthConsumerKey = "cmQAW9VpV7wXG4HILY2bQ";
static String OAuthConsumerSecret = "lq5aSz1NgfWRo3LSAibo3bNKezX68ZCRbxkkBZuen8";
// This is where you enter your Access Token info
static String AccessToken = "583742623-0OJhVh9R97ac3lIRoygfbexSMXshLkrDrTxHReTH";
static String AccessTokenSecret = "9rJgkfMRW3EDVYJ0kll3sXCXtysRdIaJ2UYlvPSN0";

// if you enter keywords here it will filter, otherwise it will sample
String[] keywords = {
  "#lfc"
};


///////////////////////////// End Variable Config ////////////////////////////

TwitterStream twitter = new TwitterStreamFactory().getInstance();
PImage img;
boolean imageLoaded;

void setup() {
  size(800, 600);
  noStroke();
  imageMode(CENTER);
  
  println(keywords);

  connectTwitter();
  twitter.addListener(listener);
  if (keywords.length==0) twitter.sample();
  else twitter.filter(new FilterQuery().track(keywords));
  background(0);
}

void draw() {
  
  //background(0);
  if (imageLoaded) image(img, width/2, height/2);
}

// Initial connection
void connectTwitter() {
  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  AccessToken accessToken = loadAccessToken();
  twitter.setOAuthAccessToken(accessToken);
}

// Loading up the access token
private static AccessToken loadAccessToken() {
  return new AccessToken(AccessToken, AccessTokenSecret);
}

// This listens for new tweet
StatusListener listener = new StatusListener() {
  public void onStatus(Status status) {

    //println("@" + status.getUser().getScreenName() + " - " + status.getText());
    
    String tweetText = status.getText();
    println(tweetText);
    fill(255,255,255);
    textSize(10);
    text(tweetText, 100, 20);
  
    String imgUrl = null;
    String imgPage = null;

    // Checks for images posted using twitter API

    if (status.getMediaEntities() != null) {
      imgUrl= status.getMediaEntities()[0].getMediaURL().toString();
    }

    if (imgUrl != null) {

      println("found image: " + imgUrl);

      // hacks to make image load correctly

      if (imgUrl.startsWith("//")){
        println("s3 weirdness");
        imgUrl = "http:" + imgUrl;
      }
      if (!imgUrl.endsWith(".jpg")) {
        byte[] imgBytes = loadBytes(imgUrl);
        saveBytes("tempImage.jpg", imgBytes);
        imgUrl = "tempImage.jpg";
      }

      println("loading " + imgUrl);
      img = loadImage(imgUrl);
      imageLoaded = true;
    }
  }

  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
    //System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
  }
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
    //  System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
  }
  public void onScrubGeo(long userId, long upToStatusId) {
    System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }

  public void onException(Exception ex) {
    ex.printStackTrace();
  }
};


