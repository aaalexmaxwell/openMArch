void drawXML()
{
  float lon;
  float lat;
  
    for (int i = 0; i < childrenNode.length; i++) {
  
    lon = ((childrenNode[i].getFloat("lon"))-lonMin)*SCALEFACTOR;
    lon = lon+(BOARDER/2);
    lat = H-((childrenNode[i].getFloat("lat"))-latMin)*SCALEFACTOR;
    lat = lat-(BOARDER/2);
    
        
     if ((lon<W) && (lon>0) && (lat<H-heightPanel) && (lat>heightPanel)){
       
        stroke(255,255,255,10);
        strokeWeight(8);
        point(lon, lat); 
        stroke(255,255,255,20);
        strokeWeight(4);
        point(lon, lat); 
        stroke(255,255,255);
        strokeWeight(1);
        point(lon, lat); 
       
    }

  }
} 


