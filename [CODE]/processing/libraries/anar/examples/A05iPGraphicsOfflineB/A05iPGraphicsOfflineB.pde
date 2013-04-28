import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */


void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  Anar.drawAxis();
  Scene.gradientBackground = true;
  Anar.add(new Face(Anar.Pt(0),Anar.Pt(100),Anar.Pt(0,100)));

}



float div = 1.1f;

void draw(){
  background(200);
  Anar.draw();
  Anar.screenDrawBegin();
  
  stroke(155,150);
  for (int i=0; i<20; i++)
  	line(width/2-width/(2*div)+random(width/div)
  			,height/2-height/(2*div)+random(height/div)
  			,width/2-width/(2*div)+random(width/div)
  			,height/2-height/(2*div)+random(height/div));
  
  Anar.screenDrawEnd();
  Anar.draw();
}


void keyPressed(){

}


