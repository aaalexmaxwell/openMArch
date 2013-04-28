
int numBlobs = 5;

//determines the starting position PL
int[] blogPx = {50, 90, 90,50,100 };
int[] blogPy = { 50, 120, 45,24, 80 };

PGraphics pg;
int[][] vy,vx; 

void setup() {
//  smooth();
  size(640, 360);
  pg = createGraphics(160, 90, P2D);  
  ///PIXEL ARRAY [;  
  vy = new int[numBlobs][pg.height];
  vx = new int[numBlobs][pg.width];
  
}

void draw() {
  for (int i=0; i<numBlobs; ++i) {

    for (int x = 0; x < pg.width; x++) {
      vx[i][x] = int(sq(blogPx[i]-x));
    }

    for (int y = 0; y < pg.height; y++) {
      vy[i][y] = int(sq(blogPy[i]-y)); 
    }
  }

  // Output into a buffered image for reuse
  pg.beginDraw();
  pg.loadPixels();
  for (int y = 0; y < pg.height; y++) {
    for (int x = 0; x < pg.width; x++) {
      int m = 1;
      //accumulate blob specific pixel color info PL
      for (int i = 0; i < numBlobs; i++) {
        
        // Increase this number to make your blobs bigger
        m += 120000/(vy[i][y] + vx[i][x]+1);
        
      }
      
      m=m/2;
      m=(m-255)*-1;
      
      if((m<105) && (m>100)){
        pg.pixels[x+y*pg.width] = color(m*2,255,255);
      }else{
        pg.pixels[x+y*pg.width] = color(m,m,m);
      }
    }
  }
  
  pg.updatePixels();
  pg.endDraw();

  // Display the results
  image(pg, 0, 0, width, height); 

}

