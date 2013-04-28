PImage img;

float[] x = {};
float[] y = {};
float[] d = {};
int[] c = {};

void setup() {
  size(1000,600);
  background(0);
  img = loadImage("sheffield.jpg");
}
 
void draw() {
  background(0);
  for( int xx=0; xx<width && (x.length > 0); xx=xx+1 ) {
    for( int yy=0; yy<height; yy=yy+1 ) {
      int idx = 0;
      float dd;
      dd = dist(x[0],y[0],xx,yy);
      for( int i=1; i<d.length; i++ ) {
        float d0 = dist(x[i],y[i],xx,yy);
        if( dd > d0 ) {
          dd = d0;
          idx = i;
        }
      }
      set(xx,yy,c[idx]);
    }
  }
  noStroke();
  for( int i=0; i<x.length; i++ ) {
    ellipse(x[i],y[i],10,10);
  }
  tint(255, 50);
  image(img, 0,0);

}
 
void mousePressed() {
  x = append(x,mouseX);
  y = append(y,mouseY);
  d = append(d,0);
  c = append(c,color(random(255),random(255),random(255)));
}

