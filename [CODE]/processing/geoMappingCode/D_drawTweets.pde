//*************************************************************
//***********************EDIT PARAMETERS***********************
int numID = 0;
int numLon = 1;
int numLat = 2;
int numTime = 3;
int numText = 4;
int numImg = 5;
int numHT1 = 6;
int numHT2 = 7;
//***********************EDIT PARAMETERS***********************
//*************************************************************

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

//-------------------------------drawTweets-------------------------------
void drawTweets()
{
  for (int i=1; i<tweets.length; ++i)
  {
    tweets[i].display ();
  }
} 
//-------------------------------drawTweets-------------------------------

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

class Tweet
{
  int numRow;
  String ID;
  String posX, posY, myText;
  float myPosX, myPosY;

  //*************************************************************
  //***********************EDIT PARAMETERS***********************

  //------ANALYSIS PARAMETERS------
  String Time, Date;

  //String RadiusAffect, Distance, beatRate; // more analysis parameters... 

  //-------FILTERS PARAMETERS------

  String [] hashTags = new String [2]; //how many hashTags do i have for each tweet

  //***********************EDIT PARAMETERS***********************
  //*************************************************************

  //...............................
  Tweet (int _numRow)
  {
    numRow = _numRow;
    setMyValues ();
  }
  //...............................

  //-----setMyValues-----
  void setMyValues ()
  {
    ID = dataTableTweets.getString(numRow, numID);
    posX = dataTableTweets.getString(numRow, numLon);
    posY = dataTableTweets.getString(numRow, numLat);
    myText = dataTableTweets.getString(numRow, numText);

    //*************************************************************
    //***********************EDIT PARAMETERS***********************

    //===============ANALYSIS===============
    Time = getTime ();

    //================FILTERS===============
    hashTags [0] = dataTableTweets.getString(numRow, numHT1);
    hashTags [1] = dataTableTweets.getString(numRow, numHT2);

    //***********************EDIT PARAMETERS***********************
    //*************************************************************
  }
  //-----setMyValues-----

  //-------display-------
  void display ()
  {
    myPosX = (float (posX)-lonMin)*SCALEFACTOR;
    myPosX = myPosX+(BOARDER/2);

    myPosY = H-(float (posY)-latMin)*SCALEFACTOR;
    myPosY = myPosY-(BOARDER/2);

    //----------------------STANDARD VIEW---------------------
    ///DRAW THE MARKER FOR EACH TWEET
    strokeWeight(3);
    stroke(255, 0, 0);
    fill(255);
    ellipse(myPosX, myPosY, 12, 12);

    ///DRAW THE TEXT FOR EACH TWEET
    stroke(0);
    fill(0);
    textFont(font10, 10);
    String twtTxt = dataTableTweets.getString(numRow, 4);
    //text(twtTxt, myPosX, myPosY);
    String twtTime = dataTableTweets.getString(numRow, 3);
    //text(twtTime, myPosX, myPosY-10);
    String twtID = dataTableTweets.getString(numRow, 0);
    //text(twtID, myPosX, myPosY-20);
    //----------------------STANDARD VIEW----------------------

    //*************************************************************
    //**********************VARIABLES TO EDIT**********************

    ////====================FILTERED VIEWS====================
    //--------HASHTAG-------
    if (Filters.bFilters[0] == true)
    {
      for (int i=0; i<hashTags.length; ++i)
      {
        if (hashTags [i].equals ("A"))
        {
          stroke (fillColP[0]);
          strokeWeight(3);
          noFill();
          ellipse (myPosX, myPosY, 50, 50);
        }
      }
    }
    //-----------
    if (Filters.bFilters[1] == true)
    {
      for (int i=0; i<hashTags.length; ++i)
      {
        if (hashTags [i].equals ("B"))
        {
          stroke (fillColP[1]);
          strokeWeight(3);
          noFill();
          ellipse (myPosX, myPosY, 60, 60);
        }
      }
    }
    //-----------

    ////====================FILTERED VIEWS====================

    ////====================ANALYSIS VIEWS====================
    //--------TIME-------
    if (Analysis.bFilters[0] == true)
    {
      if (int (Time) == Analysis.sliders[0].sliderVal)
      {
        stroke(255, 0, 0);
        strokeWeight(1);
        line(myPosX, 40, myPosX, H-40);
        line(0, myPosY, W, myPosY);

        fill (255);
        stroke(255, 0, 0);
        strokeWeight(6);
        ellipse (myPosX, myPosY, 30, 30);
      }
    }
    //-----------

    ////====================ANALYSIS VIEWS====================

    //**********************VARIABLES TO EDIT**********************
    //*************************************************************
  }
  //-------display-------

  //==========================ANALYSIS==========================
  //-------getTime-------
  String getTime ()
  {
    String _Time;
    String totalTime = dataTableTweets.getString(numRow, numTime);
    String [] times = split (totalTime, " ");
    String [] hrTimes = split (times [4], ":");
    _Time = hrTimes [0];
    return _Time;
  }
  //-------getTime-------

  //------------------------------------------------------------------------------
}

