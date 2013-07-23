void keyPressed() {

  if(key==' ') {
    Exe.debug = true;
    Exe.megaDebug(true);
    // launch the simulation
    //EnergyPlus.threadSimulate(fullModel,"test");
    EnergyPlus.simulate(fullModel,"test");
    // switch to the following if it is not working on your machine
    //      EnergyPlus.simulate(group,"test");
    clearScreen();
    compareViz();
    /////send tweet when simulation is complete
    //sendTweet();
    sendTweet=true;
  }
/*
  if(key=='q') {
    // launch a series of simulations to see the influence of general rotation
    for (int i=0; i<3; i++) {
      rot.set(i*PI/4);
      EnergyPlus.threadSimulate(group,"test"+i);
    }
  }  

  if(key=='w') {
    // launch a series of simulations to see the influence of thickness
    for (int i=0; i<3; i++) {
      thickness.set(i*0.5f);
      EnergyPlus.threadSimulate(group,"test"+i);
    }
  }
  */
}
