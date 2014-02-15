 
public class tMarker extends SimplePointMarker {
  
  public String userName;
  private String userMessage;
  private String userTime;
  private String userMedia;
  private boolean tag0;
  private boolean tag1;
  private boolean tag2;
  
  public boolean displayTweet = false;
      
  public PFont font;

  public float fontSize = 40;
  public float tSpace = fontSize/2;
  public float rSpace = fontSize*1.5;
  
  public int rCol;
  public int gCol;
  public int bCol;
  
  public tMarker(de.fhpotsdam.unfolding.geo.Location location, String userName, String userMessage, String userTime,String userMedia, boolean tag0, boolean tag1, boolean tag2
  ){ 
    this.location = location;
    this.userName = userName;
    this.userMessage = userMessage;
    this.userTime = userTime;
    this.userMedia = userMedia;
    this.tag0 = tag0;
    this.tag1 = tag1;
    this.tag2 = tag2;
  }
  
  public void draw(PGraphics pg, float x, float y) {
    
    rCol=0;
    gCol=0;
    bCol=0;
    if (tag0==true){rCol=255;}
    if (tag1==true){gCol=255;}
    if (tag2==true){bCol=255;}
    
    color col = 0;
    
    if ((tag0==true)&&(tag1==true)&&(tag2==true)){
      col = color(100,100,100,100);
    } else {
     col = color(rCol, gCol, bCol,150);
    }
    
    pg.pushStyle();
    pg.pushMatrix();
      pg.noStroke();
        
       if ((isHidden()==false)&& (displayTweet==true)) {  
        pg.noFill();
        pg.strokeWeight(4);
        pg.stroke(rCol, gCol, bCol);
        pg.ellipse(x, y, 50,50);
        pg.noStroke();
        pg.fill(rCol, gCol, bCol); 
        pg.ellipse(x, y, 10,10);
       }

      if (isHidden()==false) {
        pg.fill(rCol, gCol, bCol,30); 
        pg.ellipse(x, y, 50,50);
        pg.fill(rCol, gCol, bCol,50); 
        pg.ellipse(x, y, 20,20);
        pg.fill(rCol, gCol, bCol,100); 
        pg.ellipse(x, y, 15,15);
        pg.fill(rCol, gCol, bCol,150); 
        pg.ellipse(x, y, 10,10);
        pg.fill(rCol, gCol, bCol); 
        pg.ellipse(x, y, 5,5);
        
      }
    pg.popMatrix();
    pg.popStyle();
    
    //if (selected && userName != null) {
    if ((isHidden()==false)&& (displayTweet==true)) { 
      if (font != null) {
        pg.textFont(font, fontSize);
      }
      
      int tPosX = frameSpacing;
      int tPosY = frameSpacing;
      ///////////////////////////////////CREATE LABELS
      pg.noStroke();
      
      pg.fill(rCol, gCol, bCol); 
      pg.rect(tPosX, tPosY, textWidth(userName)+tSpace, fontSize);
      if ((tag0==false)&&(tag1==false)&&(tag2==false)){
        pg.fill(255);
      } else {
        pg.fill(0);
      }
      pg.textAlign(LEFT, CENTER);
      pg.text(userName, tPosX+(tSpace/2), tPosY+tSpace);


      pg.fill(rCol, gCol, bCol);
      pg.rect(tPosX, tPosY+rSpace, textWidth(userMessage)+tSpace, fontSize); 
      if ((tag0==false)&&(tag1==false)&&(tag2==false)){
        pg.fill(255);
      } else {
        pg.fill(0);
      }
      pg.textAlign(LEFT, CENTER);
      pg.text(userMessage, tPosX+(tSpace/2), tPosY+tSpace+rSpace);  
      
      ///////////////////////////////////ADD IMAGE
      if (userMedia.equals("") != true){
        tweetImage = loadImage(userMedia+".jpg");
        if (tweetImage!=null){
          //tweetImage.filter(GRAY);
          if (tweetImage.width>tweetImage.height){
            tweetImage.resize((height/2),0);
          } else {
            tweetImage.resize(0, (height/2));
          }
          pg.image(tweetImage, frameSpacing, frameSpacing+(fontSize*3));
        }
      } 
    }

  }
}
