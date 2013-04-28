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
  Pts.globalRender = new RenderPtsAll();

  createSimulation();
}


void createSimulation(){
  form = new Obj();


  Anar.sliders(Particle.affinityCf = new Param(2.32f, -0.5f,5));
  Anar.sliders(Particle.repulseCf = new Param(0.007f, -.001f,.02f));
  Anar.sliders(Particle.gravityCf = new Param(0.023f, -.1f,.1f));

  Particle.k            = 10.0f; // SPRING
  Particle.damp         = 0.1f; // DAMPING
  Particle.velClip      = 100;    
  

  // GRID
  // /////////////////////////////

  float w = 100;
  float h = 50;
  Particle[][] grid = new Particle[12][12];

  for (int i = 0; i<grid.length; i++)
    for (int j = 0; j<grid[i].length; j++){
      float xpos = i* (w/grid.length);
      float ypos = j* (h/grid[i].length);

      grid[i][j] = new Particle(xpos,ypos,0);
    }

  // /////////////////////////////
  // AFFINITY

  for (int i = 1; i<grid.length; i++)
    for (int j = 0; j<grid[i].length; j++)
      if(random(15)>1)
        Particle.affinity(grid[i-1][j],grid[i][j],0);

  for (int i = 0; i<grid.length; i++)
    for (int j = 1; j<grid[i].length; j++)
      Particle.affinity(grid[i][j-1],grid[i][j],0);


  // /////////////////////////////
  // PIN

  for (int i = 0; i<grid.length; i += 3){
    grid[i][0].pin = true;
    grid[i][grid[i].length-1].pin = true;
  }


  // Particle.affinity((Particle)particlePts.pt(3),(Particle)particlePts.pt(6),100);
}


void draw(){
  background(155);
  Particle.updateSim();
  Particle.drawSimulation();
}

void keyPressed(){
  Particle.simulate = Particle.simulate ? false :true;
}


