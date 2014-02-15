//*************************************************************
//**********************VARIABLES TO EDIT**********************
float lonMin = -1.487291;
float lonMax = -1.468688;
float latMin = 53.378498;
float latMax = 53.382713;
//**********************VARIABLES TO EDIT**********************
//*************************************************************

Table dataTableGPS;
Table dataTableTweets;
Table dataTablePoly;
Tweet [] tweets;
XML xmlData;
XML[] childrenNode;

int BOARDER = 300;
int SCALEFACTOR = 50000;

float posX;
float posY;
float dia;
float col;

int W;
int H;

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

//-------------------------------loadData-------------------------------
void loadData ()
{
  ////LOAD DATA FROM GPS WALKS
  dataTableGPS = loadTable("walkData.csv");
  ////////////////////////////////////////
  ////LOAD DATA FROM TWEETS
  dataTableTweets = loadTable("tweetData.csv");
  ////EXTRACT TWEET DATA TO A TABLE 
  tweets = new Tweet [dataTableTweets.getRowCount()];
  for (int i=1; i<tweets.length; ++i)
  {
    tweets [i] = new Tweet (i);
  }
  ////////////////////////////////////////
  ////LOAD MAP DATA FROM XML
  xmlData = loadXML("mapData.xml");
  ////EXTRACT XML DATA TO A TABLE 
  childrenNode = xmlData.getChildren("node");
  ////////////////////////////////////////
  ////LOAD DATA FROM POLYGONS 
  dataTablePoly = loadTable("polygonData.csv");
}

//-------------------------------loadData-------------------------------


//--------------------------------sortData--------------------------------
void sortData() { 
  float lonTemp;
  float latTemp;
  int rowMax = dataTableGPS.getRowCount();
  int colMax = dataTableGPS.getColumnCount();

  ////////THIS IS THEN USED TO CALCULATE THE NECESSARY SCREEN SIZE, TO A 'SCALE', WITH A SUITABLE BORDER
  W = int((lonMax-lonMin)*SCALEFACTOR);
  W = W+BOARDER;
  H = int((latMax-latMin)*SCALEFACTOR);
  H = H+BOARDER;
 
}
//--------------------------------sortData--------------------------------


