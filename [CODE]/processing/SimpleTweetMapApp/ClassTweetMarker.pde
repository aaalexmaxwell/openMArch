 
public class tMarker extends SimplePointMarker {
  
  public String userName;
  private String userMessage;
  private String userTime;
  private String userMedia;
  private boolean tag0;
  private boolean tag1;
  private boolean tag2;
  
  private int connection;
      
  public PFont font;
  public float fontSize = 20;
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
    if (tag2==true){bCol=200;}
    
    pg.pushStyle();
    pg.pushMatrix();
      pg.noStroke();
      if (selected) {      
        pg.fill(rCol,gCol,bCol,200);
        pg.stroke(rCol,gCol,bCol,200);
        pg.strokeWeight(4);
        pg.ellipse(x, y, 50,50);
      } else {
        //pg.fill(255);
        pg.fill(0);
        pg.stroke(255);
        pg.strokeWeight(1);
        pg.ellipse(x, y, (rCol+bCol+gCol)/20, (rCol+bCol+gCol)/20);
        pg.fill(rCol,gCol,bCol);
        pg.noStroke();
        pg.ellipse(x, y, (rCol+bCol+gCol)/50, (rCol+bCol+gCol)/50);
      }
    pg.popMatrix();
    pg.popStyle();
    
    if (selected && userName != null) {
      if (font != null) {
        pg.textFont(font);
      }

      int tPosX = width - frameSpacing;
      int tPosY = frameSpacing;
      
      pg.noStroke();
      pg.fill(rCol,gCol,bCol);
      pg.rect(tPosX-textWidth(userName)-tSpace, tPosY, textWidth(userName)+tSpace, fontSize);
      pg.fill(0);
      pg.textAlign(RIGHT, CENTER);
      pg.text(userName, tPosX-(tSpace/2), tPosY+tSpace);
      
      pg.fill(rCol,gCol,bCol);
      pg.rect(tPosX-textWidth(userMessage)-tSpace, tPosY+rSpace, textWidth(userMessage)+tSpace, fontSize);
      pg.fill(0);
      pg.textAlign(RIGHT, CENTER);
      pg.text(userMessage, tPosX-(tSpace/2), tPosY+tSpace+rSpace);
      
    }

  }
}
