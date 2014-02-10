/////////STREAM TWEETS
String[] keywords = {"studioopendata"};
double[][] locations = {{51.4, -0.13}, {51.6, -0.11}};
String imgUrl = null;
String imgPage = null;

void twitterStreams(){
  twitterStream.addListener(listener);
  twitterStream.filter(new FilterQuery().track(keywords));
//  twitterStream.filter(new FilterQuery().locations(locations));
}

StatusListener listener = new StatusListener() { 
  int count=0;
  public void onStatus(Status status) {
    
      println("Location: " + status.getGeoLocation());
      println("Time: " + status.getCreatedAt());
      println("@" + status.getUser().getScreenName() + ":" + status.getText());
      
  }
  
  public void onStallWarning(StallWarning stallWarning){}
  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {}
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {}
  public void onScrubGeo(long userId, long upToStatusId) {}
  public void onException(Exception ex) {}
};
