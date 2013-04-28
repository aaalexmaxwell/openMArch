import anar.*;
import processing.opengl.*;
import traer.physics.*;
import traer.anar.*;

Sim sim = new Sim(1,0.1f);
Obj mesh;

void setup(){
  size(1000,500,OPENGL);
  Anar.init(this);
  Anar.drawAxis(true);
  Pts.globalRender = new RenderPtsAll();
  createSimulation();
  sim.useGlobalAttractorValue = true;
}

void createSimulation(){
  PowerPt[][] particles = new PowerPt[10][10];

  Obj grid = new Obj();

  //Create Particles (in Grid)
  for(int i=0; i<particles.length; i++)
    for(int j=0; j<particles[i].length; j++)
      particles[i][j] = new PowerPt(i*10,j*10,0);

  //Create Horizontal Lines
  for(int i=0; i<particles.length; i++)
  {
    Pts p = new Pts();
    for(int j=0; j<particles[i].length; j++)   
      if(i%4==0&&j%3==0)
        p.add(particles[i][j].fixed());
      else
        p.add(particles[i][j]);

    grid.add(p);
  }

  // Create Vertical Lines
  for (int j = 0; j<particles[0].length; j++){
    Pts p = new Pts();
    for (int i = 0; i<particles.length; i++)
      p.add(particles[i][j]);
    grid.add(p);
  }

  mesh=PowerSpring.makeFrom(grid);
  PowerAttractor.globalForce(grid,-200,0.1f);
}

void updateThoseWhichArePinned(){
  float k = 100;
  for(int i=0; i<mesh.numOfLines(); i++)
    for(int j=0; j<mesh.line(i).numOfPts(); j++)
      if(mesh.line(i).pt(j) instanceof PowerPt){
        PowerPt p = (PowerPt)mesh.line(i).pt(j);
        p.set(p.x()+i/k,p.y()+j/k,p.z()+(i+j)/k);
      }
}


void draw(){
  background(155);
  sim.updateSim();
  sim.param.draw();
  updateThoseWhichArePinned();
  mesh.draw();
  Anar.camTarget(mesh);
}

void keyPressed(){
  if(key=='s')
    sim.simulate = sim.simulate ? false:true;
  if(key=='p')
    save("screenshot03.jpg");
  if(key==' ')
    createSimulation();    
}


