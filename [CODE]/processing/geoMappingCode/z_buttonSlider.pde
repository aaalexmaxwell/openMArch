class ButtonSlider
{
  float posX, posY;
  String nameB;
  float widthS = interval;
  float heightS=heightPanel;
  float minRange, maxRange;
  boolean selected = false; //if the button was selected (once)
  boolean activate = false;

  int sliderVal;

  //------------------------------------------------------------------------
  ButtonSlider (String _name, float _posX, float _posY, float _minRange, float _maxRange)
  {
    posX = _posX;
    posY = _posY;
    nameB = _name;

    minRange = _minRange;
    maxRange = _maxRange;
  } 
  //------------------------------------------------------------------------ 

  //*******************mouseCheck*******************
  void mouseCheck () {

    boolean minPosX = false;
    boolean maxPosX = false;
    boolean minPosY = false;
    boolean maxPosY = false;

    if (mouseX > posX) minPosX=true;
    if (mouseX <posX+widthS) maxPosX = true;
    if (mouseY > posY) minPosY=true;
    if (mouseY <posY+heightS) maxPosY = true;

    if (mousePressed && minPosX && maxPosX && minPosY && maxPosY)
    {
      selected = !selected;
      activate = !activate;
    }
  }
  //*******************mouseCheck*******************

  //******************getValueSlider********************
  int getValueSlider ()
  {
    int explodingValue = 0;
    if (mouseX >=posX && mouseX <=(posX+widthS))
    {
      float mapValue = map (mouseX, posX, posX+widthS, minRange, maxRange); 
      if (mouseX >posX+widthS) mapValue=maxRange;
      if (mouseX < posX) mapValue=minRange;
      float FexplodingValue =  constrain (mapValue, minRange, maxRange);
      explodingValue = int (FexplodingValue);
    } 
    return explodingValue;
  }
  //******************getValueSlider********************

  //******************checkBounderies********************
  void checkBounderies ()
  {
    boolean minPosX = false;
    boolean maxPosX = false;
    boolean minPosY = false;
    boolean maxPosY = false;

    if (mouseX > posX) minPosX=true;
    if (mouseX <posX+widthS) maxPosX = true;
    if (mouseY > posY) minPosY=true;
    if (mouseY <posY+heightS) maxPosY = true;

    if (mousePressed && minPosX && maxPosX && minPosY && maxPosY) sliderVal = getValueSlider ();
  }
  //******************checkBounderies********************

  //********************Display*********************
  void display (int index)
  {
    //Button
    pushStyle ();
    fill(220, 220, 220);
    pushMatrix ();
    translate (posX, posY);
    noStroke ();
    rect(0, 0, widthS, heightS);
    fill (0);
    textFont(font10, 10);
    textAlign(CENTER);
    text(nameB, widthS/2, (heightS/2), 0);
    noStroke ();
    popMatrix ();

    //Activated Button
    if (activate)
    {
      fill(0, 100);
      pushMatrix ();
      translate (posX, posY);

      fill (72, 72, 72);
      rect(0, 0, widthS, heightS);
      fill (255);
      textFont(font10, 10);
      textAlign(CENTER);
      text(nameB, widthS/2, (heightS/2), 0);
      noStroke ();
      popMatrix ();
    }
    popStyle ();
  }
  //********************Display*********************

  //----------------------------------------------------------------------------------------------------------------
}

