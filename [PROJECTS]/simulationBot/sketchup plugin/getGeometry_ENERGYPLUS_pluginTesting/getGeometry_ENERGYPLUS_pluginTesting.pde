import rad.*;
import pso.*;
import lsys.*;
import anar.*;
import voronoi.*;

void setup(){
  ////////////////establish twitter connection
  connectTwitter();
  ////////////////establish twitter connection 
  size(800,400, OPENGL);
  Anar.init(this,false);
  Anar.drawAxis(true);
  //Face.globalRender = new RenderFaceNormal(new AColor(255,100),new AColor(100));
  
  EnergyPlus.idealZoneHVAC = true;
  EnergyPlus.keepPlotWindow = false;
  
  initForm();
  //Anar.drawReferenceFrame();
  Anar.drawGeoReference();
}

void draw(){
  background(155);
  displayResult();
  fullModel.draw();
  if (sendTweet==true){
    sendTweet();
    sendTweet=false;
  }
}





