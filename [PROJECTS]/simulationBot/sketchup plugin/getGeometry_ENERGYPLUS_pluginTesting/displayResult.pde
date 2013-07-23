

Obj graph = new Obj();

void clearScreen() {
  graph = new Obj();
}

void displayResult() {
  Anar.screenDrawBegin();
  graph.draw();
  Anar.screenDrawEnd();
}

boolean displayEnergy = false;


void compareViz() {

  // chooses the kind of result we will comparing 
  // (set to true for energy, otherwise temperatures)
  displayEnergy = true;


  // set the zero height (in pixels from bottom) for graph display
  int zeroHeight = height/2;
  // set the max positive value for graph display
  float maxRange = 20;
  // set the amount of samples 8760 four hourly (temperatures) 365 for daily (energy)
  float samples = 8760;
  
  if (displayEnergy) {
    maxRange = 5e9;
    samples = 365;
  }

  // load results
  boolean draw = true;

  float[][] rez = null;
 
  // to have zones number and names well defined
  EnergyPlus.initURL("test");
  // check if found the file
  if (EnergyPlus.foundSimData()) {
    // get temperatures
    if (displayEnergy)
      rez = EnergyPlus.parseSimResultsHeatingCoolingDemandDaily();
    else
      rez = EnergyPlus.parseSimResultsTemperatures();
  }
  else {
    println("sim data  not found");
    draw = false;
  }

  if (draw) {

    // draw the results
    for (int j=0; j<rez[0].length; j++) {
      Pts l = new Pts();
      for (int k=0; k<rez.length; k++) {
        l.add(Anar.Pt(10+k*((width-20)/samples), height-zeroHeight-(rez[k][j]/maxRange*height)));
      }
      graph.add(l.stroke(255-100*j, 0, 100*j));
    }
    
    println("results drawn");
  }
}

