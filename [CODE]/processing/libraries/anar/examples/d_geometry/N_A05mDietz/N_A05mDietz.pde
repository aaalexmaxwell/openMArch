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
//    Anar.useCameraQuat();
  createGeometry();
}


void createGeometry(){
  Anar.mainReset();
  Anar.slidersReset();
  
  Param alpha = new Param(2*PI,0,6*PI,2*PI).tag("alpha").addToSlidersMain();
  Param width = new Param(100,0,200).tag("width").addToSlidersMain();
  Param theta = new Param(4*PI,0,4*PI,2*PI).tag("theta").addToSlidersMain();
  Param radiu = new Param(30).tag("radiu").addToSlidersMain();
  Param gamma = new Param(0,0,2*PI).tag("gamma").addToSlidersMain();
  Param gamm2 = new Param(0,0,2*PI).tag("gamm2").addToSlidersMain();
  Param space = new Param(0,0,50).tag("space").addToSlidersMain();

  
  
  
  
  println(alpha.getClass().getConstructors());
  println("---------------------------------(Anotation)");
  println(alpha.getClass().getDeclaredAnnotations());
  println("---------------------------------(FIELDS)");
  println(alpha.getClass().getDeclaredFields());
  println("---------------------------------(METHODS)");
  println(alpha.getClass().getDeclaredMethods());
  println("---------------------------------(CLASS)");
  println(alpha.getClass().getDeclaringClass()); 
  println("---------------------------------(ENUM)");
  println(alpha.getClass().getEnumConstants());   
  println("---------------------------------(FIELDS)");
  println(alpha.getClass().getFields());
  println("---------------------------------(METHODS)");
  println(alpha.getClass().getMethods());
  println("---------------------------------(METHODS)");
  println(alpha.getClass().getMethods()[1].getParameterTypes());
  println("---------------------------------(SECUTITY)");
  println(alpha.getClass().getProtectionDomain());
  println("---------------------------------(JAVA)");
  println(System.getProperties());
  println("---------------------------------(JAVA)");
  println(System.getenv());
  println("---------------------------------(JAVA)");
  println(System.getenv("LOGONSERVER"));
  println(System.getenv("HOMEPATH"));
  println(System.getenv("USERNAME"));
  println(System.getenv("COMPUTERNAME"));
  println(System.identityHashCode(System.getenv()));  
  println("---------------------------------(JAVA)");


  
  
  Param inver = new Param(0,0,PI).tag("inver").addToSlidersMain();

  Face round = new Circle(radiu,10).rotateZ(gamma).rotateY(PI/2).translateY(radiu).translateY(space).rotateX(gamm2);

  int steps = 48*2;
  Param ialpha = alpha.divide(steps);
  Param itheta = theta.divide(steps);
  
  Obj circles = new Obj();
  for(int i=0; i<steps; i++)
    circles.add(round.copy().rotateX(ialpha.multiply(i)).translateY(width).rotateZ(itheta.multiply(i)));
  
  Obj path = new Obj();    
  for(int i=0; i<steps; i++)
    path.add(new SweepTwoPaths(circles.face(i),circles.faceMod(i+1)).fill(AColor.newHSB(255/(float)steps*i,100,255,150)));
  
//    for(int i=0; i<path.numOfFaces()/2;i++)
//      path.face(i).rotateX(inver).rotateZ(inver);
  
  Anar.add(path);
  Anar.camTarget();
}




void draw(){
  background(155);
  
  Anar.draw();
  Anar.camTarget();
}


void keyPressed(){
  createGeometry();
}


