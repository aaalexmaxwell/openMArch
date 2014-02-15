void getData(){
  
  tweetTable = loadTable("tweetData.csv", "header");
  saveTable(tweetTable, "data/tweetData.csv");
  
  println("newTableCreated");
 
  tCount = tweetTable.getRowCount();
  mCount = tweetTable.getRowCount();
  
  maxTweetCount = tweetTable.getRowCount();
  
  println("newTableSize" + tCount);
  
}

void mapExTweets(){
  
  for (int i=0; i< tweetTable.getRowCount(); i++){
    TableRow row = tweetTable.getRow(i);
    String tempUser = row.getString("@");
    double tempLat = row.getFloat("Latitude");
    double tempLon = row.getFloat("Longitude");
    String tempTime = row.getString("Time");
    String tempMessage = row.getString("Tweet");
    String tempMedia = row.getString("Media");
    boolean tempTag0=false;
    boolean tempTag1=false;
    boolean tempTag2=false;
    
    for (int j = 6; j< tweetTable.getColumnCount(); j++) {
      String tempTag = "#" + row.getString(j);
      if (tempTag.equals(keyTag0) == true){tempTag0=true;}
      if (tempTag.equals(keyTag1) == true){tempTag1=true;}
      if (tempTag.equals(keyTag2) == true){tempTag2=true;}
    }

    de.fhpotsdam.unfolding.geo.Location tweetLocation = new de.fhpotsdam.unfolding.geo.Location(tempLat, tempLon);
    tweetMarker = new tMarker(tweetLocation, tempUser, tempMessage, tempTime, tempMedia, tempTag0, tempTag1, tempTag2);
    tweetMarker.setId(str(i));
    tweetMarker.setHidden (true);
    tweetMarkerList.add(tweetMarker);

  }
  map.addMarkers(tweetMarkerList);
  tweetMarkerList.clear();
  
}

