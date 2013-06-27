/////////STREAM TWEETS
String[] keywords = {"#simBotBETA"};
String imgUrl = null;
String imgPage = null;

StatusListener listener = new StatusListener() { 
  
  public void onStatus(Status status) {
  
  int index= 0;
  for (int i=1; i<nTeams; i++){
    index=nTeams-i;
    tweetCollector.tweetText[index] = tweetCollector.tweetText[index-1];
  }
  tweetCollector.tweetText[0] = status.getText();

  reMakeTeams = true;

  }
  
  public void onStallWarning(StallWarning stallWarning){
//    System.out.println(stallWarning);
  }
  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {}
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {}
  public void onScrubGeo(long userId, long upToStatusId) {
//    System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }
  public void onException(Exception ex) {
//    ex.printStackTrace();
  }
};
