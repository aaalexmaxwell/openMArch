void mouseDragged() {

  if (keyPressed != true) {
    ROTX += (mouseX - pmouseX) * 0.01;
    ROTY -= (mouseY - pmouseY) * 0.01;
    redraw();
  }

  if (keyPressed == true) {
    VSCALE  = VSCALE + (pmouseY - mouseY);
    if (VSCALE<1) {
      VSCALE=1;
    }
    redraw();
  }

  if (mouseButton == RIGHT) {
    XTRANSLATE  += (mouseX - pmouseX) * 100;
    YTRANSLATE += (mouseY - pmouseY) * 100;
    redraw();
  }
}

void mouseReleased() {
  /////////////////////////////////////////////////select active loop index  
  if (mouseX<=20) {
    if (mouseY<(noButtons*20)) {
      for (int i=0; i<noButtons;i++) {
        if (mouseY<=((i+1)*20) && mouseY>=(i*20) ) {
          showLoopIndex=i+1;
        }
      }
    } 
    else {
      showLoopIndex=0;
    }
  }

  int findLoop=0;

  if (showLoopIndex!=0) {
    for (int i=0; i<noLoopsType; i++) {
      if (loops[i].show==true) {
        loops[i].highlight=false;
        findLoop=findLoop+1;
        if (findLoop==showLoopIndex) {
          loops[i].highlight=true;
          ACTIVECLUB=loops[i].club;
          ACTIVELOOP=loops[i].typ;
        }
      }
    }
  } 

  /////////////////////////////////////////////////select active club    
  if (mouseX>=20 && mouseX<=40) {
    if (mouseY<80) {
      for (int i=0; i<4;i++) {
        if (mouseY<=((i+1)*20) && mouseY>=(i*20) ) {
          for (int j=0; j<noLoopsType; j++) {
            loops[j].highlight=false;
          }
          ACTIVECLUB=i;
        }
      }
    } 
    else {
      ACTIVECLUB=10;
    }
    println(ACTIVECLUB);
  }
  /////////////////////////////////////////////////select active network type    
  if (mouseX>=40 && mouseX<=60) {
    if (mouseY<100) {
      for (int i=0; i<6;i++) {
        if (mouseY<=((i+1)*20) && mouseY>=(i*20) ) { 
          meshOn=true;
          mReset=true;
          attRepOn=true;
          COUNT=0;

          for (int j=0; j<noLoopsType; j++) {
            if (loops[j].typ==i) {
              loops[j].show=true;
            } 
            else {
              loops[j].show=false;
            }
          }

          ACTIVECLUB=10;
          ACTIVELOOP=i;
          attCount=0;
        }
      }
    }
  }
}

void keyPressed() {


  if (key=='p'||key=='P') {
    EXPORT=true;
  }

  ///////////////////////////show environment
  if (key=='g'|| key=='b') {
    if (envirOn==true) {
      envirOn=false;
    }
    else {
      envirOn=true;
    }
  }
  ///////////////////////////show mesh
  if (key=='m'|| key=='M') {
    if (meshOn==true) {
      meshOn=false;
    }
    else {
      meshOn=true;
    }
  }

  ///////////////////////////reset network
  if (key=='n'|| key=='N') {
    mReset=true;
  }

  /////////////////////////////////display network types individually
  if (key=='1') {
    meshOn=true;
    mReset=true;
    attRepOn=true;
    COUNT=0;
    for (int i=0; i<noLoopsType; i++) {
      if (loops[i].typ==0) {
        loops[i].show=true;
      } 
      else {
        loops[i].show=false;
      }
    }
  }
  if (key=='2') {
    meshOn=true;
    mReset=true;
    attRepOn=true;
    COUNT=0;
    for (int i=0; i<noLoopsType; i++) {
      if (loops[i].typ==1) {
        loops[i].show=true;
      } 
      else {
        loops[i].show=false;
      }
    }
  }
  if (key=='3') {
    meshOn=true;
    mReset=true;
    attRepOn=true;
    COUNT=0;
    for (int i=0; i<noLoopsType; i++) {
      if (loops[i].typ==2) {
        loops[i].show=true;
      } 
      else {
        loops[i].show=false;
      }
    }
  }
  if (key=='4') {
    meshOn=true;
    mReset=true;
    attRepOn=true;
    COUNT=0;
    for (int i=0; i<noLoopsType; i++) {
      if (loops[i].typ==3) {
        loops[i].show=true;
      } 
      else {
        loops[i].show=false;
      }
    }
  }
  if (key=='5') {
    meshOn=true;
    mReset=true;
    attRepOn=true;
    COUNT=0;
    for (int i=0; i<noLoopsType; i++) {
      if (loops[i].typ==4) {
        loops[i].show=true;
      } 
      else {
        loops[i].show=false;
      }
    }
  }
  if (key=='0') {
    meshOn=false;
    mReset=true;
    attRepOn=false;
    for (int i=0; i<noLoopsType; i++) {
      loops[i].show=true;
      loops[i].highlight=false;
    }
  }

  //ATTRACT_REPEL///////////////////////////////////////////////////
  if (key=='a' || key=='A') {
    if (attRepOn==false) {
      attRepOn=true;
    }
    else {
      attRepOn=false;
    }
  }

  if (key=='i' || key=='I') {
    if (disInst==false) {
      disInst=true ;
    } 
    else {
      disInst=false;
    }
  }
}

