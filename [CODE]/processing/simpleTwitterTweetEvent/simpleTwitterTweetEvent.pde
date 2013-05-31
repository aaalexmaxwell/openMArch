///////////////////////////// Config your twitter setup here ////////////////////////////
// create twitter objects here
TwitterFactory twitterFactory;
Twitter twitter;
RequestToken requestToken;

// This is where you enter your Oauth info
static String OAuthConsumerKey = "cmQAW9VpV7wXG4HILY2bQ";
static String OAuthConsumerSecret = "lq5aSz1NgfWRo3LSAibo3bNKezX68ZCRbxkkBZuen8";
// This is where you enter your Access Token info
static String AccessToken = "583742623-IIrp4ym2qtBlvuG6d5XdmKuYVrEsuZYXhW4ocS4p";
static String AccessTokenSecret = "tqOGCweEfY8uVgdRaXtzyM7yIaoK6OVA6z6KB2zs";
///////////////////////////// End twitter config ////////////////////////////////////////

void setup() {
  ////////////////establish twitter connection
  connectTwitter();
  ////////////////establish twitter connection
  
  size(200, 200);
  noStroke();
  imageMode(CENTER);
}

void draw() {
  
  if (keyPressed == true) {
    background(255,0,0);
    ///////////////////////sendTweet
    sendTweet("https://github.com/phiLangley/openPHD #github");   
    ///////////////////////sendTweet
  } else {
    background(255);
  }

}






