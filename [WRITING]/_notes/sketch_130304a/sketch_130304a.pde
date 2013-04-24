int zone = 100;

int H = 700;
int W = 700;

int maxNodes = 50;
nodeType1[] node = new nodeType1[maxNodes];

void setup(){
   size(W,H);
  cursor(CROSS);
  initializeAssembly();
}

void draw(){
  int zone = mouseX;
  background (200,200,200);
  for (int i=0;i<maxNodes;i+=1){
    for (int k=0; k<maxNodes;k++){
      float a = node[i].pos[0]-node[k].pos[0];
      float b = node[i].pos[1]-node[k].pos[1];
      
      if (sqrt(sq(a)+ sq(b)) < zone){
        line(node[i].pos[0], node[i].pos[1], node[k].pos[0],node[k].pos[1]);
        node[i].connect = node[i].connect+1;
      }
    }
    node[i].display();  
  }
  
}

void initializeAssembly(){

  for (int i=0;i<maxNodes;i++){

    float p1 = random(100,W-100);
    float p2 = random(100,H-100);
    
    node[i] = new nodeType1(i, p1, p2, 20);

  }
}


