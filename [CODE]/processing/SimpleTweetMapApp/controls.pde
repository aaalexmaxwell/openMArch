void keyReleased() {
  if (key == 't' || key == 'T') {
    tweetNewImage();
  }
  
  if (key =='s' || key =='S'){
    twitterStreams();
  }

}

//void mouseReleased() {
//
//  for (Marker tweetMarker : map.getMarkers()) {
//    tweetMarker.setSelected(false);
//  }
//
//  Marker tweetMarker = map.getFirstHitMarker(mouseX, mouseY);
//  if (tweetMarker != null) {
//    tweetMarker.setSelected(true);
//    currentLocation = tweetMarker.getLocation();
//  }
//}


