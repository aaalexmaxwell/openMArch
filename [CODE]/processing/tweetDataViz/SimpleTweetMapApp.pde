UnfoldingMap map;
UnfoldingMap mapPan;

de.fhpotsdam.unfolding.geo.Location currentLocation = new de.fhpotsdam.unfolding.geo.Location(53.3775173,-1.4718849);
de.fhpotsdam.unfolding.geo.Location zoomStart = new de.fhpotsdam.unfolding.geo.Location(53.3775173,-1.4718849);

tMarker tweetMarker;
ArrayList tweetMarkerList = new ArrayList();

Table tweetTable;
Table dataTable;
int tCount;
int mCount;

String keyTag0 = "#work";
String keyTag1 = "#rest";
String keyTag2 = "#play";

int maxTweetCount=0;
int imageCount =0;
boolean startSeq = false;
PImage tweetImage;

int frameSpacing = 10;

void setup() {
  cursor(CROSS);
  //size(displayWidth-100, displayHeight-100, P2D);
  size(1300,731,P2D);
  
  String tilesStr = sketchPath("data/liveTweetLight.mbtiles");
  map = new UnfoldingMap(this, "map", 0, 0, width, height, false, false, new MBTilesMapProvider(tilesStr));
  mapPan= new UnfoldingMap(this, "mapPan", width - (height/2)-frameSpacing, (height/2)-frameSpacing, (height/2)-frameSpacing, (height/2)-frameSpacing, true, false, new Microsoft.AerialProvider());
  
  mapPan.zoomAndPanTo(currentLocation, 20);

  map.zoomAndPanTo(zoomStart, 12);
  map.setZoomRange(13, 17);

  MapUtils.createDefaultEventDispatcher(this, map, mapPan);

  getData();
  mapExTweets();
  println(width + "x" + height);
  println(width - (height/2)-frameSpacing);
  println((height/2)-frameSpacing);
  println( (height/2)-frameSpacing);
  println((height/2)-frameSpacing);
 
}

void draw() {
  background(0);

  map.draw();
  //mapPan.draw();
  
  if(startSeq==true){
    for (Marker twMarker : map.getMarkers()){
      ((tMarker)twMarker).displayTweet = false;
    }
  }
   
  if(startSeq==true){
    for (Marker twMarker : map.getMarkers()){
      int tempID = int(twMarker.getId());
      if (tempID == maxTweetCount){
        twMarker.setHidden(false);
        ((tMarker)twMarker).displayTweet = true;
        currentLocation = twMarker.getLocation();
      }
    }
  }
     
//  pushMatrix();
//    translate(width-(height/4)-frameSpacing,height-(height/4)-frameSpacing);
//    noFill();
//    stroke(0);
//    strokeWeight(8);
//    ellipse(0,0,80,80);
//    rectMode(CENTER);
//    strokeWeight(1);
//    line(0,-40,0,40);
//    line(-40,0,40,0);
//  popMatrix();
    
  if(startSeq==true){
    if (maxTweetCount>=0){
      save(imageCount+".jpg");
      imageCount++;
      maxTweetCount--;
    }
  }


}


