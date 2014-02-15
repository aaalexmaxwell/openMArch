// The factory instance is re-useable and thread safe.

void twitterSearches(){
  
  //Query query = new Query("(#climate) AND (#studioOD)");
  Query query = new Query("#studioOD");
  query.since("2014-02-11");
  query.setCount(maxTweets);
  query.resultType("ALL");
  
  tweetTable.addColumn("@");
  tweetTable.addColumn("Latitude");
  tweetTable.addColumn("Longitude");
  tweetTable.addColumn("Time");
  tweetTable.addColumn("Tweet");
  tweetTable.addColumn("Media");
  
  try {

    QueryResult result = twitterSearch.search(query);
    int ind = 0;
    
    ////return tweets from first page of the search   
    for (Status status : result.getTweets()) {
      String Lat = "";
      String Long = " ";
      String ID = "@" + status.getUser().getScreenName();
      
      if (status.getGeoLocation() != null){
        Lat = " " + status.getGeoLocation().getLatitude();
        Long = " " + status.getGeoLocation().getLongitude();
        Lat = trim(Lat); 
        Long = trim(Long); 
      }
      String Time = "Time: " + status.getCreatedAt();
      String Twt = status.getText();
      String hTag = "";


      TableRow newRow = tweetTable.addRow();
      newRow.setString("@",ID); 
      newRow.setString("Latitude", Lat);
      newRow.setString("Longitude",Long);
      newRow.setString("Time",Time);
      newRow.setString("Tweet",Twt);
      
      println("Location: " + status.getGeoLocation());
      println("Time: " + status.getCreatedAt());
      println("@" + status.getUser().getScreenName() + ":" + status.getText());
      
      /////get hashtags from tweets     
//      for (HashtagEntity hashtags : status.getHashtagEntities()) {
//        hTag = hTag +"#" + hashtags.getText() + ", ";
//        //println(hTag);
//      }
//      newRow.setString("Tags",hTag);

      int tagCount=0;
      for (HashtagEntity hashtags : status.getHashtagEntities()) {
        hTag = hashtags.getText();
        newRow.setString("Tags"+tagCount,hTag);
        tagCount++;
        //println(hTag);
      }
      
      /////get images from tweets
      String imgUrl = null;
      String imgPage = null;
      
      for (MediaEntity mediaEntity : status.getMediaEntities()) {
        imgUrl = mediaEntity.getMediaURL();
        //println(imgUrl);           
        //println(ind);  
        byte[] imgBytes = loadBytes(imgUrl);
        saveBytes("data/" + ind + ".jpg", imgBytes);
        newRow.setInt("Media",ind);
      }

    ind = ind+1;

    }
    
    ////return tweets from additinal pages of the search
    for (int i = 1; i<(numTweets/maxTweets); i++){    
      if(result.hasNext()){
        //println("TRUE");
        query = result.nextQuery();
        result = twitterSearch.search(query);
        for (Status status : result.getTweets()) {
          String Lat = "";
          String Long = " ";
          String ID = "@" + status.getUser().getScreenName();
          if (status.getGeoLocation() != null){
            Lat = " " + status.getGeoLocation().getLatitude();
            Long = " " + status.getGeoLocation().getLongitude();
            Lat = trim(Lat); 
            Long = trim(Long); 
          }
          String Time = "Time: " + status.getCreatedAt();
          String Twt = status.getText();
          String hTag = "";
          
          TableRow newRow = tweetTable.addRow();
          newRow.setString("@",ID); 
          newRow.setString("Latitude", Lat);
          newRow.setString("Longitude",Long);
          newRow.setString("Time",Time);
          newRow.setString("Tweet",Twt);
          
          println("Location: " + status.getGeoLocation());
          println("Time: " + status.getCreatedAt());
          println("@" + status.getUser().getScreenName() + ":" + status.getText());
          
          /////get hashtags from tweets     
          int tagCount=0;
          for (HashtagEntity hashtags : status.getHashtagEntities()) {
            hTag = hashtags.getText();
            newRow.setString("Tags"+tagCount,hTag);
            tagCount++;
            //println(hTag);
          }
           
          /////get images from tweets
          String imgUrl = null;
          String imgPage = null;
          
          for (MediaEntity mediaEntity : status.getMediaEntities()) {
            imgUrl = mediaEntity.getMediaURL();
            //println(imgUrl);           
            //println(ind);  
            byte[] imgBytes = loadBytes(imgUrl);
            saveBytes("data/" + ind + ".jpg", imgBytes);
            newRow.setInt("Media",ind);
          }
    
          ind = ind+1;
          
        }
      }
    }
      
  }catch(TwitterException e) {
      println("noTweets");
  }
  
  saveTable(tweetTable, "data/tweetData.csv");
  println("csv exported....");
  background(0,255,0);
 
}



  

  
