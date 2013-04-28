void selectSlice() {

  prevSliceRef = sliceRef;

  if(mouseY>height-eleY) {
    sliceRef=nSlices-(mouseX/(width/nSlices))-1;
    elePos=0-mouseX*(ratio)+(width/2);
    cursor(HAND);
  }
  if(mouseY<eleY) {
    sliceRef=nSlices-(mouseX/(width/nSlices))-1;
    elePos=0-mouseX*(ratio)+(width/2);
    cursor(HAND);
  }

  //////////////////CALCULATE DIRECTION BASED ON CURRENT AND PREVIOUS SLICES
  if (sliceRef != prevSliceRef) {
    sliceDir= sliceRef-prevSliceRef;
  }

  if (sliceDir>0) {
    sliceDir = 1;
  }
  else {
    sliceDir = -1;
  }
}

void keyReleased() {
  if(key=='1') {
    if (dispWalk[0]==false) {
      dispWalk[0]=true;
      if (dispDistantSlices==true) {
        dispWalk[1]=false;
      }
    }
    else {
      dispWalk[0]=false;
      if (dispDistantSlices==true) {
        dispWalk[0]=true;
      }
    }
  }
  if(key=='2') {
    if (dispWalk[1]==false) {
      dispWalk[1]=true;
      if (dispDistantSlices==true) {
        dispWalk[0]=false;
      }
    }
    else {
      dispWalk[1]=false;
      if (dispDistantSlices==true) {
        dispWalk[1]=true;
      }
    }
  }

  if (key=='d') {
    if(dispDistantSlices==true) {
      dispDistantSlices=false;
    }
    else {
      dispDistantSlices=true;
      dispWalk[0]=true;

      for (int i=1;i<10;i++) {
        dispWalk[i]=false;
      }
    }
  }

  if (key=='g') {
    if (dispGraph==false) {
      dispGraph=true;
    }
    else {
      dispGraph=false;
    }
  }
}

