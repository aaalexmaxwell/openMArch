/////////STREAM TWEETS
String[] keywords = {"#lfc"};
//double[][] locations = {{51.4, -0.13}, {51.6, -0.11}};
String imgUrl = null;
String imgPage = null;

String keyTag0 = "0";
String keyTag1 = "1";
String keyTag2 = "2";

boolean tag0 = false;
boolean tag1 = false;
boolean tag2 = false;


void twitterStreams(){
  twitterStream.addListener(listener);
  twitterStream.filter(new FilterQuery().track(keywords));
//  twitterStream.filter(new FilterQuery().locations(locations));

}

StatusListener listener = new StatusListener() { 
  
  public void onStatus(Status status) {
    
//////GET GEO DATA AND ADD MAP MARKER//////////////////////////////////////////////////////////
//////GET GEO DATA AND ADD MAP MARKER//////////////////////////////////////////////////////////

//      if (status.getGeoLocation() != null){
//       double tweetLat = status.getGeoLocation().getLatitude();
//       double tweetLong = status.getGeoLocation().getLongitude();
//       de.fhpotsdam.unfolding.geo.Location tweetLocation = new de.fhpotsdam.unfolding.geo.Location(tweetLat, tweetLong);
//       tweetMarker = new SimplePointMarker(tweetLocation);
//       println("tweet " + tCount);
//      }

      float ranLat = random(53.37,53.39);
      float rnLon = random(-1.49,-1.45);
      String userName = "@" + status.getUser().getScreenName();
      String userMessage = status.getText();
      String userTime = "" + status.getCreatedAt();
      String userMedia = "";
      for (MediaEntity mediaEntity : status.getMediaEntities()) {
        userMedia = str(tCount);
      }
      
      for (HashtagEntity hashtags : status.getHashtagEntities()) {
        if (hashtags.getText()== keyTag0){tag0=true;}
        if (hashtags.getText()== keyTag1){tag1=true;}
        if (hashtags.getText()== keyTag2){tag2=true;}
      }
      
      de.fhpotsdam.unfolding.geo.Location tweetLocation = new de.fhpotsdam.unfolding.geo.Location(ranLat,rnLon );
      tweetMarker = new tMarker(tweetLocation, userName, userMessage, userTime, userMedia, tag0, tag1, tag2);
      tweetMarker.setId(str(tCount));
      tweetMarkerList.add(tweetMarker);  
      
//////IT THE MAP IS NOT BEING DRAWN, ADD THE MARKER TO THE MAP/////////////////////////////////
//////IT THE MAP IS NOT BEING DRAWN, ADD THE MARKER TO THE MAP/////////////////////////////////

//////IT THE MAP IS NOT BEING DRAWN, ADD THE MARKER TO THE MAP/////////////////////////////////
//////IT THE MAP IS NOT BEING DRAWN, ADD THE MARKER TO THE MAP/////////////////////////////////
      if(hold!=true){
        currentLocation = tweetLocation;
        map.addMarkers(tweetMarkerList);
        //mapPan.addMarkers(tweetMarkerList);
        sendTweet=true;
        println("marker " + mCount);
        mCount++;
      }     
//////GET GEO DATA AND ADD MAP MARKER//////////////////////////////////////////////////////////
//////GET GEO DATA AND ADD MAP MARKER//////////////////////////////////////////////////////////
      
//////EXTRACT DATA AND ADD TO TABLE////////////////////////////////////////////////////////////
//////EXTRACT DATA AND ADD TO TABLE////////////////////////////////////////////////////////////

      String Lat = str(ranLat);
      String Long = str(rnLon);
      
      String ID = "@" + status.getUser().getScreenName();
      
      if (status.getGeoLocation() != null){
        Lat = " " + status.getGeoLocation().getLatitude();
        Long = " " + status.getGeoLocation().getLongitude();
        Lat = trim(Lat); 
        Long = trim(Long); 
      }
      
      String Time = "" + status.getCreatedAt();
      String Twt = status.getText();
      String hTag = "";
      
      TableRow newRow = tweetTable.addRow();
      newRow.setString("@",ID); 
      newRow.setString("Latitude", Lat);
      newRow.setString("Longitude",Long);
      newRow.setString("Time",Time);
      newRow.setString("Tweet",Twt);
      
      /////get hashtags from tweets     
      int tagCount=0;
      for (HashtagEntity hashtags : status.getHashtagEntities()) {
        hTag = hashtags.getText();
        newRow.setString("Tag"+tagCount,hTag);
        tagCount++;
      }    

      
      /////get images from tweets
      String imgUrl = null;
      String imgPage = null;
      
      for (MediaEntity mediaEntity : status.getMediaEntities()) {
        imgUrl = mediaEntity.getMediaURL();
        byte[] imgBytes = loadBytes(imgUrl);
        saveBytes("data/" + tCount + ".jpg", imgBytes);
        newRow.setInt("Media",tCount);
      }
      
      println("tweet " + tCount);
      tCount++;
      saveTable(tweetTable, "data/tweetData.csv");
     
//////EXTRACT DATA AND ADD TO TABLE////////////////////////////////////////////////////////////
//////EXTRACT DATA AND ADD TO TABLE////////////////////////////////////////////////////////////   
  }

  public void onStallWarning(StallWarning stallWarning){}
  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {}
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {}
  public void onScrubGeo(long userId, long upToStatusId) {}
  public void onException(Exception ex) {}

};

