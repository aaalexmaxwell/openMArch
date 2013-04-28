import processing.opengl.*;
import anar.*;





/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */



Face a,b;

void setup(){
    size(800,400,OPENGL);
  Anar.init(this);
  Anar.drawAxis();
  
  a = new Rect(10,20).translateY(100);
  b = a.copy().apply(new MirrorY());  
  
  //Register Property (name and default value)
  Anar.registerProperty("score",10f);
  Anar.registerProperty("something",2f);
  Anar.registerProperty("third",null);
  
  
  //Add properties to objects
  //   Note: second a.score override the first one
  a.setProperty("score",10f);
  b.setProperty("score",20f);
  a.setProperty("score",11f);
  a.setProperty(0,12f);       //or call it by index
  a.setProperty("something",10f);
  a.setProperty(1,10f);
  a.setProperty("third","crazyNode!");
  b.setProperty("third",a);
  
  //You need to remember what was your type
  //  Note: Casting with float (lower case) doesn't work
  float f = (Float)a.getProperty("score");
  float v = (Float)b.getProperty(0);        //Using index is faster (maybe enums here?)
  
  //This will return the default value instead
  float w = (Float)b.getProperty("something");
  
  println(a.getProperty("third"));
  
  //Convince ourself that it is numbers
  println(">>>>>"+(f+v+w));
  
  
  a.printProperties();
  b.printProperties();
  
  Anar.sliders(b);
  Anar.println(Anar.sliders);
  
//    Parametric.printProperties();
}

void draw(){
  background(150);
  a.draw();
  b.draw();
}




