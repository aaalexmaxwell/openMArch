//import de.fhpotsdam.unfolding.utils.*;
//import de.fhpotsdam.unfolding.marker.*;
//import de.fhpotsdam.unfolding.*;
//import de.fhpotsdam.unfolding.data.*;
//import de.fhpotsdam.unfolding.geo.*;
//import de.fhpotsdam.unfolding.providers.*;
//import java.util.List;

UnfoldingMap map;
UnfoldingMap mapPan;
tMarker tweetMarker;

ArrayList tweetConnectionList = new ArrayList();
ArrayList tweetMarkerList = new ArrayList();

de.fhpotsdam.unfolding.geo.Location currentLocation = new de.fhpotsdam.unfolding.geo.Location(53.3769, -1.4654);
de.fhpotsdam.unfolding.geo.Location zoomStart = new de.fhpotsdam.unfolding.geo.Location(53.3795, -1.4519);

de.fhpotsdam.unfolding.geo.Location sLocation;
de.fhpotsdam.unfolding.geo.Location eLocation;

Table tweetTable;
Table dataTable;
int tCount;
int mCount;

boolean hold = true;
boolean sendTweet = false;

int frameSpacing = 10;

void setup() {
  cursor(CROSS);
  size(displayWidth-100, displayHeight-100, P2D);
  
  connectTwitter();
  
  String tilesStr = sketchPath("data/liveTweetDark.mbtiles");
  map = new UnfoldingMap(this, "map",  0,0,width, height, false, false, new  MBTilesMapProvider(tilesStr));
  
  mapPan= new UnfoldingMap(this, "mapPan", width - (height/2)-frameSpacing, (height/2)-frameSpacing, (height/2)-frameSpacing, (height/2)-frameSpacing, true, false, new Microsoft.AerialProvider());
  //mapPan= new UnfoldingMap(this, "mapPan", width - (height/2)-frameSpacing, (height/2)-frameSpacing, (height/2)-frameSpacing, (height/2)-frameSpacing, true, false, new OpenStreetMap.OpenStreetMapProvider());
  
  mapPan.zoomAndPanTo(currentLocation, 20);
  mapPan.setTweening(true);
  
  map.zoomAndPanTo(zoomStart, 14);
  map.setZoomRange(13, 17);
  float maxPanningDistance = 1.5; // in km
  map.setPanningRestriction(zoomStart, maxPanningDistance);
  
  MapUtils.createDefaultEventDispatcher(this, map, mapPan);
  
  getData();
  mapExTweets();
  getConnections();
  
}

void draw() {
  background(0);
  
  hold = true; 

    map.draw();
    mapPan.draw();
    
    if (sendTweet==true){
      //tweetNewImage();
      sendTweet=false;
    }
    if (frameCount % 120 == 0) {
      mapPan.zoomAndPanTo(currentLocation, 18);
    }  
    
  hold = false; 
  
  String test;  
}

void mouseReleased() {
 
  for (Marker tweetMarker : map.getMarkers()) {
    tweetMarker.setSelected(false); 
  }
  
  Marker tweetMarker = map.getFirstHitMarker(mouseX, mouseY);
  if (tweetMarker != null) {
    tweetMarker.setSelected(true);
    currentLocation = tweetMarker.getLocation();
    
//     if (tweetMarker instanceof tMarker) {
//      String temp = ((tMarker) tweetMarker).userName;
//      println(temp);
//    }
  }
}

void getConnections(){
  double tempDist;
  for (Marker sTweetMarker : map.getMarkers()) {
    sLocation = sTweetMarker.getLocation();
    for (Marker eTweetMarker : map.getMarkers()) {
      eLocation = eTweetMarker.getLocation();
      tempDist = de.fhpotsdam.unfolding.utils.GeoUtils.getDistance(sLocation, eLocation);
      if ((tempDist<0.25)&&(tempDist!=0)){
        SimpleLinesMarker m = new SimpleLinesMarker(sLocation, eLocation);
        int col = int(400-(((float)tempDist)*1000));
        println(col);
        int weight = int((255-((float)tempDist))/100);
        m.setColor(255);
        m.setStrokeWeight (1);
        //println(weight);
        tweetConnectionList.add(m);  
      }
    }
  }
  
  map.addMarkers(tweetConnectionList);
  map.addMarkers(tweetMarkerList);
}

