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
