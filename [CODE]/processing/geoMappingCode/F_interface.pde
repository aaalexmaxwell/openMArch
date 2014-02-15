//*************************************************************
//**********************VARIABLES TO EDIT**********************
String [] AnalysisButtons = {
  "Time", "Analysis2", "Analysis3"
};

String [] FiltersButtons = {
  "hashTag #A", "hashTag #B", "hashTag #C", "hashTag #D", "Filter0", "Filter1", "Filter2", "Filter3", "Filter4"
};
//**********************VARIABLES TO EDIT**********************
//*************************************************************

PFont font10;

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

//---------------INTERFACE---------------
boolean inPanel = false;

RemoteCtrl Filters;
RemoteCtrl Analysis;
//---------------INTERFACE---------------

//-------------setInterface--------------
void setInterface ()
{
  initializeText ();
  Filters = new RemoteCtrl (0, 0, W, heightPanel, FiltersButtons, false); 
  Analysis = new RemoteCtrl (0, (H-heightPanel), W, heightPanel, AnalysisButtons, true);
}
//-------------setInterface--------------

//-------------drawInterface-------------
void drawInterface ()
{
  Filters.display ();
  Analysis.display ();
}
//-------------drawInterface-------------

//------------initializeText-------------
void initializeText ()
{
  font10 = loadFont("ArialMT-10.vlw");
}
//------------initializeText-------------


//-------------mousePressed--------------
void mousePressed ()
{
  if (mouseButton == LEFT) {
    //check remoteCtrl1
    if (mouseY > Filters.posY && mouseY < Filters.posY+Filters.heightP) 
    {
      Filters.inPanel = true;
      Filters.mousePressed ();
    }

    //check remoteCtrl2
    if (mouseY > Analysis.posY && mouseY < Analysis.posY+Analysis.heightP)
    {
      Analysis.inPanel = true;
      Analysis.mousePressed ();
    }
  }
}
//-------------mousePressed--------------
//-------------mousedDragged--------------
void mouseDragged ()
{
  Analysis.checkBounderies ();
}
//-------------mousedDragged--------------

