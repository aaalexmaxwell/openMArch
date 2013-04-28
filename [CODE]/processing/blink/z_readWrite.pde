
void readImageData(){
  reader = createReader("database.txt"); 
  try {
    textLine = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    textLine = null;
  }

  if (textLine == null) {
    noLoop();  
  } 
  else {
    String[] d= split(textLine, ',');
    imageBank = d;
  }
}

void writeUserData(){

  String dataString = "";
  String fileName = "user" + (userIndex) +".txt";
  output = createWriter(fileName);
  dataString = userOutput;  
  output.println(dataString);
  output.flush();
  output.close();
}

void getUserIndex(){
  reader = createReader("userIndex.txt"); 
  try {
    textLine = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    textLine = null;
  }

  if (textLine == null) {
    noLoop();  
  } 
  else {
    int uI = int(textLine);
    userIndex = uI;
  }  
}

void writeUserIndex(){  
  String dataString = "";
  output = createWriter("userIndex.txt");
  
  dataString = dataString + userIndex;
  output.println(dataString);
  output.flush();
  output.close();
}

void writeEyePos(){
  String dataString = "";
  String filename = userIndex + "_" + liveImage + "_eyePos" + ".txt";
  output = createWriter(filename);
  
  for (int i=0; i< eyePos.length; i++){
    if (eyePos[i] != 0) {
      dataString = dataString + eyePos[i] + ",";
      println("test");
      println(dataString);
    }
  }
  output.println(dataString);
  output.flush();
  output.close();
}

