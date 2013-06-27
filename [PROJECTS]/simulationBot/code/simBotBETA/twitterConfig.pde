////////////////////////////////////////////////////////////////////////////////////
///////////////////////////// Config twitter stream setup here ////////////////////////////
//// create twitterStream object
TwitterStream twitterStream = new TwitterStreamFactory().getInstance();
//// create twittertWEET object
Twitter twitterTweet = new TwitterFactory().getInstance();
//// define access codes
static String OAuthConsumerKey = "JSnZ0NdCQvCAAaDdVSdIw";
static String OAuthConsumerSecret = "xDgfjqsi83LyEsQuBbOFG9skc4g8ieVnDO0ZH5fJCfs";
static String AccessToken = "1490165892-1awck08TTO9YwaJqFtNIG0eZyZfCH9rIgSSdy9L";
static String AccessTokenSecret = "GjYO8tC8YhEpAaAXZTlumVZQi9bMu2bSOv2wDON2r8";
///////////////////////////// End twitter config ////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

void connectTwitter() {
  AccessToken accessToken = loadAccessToken();
  //connect twitterStream
  twitterStream.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  twitterStream.setOAuthAccessToken(accessToken);
  twitterStream.addListener(listener);
  twitterStream.filter(new FilterQuery().track(keywords));
  println("stream connected");
  ////connect twitterTweet
  twitterTweet.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  twitterTweet.setOAuthAccessToken(accessToken);
  println("tweet connected");
}

// Loading up the access token
private static AccessToken loadAccessToken() {
  return new AccessToken(AccessToken, AccessTokenSecret);
}
