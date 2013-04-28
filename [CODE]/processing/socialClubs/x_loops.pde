void initializeLoops() {

  readDatabase();

  int len = dataString.length;
  int inputs[] = new int[len];

  for (int i=0; i< len; i++) {
    int temp = int(dataString[i]);
    inputs[i]  = temp;
  }

  int k=0;
  for(int i=0; i<noLoopsType; i++) {
    loops[i]=new loopsType(inputs[k],inputs[k+1],inputs[k+2],inputs[k+3],inputs[k+4], i);  
    k=k+5;
  }
}

class loopsType {

  PVector pv;
  PVector colRef = new PVector(0,0,0);

  int clu;                               ///CLUB
  int vis;                               ///VISIBILITY
  int tem;                               ///TEMPORALITY    
  int sca;                               ///SCALE
  int typ;                               ///TYPE
  int club;
  String data;
  boolean show=true;
  boolean highlight=false;

  loopsType(int cl, int vi, int te, int si, int ty, int ind) {

    vis = vi*200-(H/2); //position in x
    sca = si*200-(H/2); //position in y
    clu = (cl-1)*200-(H/2); //position in z

    club = cl-1; // use this as the index of the social club

    tem = (te+1)*20; //size of sphere

    pv = new PVector(vis,sca,clu);

    typ = ty;

    switch(ty) {
    case 0:
      colRef.set(0,174,239);
      break;
    case 1:
      colRef.set(236,0,140);
      break;
    case 2:
      colRef.set(255,242,0);
      break;
    case 3:
      colRef.set(154,202,60);
      break;
    case 4:
      colRef.set(247,148,30);
      break;
    }
  }

  void display() {
    translate (pv.x,pv.y,pv.z);
    if (highlight==false) {
      fill(colRef.x, colRef.y, colRef.z,50);
    } 
    else {
      fill(colRef.x, colRef.y, colRef.z,200);
    }
    noStroke();
    sphere(tem);
    fill(colRef.x, colRef.y, colRef.z);
    sphere(3);
    translate (-pv.x,-pv.y,-pv.z);
  }
}

