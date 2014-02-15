UnfoldingMap map;
UnfoldingMap mapPan;

de.fhpotsdam.unfolding.geo.Location currentLocation = new de.fhpotsdam.unfolding.geo.Location(53.3762906,-1.4737242);
de.fhpotsdam.unfolding.geo.Location zoomStart = new de.fhpotsdam.unfolding.geo.Location(53.3762906,-1.4737242);

de.fhpotsdam.unfolding.geo.Location sLocation;
de.fhpotsdam.unfolding.geo.Location eLocation;

tMarker tweetMarker;

ArrayList tweetConnectionList = new ArrayList();
ArrayList tweetMarkerList = new ArrayList();

Table tweetTable;
Table dataTable;
int tCount;
int mCount;

PImage tweetImage;

boolean hold = true;
boolean sendTweet = false;

int frameSpacing = 10;

void setup() {
  cursor(CROSS);
  size(displayWidth-100, displayHeight-100, P2D);

  connectTwitter();
  twitterStreams();
  
  String tilesStr = sketchPath("data/liveTweetLight.mbtiles");
  map = new UnfoldingMap(this, "map", 0, 0, width, height, false, false, new  MBTilesMapProvider(tilesStr));
  mapPan= new UnfoldingMap(this, "mapPan", width - (height/2)-frameSpacing, (height/2)-frameSpacing, (height/2)-frameSpacing, (height/2)-frameSpacing, true, false, new Microsoft.AerialProvider());
  
  
  mapPan.zoomAndPanTo(currentLocation, 20);
  mapPan.setTweening(true);

  map.zoomAndPanTo(zoomStart, 15);
  map.setZoomRange(13, 17);
  //float maxPanningDistance = 1.5; // in km
  //map.setPanningRestriction(zoomStart, maxPanningDistance);

  MapUtils.createDefaultEventDispatcher(this, map, mapPan);

  getData();
  mapExTweets();
  getCurrentTweet();
}

void draw() {
  background(0);
  
  
  hold = true; 
    getCurrentTweet();
    map.draw();
    mapPan.draw();
    if (sendTweet==true) {
      tweetNewImage();
      sendTweet=false;
    }
    if (frameCount % 120 == 0) {
      mapPan.zoomAndPanTo(currentLocation, 18);
    }  
  hold = false; 

  pushMatrix();
    translate(width-(height/4)-frameSpacing,height-(height/4)-frameSpacing);
    noFill();
    stroke(0);
    strokeWeight(8);
    ellipse(0,0,80,80);
    rectMode(CENTER);
    strokeWeight(1);
    line(0,-40,0,40);
    line(-40,0,40,0);
  popMatrix();
}

