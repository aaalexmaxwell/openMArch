void setup ()
{
  smooth();
  cursor(CROSS);
  loadData ();
  sortData(); 
  size (W, H);
  setInterface ();
}

void draw ()
{
  
  background (0);
  drawInterface ();
  drawXML();
  drawPoly();
  drawWalk ();
  drawTweets ();
}

