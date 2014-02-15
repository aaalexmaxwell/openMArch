/////////STREAM TWEETS
String[] keywords = {"#studioOD"};
//double[][] locations = {{51.4, -0.13}, {51.6, -0.11}};
String imgUrl = null;
String imgPage = null;

String keyTag0 = "#work";
String keyTag1 = "#rest";
String keyTag2 = "#play";

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
    
       tCount++;
    
//////GET GEO DATA AND ADD MAP MARKER//////////////////////////////////////////////////////////
//////GET GEO DATA AND ADD MAP MARKER//////////////////////////////////////////////////////////
      float tweetLat = 53.3762906; 
      float tweetLong = -1.4737242;
      
      if (status.getGeoLocation() != null){
        println("//////FOUND GEO-LOCATION/////");
        tweetLat = (float)status.getGeoLocation().getLatitude();
        tweetLong = (float)status.getGeoLocation().getLongitude();
//      } else {
        //float tweetLat = random(53.3724,53.3897);
        //float tweetLong = random(-1.4850,-1.4540);
      }

      String userName = "@" + status.getUser().getScreenName();
      String userMessage = status.getText();
      String userTime = "" + status.getCreatedAt();
      String userMedia = "";
      for (MediaEntity mediaEntity : status.getMediaEntities()) {
        userMedia = str(tCount);
      }
      
      for (HashtagEntity hashtags : status.getHashtagEntities()) {
        String tempTag = "#" + hashtags.getText();
        if (tempTag.equals(keyTag0)== true){tag0=true;}
        if (tempTag.equals(keyTag1)== true){tag1=true;}
        if (tempTag.equals(keyTag2)== true){tag2=true;}
      }
      
      de.fhpotsdam.unfolding.geo.Location tweetLocation = new de.fhpotsdam.unfolding.geo.Location(tweetLat,tweetLong );
      tweetMarker = new tMarker(tweetLocation, userName, userMessage, userTime, userMedia, tag0, tag1, tag2);
      println(tag0, tag1, tag2);
      tweetMarker.setId(str(tCount-1));
      //println("newTweetID " + tweetMarker.getId());
      tweetMarkerList.add(tweetMarker);  
            
//////EXTRACT DATA AND ADD TO TABLE////////////////////////////////////////////////////////////
//////EXTRACT DATA AND ADD TO TABLE////////////////////////////////////////////////////////////

      String Lat = str(tweetLat);
      String Long = str(tweetLong);
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
      
      //println("newTweet " + tCount);
      saveTable(tweetTable, "data/tweetData.csv");

//////IF THE MAP IS NOT BEING DRAWN, ADD THE MARKER TO THE MAP/////////////////////////////////
//////IF THE MAP IS NOT BEING DRAWN, ADD THE MARKER TO THE MAP/////////////////////////////////
      if(hold!=true){ 
        
        map.addMarkers(tweetMarkerList);
        tweetMarkerList.clear();
        sendTweet=true;
        //println("newMarker " + mCount);
        mCount++;
      }
      
  }

  public void onStallWarning(StallWarning stallWarning){}
  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {}
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {}
  public void onScrubGeo(long userId, long upToStatusId) {}
  public void onException(Exception ex) {}

};

