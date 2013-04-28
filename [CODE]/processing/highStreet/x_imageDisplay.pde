void dispCurrentSlice() {

  for (int i=0; i<numWalks; i++) {
    if (dispWalk[i]==true) {      
      fill(255,200,0,150);
      stroke(255,130,0);
      strokeWeight(1);
      shape(sliceIm[sliceRef+(nSlices*i)], 0, 150);
    }
  }  
  strokeWeight(10);
  stroke(255);
  fill(255,200,0,150);
  rect(352,0,96,150);
  rect(352,450,96,150);
}

////////////////////////////////////////////////////////////////////////

void dispDistSlices() {

  int tempsSliceRef=0;

  for (int i=0; i<numWalks; i++) {
    if (dispWalk[i]==true) { 
      tempsSliceRef=sliceRef+(nSlices*i);
      liveWalk=i+1;
    }
  }

  if (liveWalk!=0) {

    ////////////////////////////////////////DISPLAY UP TO 5 SLICES INFRONT

    if (sliceDir>0) {
      int k = (49-sliceRef); 
      if (k>4) {
        k=5;
      }
      for (int i=0; i<k; i++) {

        fill(150,200,60,125-(i*10));
        strokeWeight(20);
        stroke(255,100-(i*10));
        shape(sliceIm[tempsSliceRef+i],0,150);

        stroke(255);
        strokeWeight(10);
        //        fill(0,150,255,100-(i*20));
        fill(153,204,0,75-(i*20));
        rect(352-(96*(i+1)),0,96,150);
        rect(352+(96*(i+1)),450,96,150);
      }
    }
    else {
      int k = sliceRef;
      if (k>4) {
        k=5;
      }
      for (int i=0; i<k; i++) {
        fill(150,200,60,125-(i*10));
        strokeWeight(20);
        stroke(255,100-(i*10));
        shape(sliceIm[tempsSliceRef-i],0,150);

        stroke(255);
        strokeWeight(10);
        //        fill(0,150,255,100-(i*20));
        fill(153,204,0,75-(i*20));
        rect(352-(96*(i+1)),450,96,150);
        rect(352+(96*(i+1)),0,96,150);
      }
    }

    ////////////////////////////////////////DISPLAY SELECTED SLICE    
    fill(153,204,0,100);
    stroke(153,204,0);

    strokeWeight(2);
    shape(sliceIm[tempsSliceRef], 0, 150);

    stroke(255);
    strokeWeight(10);
    fill(153,204,0,100);
    rect(352,0,96,150);
    rect(352,450,96,150);

    ////////////////////////////////////////DISPLAY SLICE BEHIND
    if ((sliceRef>0) && (sliceRef<49)) {
      noFill();
      stroke(153,204,0);
      strokeWeight(1);
      shape(sliceIm[tempsSliceRef-sliceDir],0,150);

      strokeWeight(10);
      stroke(255);
      fill(153,204,0,125);
      rect(352+((96*sliceDir)),0,96,150);
      rect(352-((96*sliceDir)),450,96,150);
    }
  }
}

void displayImData() { 

  for (int i=0; i<numWalks; i++) {
    if (dispWalk[i]==true) {
      if (dispDistantSlices==true) { 
        noTint();     
        if (dispWalk[0]==true) { /////image data limited to walk 1 only////////
          image(sliceDataIm[sliceRef], 0,0);
        }
      }
    }
  }
}






