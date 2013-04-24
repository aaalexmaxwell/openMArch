class nodeType1{
   
  float[] pos = new float[2];
  float[] posTemp = new float[2];
  int dia;
  int index;
  int connect;
  
  nodeType1(int ind, float p0, float p1, int d){
    index = ind;
    pos[0] = p0;
    pos[1] = p1;
    dia = d;
  }
  
  void display(){
    strokeWeight(1);
    stroke(50,50,50);
    fill(255,255,255,100);
    ellipse(pos[0], pos[1], dia, dia);
  }
  
}
