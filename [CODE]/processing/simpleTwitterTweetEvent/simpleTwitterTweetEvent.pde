import twitter4j.conf.*;
import twitter4j.internal.async.*;
import twitter4j.internal.org.json.*;
import twitter4j.internal.logging.*;
import twitter4j.json.*;
import twitter4j.internal.util.*;
import twitter4j.management.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import twitter4j.util.*;
import twitter4j.internal.http.*;
import twitter4j.*;
import twitter4j.internal.json.*;

///////////////////////////// Config your setup here! ////////////////////////////

// This is where you enter your Oauth info
static String OAuthConsumerKey = "cmQAW9VpV7wXG4HILY2bQ";
static String OAuthConsumerSecret = "lq5aSz1NgfWRo3LSAibo3bNKezX68ZCRbxkkBZuen8";
// This is where you enter your Access Token info
static String AccessToken = "583742623-IIrp4ym2qtBlvuG6d5XdmKuYVrEsuZYXhW4ocS4p";
static String AccessTokenSecret = "tqOGCweEfY8uVgdRaXtzyM7yIaoK6OVA6z6KB2zs";

///////////////////////////// End Variable Config ////////////////////////////

//TwitterStream twitter = new TwitterStreamFactory().getInstance();
TwitterFactory twitterFactory;
Twitter twitter;
RequestToken requestToken;


void setup() {
  size(200, 200);
  noStroke();
  imageMode(CENTER);
 
  connectTwitter();

}

void draw() {
  
  if (keyPressed == true) {
    background(255,0,0);
    sendTweet("https://github.com/phiLangley/openPHD #github");
    //Status status = twitter.updateStatus("https://github.com/phiLangley/openPHD");
    
  } else {
    background(255);
  }

}

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

// Sending a tweet
void sendTweet(String t) {
 
  try {
    Status status = twitter.updateStatus(t);
    println("Successfully updated the status to [" + status.getText() + "].");
  } catch(TwitterException e) {
    println("Send tweet: " + e + " Status code: " + e.getStatusCode());
  }
 
}




