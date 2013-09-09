float[][] points = new float[3][2];

      
void setup(){
  size (400, 400);

 
}

void draw(){
  
  points[0][0] = 120; // first point, x
  points[0][1] = 230; // first point, y
  points[1][0] = 150; // second point, x
  points[1][1] = 105; // second point, y
  points[2][0] = mouseX; // third point, x
  points[2][1] = mouseY; // third point, y
  
  Voronoi myVoronoi = new Voronoi(points);
  MPolygon[] myRegions = myVoronoi.getRegions();
  
  for(int i=0; i<myRegions.length; i++)
  {
    // an array of points
    float[][] regionCoordinates = myRegions[i].getCoords();
    
    fill(255,0,0);
    myRegions[i].draw(this); // draw this shape
  }
}
