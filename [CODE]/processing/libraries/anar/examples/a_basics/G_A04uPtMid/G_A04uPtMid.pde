import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */

boolean record = false;


Obj     form;

Sliders mySliders;


void setup(){
    size(1000,500,OPENGL);
  Anar.init(this);
  Anar.drawAxis(true);

  // create a first line with 3 points
  Pts baseLine = new Pts();
  baseLine.add(Anar.Pt(0,0));
  baseLine.add(Anar.Pt(0,100));
  baseLine.add(Anar.Pt(200,0));
  Anar.main.add(baseLine);

  // for 10 iteration...
  for (int i = 0; i<10; i++){
    Pts previous = Anar.main.objEnd().lineEnd(); // based on previous line

    Pts iteration = new Pts(); // create a tmp line
    iteration.add(previous.pt(0)); // add existing points (first and ending
    // pt)

    // for each pair of points of the last line
    for (int j = 1; j<previous.numOfPts(); j++)
      iteration.add(new PtMid(previous.pt(j-1),previous.pt(j)));
    // create a pt in the middle of each two pair of points

    iteration.add(previous.ptEnd());
    iteration.stroke( (25*i)%255); // change the color while iterate

    Anar.main.add(iteration); // add the created line to main
    // ... becomes Anar.main.objEnd()
  }


  // create the sliders for the baseline
  Anar.sliders(baseLine);
}

void draw(){
  background(155);
  Anar.main.draw();
  Anar.camTarget(Anar.main.obj(0));
}


