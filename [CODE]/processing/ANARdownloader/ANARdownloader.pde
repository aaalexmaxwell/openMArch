/*
  .............................................................................
   ................................................................../\\\.......
    ..../\\\\\\\\\...../\\/\\\\\\..../\\\\\\\\\...../\\/\\\\\\\......\/\\\.......
     ...\////////\\\...\/\\\////\\\..\////////\\\...\/\\\/////\\\../\\\\\\\\\\\...
      ...../\\\\\\\\\\..\/\\\..\//\\\.../\\\\\\\\\\..\/\\\...\///..\/////\\\///....
       ..../\\\/////\\\..\/\\\...\/\\\../\\\/////\\\..\/\\\.............\/\\\.......
        ...\//\\\\\\\\/\\.\/\\\...\/\\\.\//\\\\\\\\/\\.\/\\\.............\///........
         ....\////////\//..\///....\///...\////////\//..\///..........................
          .............................................................................
           Best HiFi - 3D   (        (   ( (((SURROUND)) )   )        )  http://ANAR.ch

  Part of the ANAR+ project - http://ANAR.ch (c) 2005-2012 LaBelle & Nembrini

  This library is not a free software; you can not redistribute it, replicate it and/or 
  modify it without a written approval from the authors.This library is distributed
  compiled in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even 
  FITNESS FOR A PARTICULAR PURPOSE.

  For more informations, please contact: Julien.Nembrini@gmial.com, Switzerland

*/
import java.io.*;
import java.net.URL;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.jar.JarFile;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

//String tmpPath = "tmp";

String backupFolder = "backup_ANARv";

int version;
boolean download = false;
boolean success = false;

void setup() {
  size(10, 10, OPENGL);

  downloadANAR();
  
  println("\n\n\n");
  
  if (download)
    if (success)
      println(" successfully downloaded ANAR+ version "+version); 
    else 
      println(" attempted to download ANAR+ version "+version); 
  else
    println(" ANAR+ version "+version+" up-to-date"); 
   
  exit();

}

void downloadANAR() {

  //deleteDir(sketchPath(tmpPath));

  // get libraryPath
  String sketchBook = sketchPath("").replace(File.separator+"ANARdownloader", "");
  String libraryPath = sketchBook+"libraries"+File.separator;

  println("sketchbook path:	"+sketchBook);
  println("library path:	"+libraryPath);

  String[] tmp;
  int localVersion;
  int remoteVersion;
  String url = libraryPath+"anar"+File.separator+"data"+File.separator+"ANARversion.dat";
///home/lluj/Downloads/testSketch/libraries/anar/data/ANARversion.dat
  tmp = loadStrings(url);
  if (tmp==null) {
    download = true;
    localVersion = -1;
    println("could not access local version url: "+url);
  }
  else {
    localVersion = int(tmp[0]);
  }

  tmp = loadStrings("ANARurl.dat");
  if (tmp==null) {
    download = false;
    remoteVersion = -1;
    println("could not find download url information");
  }
  else {
    url = tmp[0];
    tmp = loadStrings(url+"ANARversion.dat");
    if (tmp==null) {
      download = false;
      remoteVersion = -1;
      println("could not access remote version url: "+url);
    }
    else {
      remoteVersion = int(tmp[0]);
    }
  }

  println("local version:  "+localVersion);
  println("remote version: "+remoteVersion);
  if (remoteVersion > localVersion) {
    download = true;
    version = remoteVersion;
  }	
  else
    version = localVersion;

  if (download) {

    //println("downloading from "+url+" to "+sketchBook);
    println("downloading to "+sketchBook);

    downloadFile(url+"ANAR.zip", sketchBook+"ANAR.zip");

    makeDir(libraryPath);

    if (localVersion > 0) {

      println("backing up ANAR+ version "+localVersion);

      
      String backPath = sketchBook+backupFolder+localVersion;
      
      makeDir(backPath);
      makeDir(backPath+File.separator+"libraries");
      makeDir(backPath+File.separator+"libraries"+File.separator+"anar");
      makeDir(backPath+File.separator+"libraries"+File.separator+"TraerAnar");

      copy(libraryPath+"anar",backPath+File.separator+"libraries"+File.separator+"anar");
      copy(libraryPath+"TraerAnar",backPath+File.separator+"libraries"+File.separator+"TraerAnar");
    }

    deleteDir(libraryPath+"anar");
    deleteDir(libraryPath+"TraerAnar");

    unzipFile(sketchBook+"ANAR.zip", sketchBook);

    //move(sketchPath(tmpPath+File.separator+"libraries"+File.separator+"anar"), libraryPath);    
    //move(sketchPath(tmpPath+File.separator+"libraries"+File.separator+"TraerAnar"), libraryPath);    

    //deleteDir(sketchPath(tmpPath));
    //deleteFile(sketchPath("ANAR.zip"));

    success = true;
  }
}


void draw() {
}

