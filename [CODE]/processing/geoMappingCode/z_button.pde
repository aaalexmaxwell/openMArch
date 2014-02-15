float interval;
int [] fillColP = {
  #2DB6B9, #C9C127, #DB5E1F, #DB1FAF, #53DB1F
};

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

class Button
{
  float posX, posY;
  String nameB;

  float widthB = interval;
  float heightB=heightPanel;

  boolean selected = false; //if the button was selected (once)
  boolean activate = false; //since selected until unselected

////.....................................................
  Button (String _name, float _posX, float _posY)
  {
    posX = _posX;
    posY = _posY;
    nameB = _name;
  }
  ////.....................................................

  //********************Display*********************
  void display (int index)
  {
    //Button
    pushStyle ();
    fill(220, 220, 220);
    pushMatrix ();
    translate (posX, posY);
    noStroke ();
    rect(0, 0, widthB, heightB);
    fill (0);
    textFont(font10, 10);
    textAlign(CENTER);
    text(nameB, widthB/2, (heightB/2), 0);
    noStroke ();
    popMatrix ();

    //Activated Button
    if (activate)
    {
      fill(0, 100);
      pushMatrix ();
      translate (posX, posY);
      fill (72, 72, 72);
      rect(0, 0, widthB, heightB);
      fill (255);
      textFont(font10, 10);
      textAlign(CENTER);
      text(nameB, widthB/2, (heightB/2), 0);
      noStroke ();
      popMatrix ();
    }
    popStyle ();
  }
  //********************Display*********************

  //*******************mouseCheck*******************
  void mouseCheck () {

    boolean minPosX = false;
    boolean maxPosX = false;
    boolean minPosY = false;
    boolean maxPosY = false;

    if (mouseX > posX) minPosX=true;
    if (mouseX <posX+widthB) maxPosX = true;
    if (mouseY > posY) minPosY=true;
    if (mouseY <posY+heightB) maxPosY = true;

    if (mousePressed && minPosX && maxPosX && minPosY && maxPosY)
    {
      selected = !selected;
      activate = !activate;
    }
  }
  //*******************mouseCheck*******************
}

