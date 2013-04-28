void getSlices() {
  int j=0;
  for (int k=1; k<numWalks+1; k++) {
    for (int i=1; i<nSlices+1; i++) {
      sliceIm[j] = loadShape("walk_" + k + "_sec_" + i + ".svg");
      sliceIm[j].disableStyle();
      j++;
    }
  }
}

void getGraph() {
  graphIm=loadShape("graph_Image.svg");
}

void getSliceImData() {
  int j=0;
  for (int k=1; k<numWalks+1; k++) {
    for (int i=1; i<nSlices+1; i++) {
      sliceDataIm[j] = loadImage("walk_" + k + "_data_" + i + ".png");
      j++;
    }
  }
}

