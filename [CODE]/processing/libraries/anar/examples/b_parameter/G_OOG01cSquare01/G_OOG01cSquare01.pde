import processing.opengl.*;
import anar.*;




/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


// import processing.opengl.*;

Obj myObj;


void setup(){
    size(800,400,OPENGL);
  Anar.init(this);

  initForm();
}


void initForm(){
  // Create a new Object to store our shape
  myObj = new Obj();

  // Create a first point with absolute coordinates
  Pt a = Anar.Pt( -60, -60);

  // Create two transformations
  Translate t1 = new Translate(120,0,0);
  Translate t2 = new Translate(0,120,0);


  // Create a first line
  Pts myLine1 = new Pts();

  // Create point b from point a with the translation t1
  Pt b = Anar.Pt(a,t1);
  myLine1.add(a);
  myLine1.add(b);

  // Copy and move the first line
  Pts myLine2 = new Pts(myLine1);
  myLine2.apply(t2);


  // Create a new Face
  Face mySquare = new Face();

  // Store the points inside our Face
  myLine2.reverse();

  mySquare.add(myLine1);
  mySquare.add(myLine2);


  // Store mySquare in our object
  myObj.add(mySquare);

  // Create Sliders based on an object
  Anar.sliders(myObj);
}

void draw(){
  background(150);
  myObj.draw();
}



// Face
// \____________________
// 0 PtABS x(-60,000) y(-60,000) z(00,000)
// \__ 1 Param -(60,000) x
// | 2 Param -(60,000) y
// 3 PtDER x(60,000) y(-60,000) z(00,000)
// \__ 0 PtABS
// | 4 Translate (01,000) (00,000) (00,000) (120,000) (00,000) (01,000) (00,000)
// (00,000) (00,000) (00,000) (01,000) (00,000) (00,000) (00,000) (00,000)
// (01,000)
// | \__ 5 PtABS x(120,000) y(00,000) z(00,000) Translation0
// | | \__ 6 Param (120,000) Translation0
// 7 PtDER x(60,000) y(60,000) z(00,000)
// \__ 8 PtDER x(60,000) y(-60,000) z(00,000)
// | \__ 3 PtDER
// | 9 Transform (01,000) (00,000) (00,000) (00,000) (00,000) (01,000) (00,000)
// (120,000) (00,000) (00,000) (01,000) (00,000) (00,000) (00,000) (00,000)
// (01,000)
// | \__ 10 Translate (01,000) (00,000) (00,000) (00,000) (00,000) (01,000)
// (00,000) (120,000) (00,000) (00,000) (01,000) (00,000) (00,000) (00,000)
// (00,000) (01,000)
// | | \__ 11 PtABS x(00,000) y(120,000) z(00,000) Translation1
// | | | \__ 12 Param (120,000) Translation1
// 13 PtDER x(-60,000) y(60,000) z(00,000)
// \__ 14 PtDER x(-60,000) y(-60,000) z(00,000)
// | \__ 0 PtABS
// | 9 Transform
