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

String teamName = "teamNameGoesHere";

void setup() {
  ////////////////establish twitter connection
  connectTwitter();
  ////////////////establish twitter connection 
  size(200, 200);
  noStroke();

}

void draw() {
  background(random(255),random(255),random(255));
}



