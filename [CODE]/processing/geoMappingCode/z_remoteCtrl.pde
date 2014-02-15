float heightPanel = 40.0;

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

class RemoteCtrl
{
  float posX; 
  float posY;
  float widthP, heightP;
  Button [] buttons;
  ButtonSlider [] sliders;
  int myNumButtons;
  String [] nameButtons;

  boolean inPanel = false;

  boolean [] bFilters;

  boolean slider;

  RemoteCtrl (float _posX, float _posY, float _widthP, float _heightP, String [] _nameButtons, boolean _slider)
  {
    posX = _posX;
    posY = _posY;
    widthP = _widthP;
    heightP = _heightP;
    nameButtons = _nameButtons;
    myNumButtons = nameButtons.length;

    interval = widthP/(myNumButtons);

    slider = _slider;

    //----BUTTON----
    if (!slider) 
    {
      buttons = new Button [myNumButtons];
      for (int i=0; i<myNumButtons; ++i)
      {
        float posX1 = posX + interval*i;
        buttons [i] = new Button (nameButtons[i], posX1, posY);
      }
    }
    //----BUTTON----

    //----SLIDER-----
    if (slider) 
    {
      float minRange = 0.0;
      float maxRange = 0.0;
      sliders = new ButtonSlider [myNumButtons];
      for (int i=0; i<myNumButtons; ++i)
      {
        //*************************************************************
        //**********************VARIABLES TO EDIT**********************
        if (i==0)
        {
          minRange = 8.00;
          maxRange =  20.00;
        }
        //**********************VARIABLES TO EDIT**********************
        //*************************************************************
        float posX1 = posX + interval*i;
        sliders [i] = new ButtonSlider (nameButtons[i], posX1, posY, minRange, maxRange);
      }
    }
    //----SLIDER-----

    bFilters = new boolean [FiltersButtons.length];
  }

  //-------------------------display------------------------
  void display ()
  {
    pushStyle ();
    fill (220, 220, 220);
    noStroke ();
    rect (posX, posY, widthP, heightP);

    popStyle ();
    if (!slider) {
      for (int i=0; i<myNumButtons; ++i)
      {
        buttons [i].display (i);
      }
    }

    if (slider) {
      for (int i=0; i<myNumButtons; ++i)
      {
        sliders [i].display (i);
      }
    }
  }
  //-------------------------display------------------------

  //----------------------mousePressed----------------------  
  void mousePressed ()
  {
    if (inPanel) //when in filters
    {
      //-------------------------
      if (!slider) { 
        for (int i=0; i<myNumButtons; ++i)
        {
          buttons [i].mouseCheck();

          if (buttons [i].activate)  
          {
            bFilters [i] = true;
            //          comparing = true;
            //          compareButtons (i);
          }
          else bFilters [i] = false;
        }
      }
      //-------------------------
      if (slider) { 
        for (int i=0; i<myNumButtons; ++i)
        {
          sliders [i].mouseCheck();

          if (sliders [i].activate)  
          {
            bFilters [i] = true;
            //          comparing = true;
          compareButtons (i);
          }
          else bFilters [i] = false;
        }
      }
    }
  }
  //----------------------mousePressed---------------------- 

  //-------------------compareButtons-------------------
  void compareButtons (int index)
  {
    if (!slider) {
    for (int i=0; i<myNumButtons; ++i)
    {
      if (i!=index)
      {
        buttons [i].activate = false;
        buttons [i].selected= false;
      }
    }
  }
      if (slider) {
    for (int i=0; i<myNumButtons; ++i)
    {
      if (i!=index)
      {
        sliders [i].activate = false;
        sliders [i].selected= false;
      }
    }
  }
  }
  //-------------------compareButtons-------------------

  void checkBounderies ()
  { 
    for (int i=0; i<sliders.length; ++i)
    {
      if (sliders [i].activate)   sliders [i].checkBounderies ();
    }
  }

  //----------------------------------------------------------
}

