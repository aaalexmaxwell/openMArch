

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

  Part of the ANAR+ project - http://ANAR.ch (c) 2005-2009 LaBelle & Nembrini

  This library is not a free software; you can not redistribute it, replicate it and/or 
  modify it without a written approval from the authors.This library is distributed
  compiled in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even 
  FITNESS FOR A PARTICULAR PURPOSE.

  For more informations, please contact: Media and Design LAB, EPFL IC ISIM LDM1, 
  BC 121 (BC Building), Station 14, CH-1015 Lausanne, Switzerland

*/




public boolean    debug = false;


  public void copyFile(String inPath, String outPath) {
      if (PApplet.platform == PApplet.WINDOWS)
          execute("xcopy /e /y "+path(inPath)+" "+path(outPath));
      else  
	    execute("cp "+path(inPath)+" "+path(outPath));
  }
  
  public void copy(String inPath, String outPath) {
      if (PApplet.platform == PApplet.WINDOWS)
          execute("xcopy /e /y "+path(inPath)+" "+path(outPath));
      else  
          execute("cp -r "+path(inPath)+" "+path(outPath));
  }


  public void move(String inPath, String outPath) {
      if (PApplet.platform == PApplet.WINDOWS)
          execute("move /y "+path(inPath)+" "+path(outPath));
      else  
          execute("mv "+path(inPath)+" "+path(outPath));
  }

  
  public static void extractFile(String jarPath, String filePathInZip, String targetFolder){
    println(jarPath);
    println(filePathInZip);
    
    try{
      JarFile jar=new JarFile(jarPath);
      ZipEntry entry=new ZipEntry(filePathInZip);
      
      File file = new File(filePathInZip);
      
//      if(targetFolder.charAt(targetFolder.length()-1) != '/')
//        targetFolder += "/";
      
//      int length=(int)ze.getSize();
//      byte fileContent[]=new byte[length];
//      InputStream fin=jf.getInputStream(ze);
//      fin.read(fileContent,0,length);
      InputStream in = new BufferedInputStream(jar.getInputStream(entry));
      OutputStream out = new BufferedOutputStream(new FileOutputStream(targetFolder+file.getName()));      
      
      byte[] buffer = new byte[2048];
      for (;;)  {
        int nBytes = in.read(buffer);
        if (nBytes <= 0) break;
        out.write(buffer, 0, nBytes);
      }
      out.flush();
      out.close();
      in.close();      
      
    }
    catch (IOException e){
      e.printStackTrace();
    }
    
  }
  

  
  public static boolean exists(String path) {    
    return (new File(path).exists());
  }
  
  public static void renameTo(String path, String newPath) {
    File ff = new File(path); 
    if (ff.exists()) ff.renameTo(new File(newPath));
  }

  public void deleteFile(String path) {
    if (PApplet.platform == PApplet.WINDOWS)
      execute("del "+path(path));
    else  
      execute("rm "+path(path));
  }

  public void makeDir(String path) {
    execute("mkdir "+path(path));
  }

  public void deleteDir(String path) {
    if (PApplet.platform == PApplet.WINDOWS)
      execute("rd /s /q "+path(path));
    else  
      execute("rm -r "+path(path));
  }
  


  // INNER CLASS used for listing dirs and files
  
//This filter only returns directories
  static FileFilter dirFilter = new FileFilter() {
      public boolean accept(File file) {
          return file.isDirectory();
      }
  };

  //This filter only returns directories
  static FileFilter fileFilter = new FileFilter() {
      public boolean accept(File file) {
          return file.isFile();
      }
  };

  
  public static String[] list(String path) {
    File dir = new File(path);
    return dir.list();
  }
  
  public static String[] listFiles(String path) {
    File dir = new File(path);
    return getNames(dir.listFiles(fileFilter));
  }

  static String[] getNames(File[] l) {
    String[] ret = new String[l.length];
    for (int i=0; i<l.length; i++) {
      ret[i] = l[i].getName();
    }
    return ret;
  }
  
  public static String[] listDirs(String path) {
    File dir = new File(path);
    return getNames(dir.listFiles(dirFilter));
  }

  


  /** 
   * searches a path for a file with a specific string in its name
   * 
   * @param path - the folder to search in
   * @param search - the string pattern to search for
   * @return a String array of file names
   */
  public static String[] getFileWith(String path, String search) {
    File f = new File(path);
    ArrayList<String> list = new ArrayList<String>();
    if (!f.exists()) {
      System.out.println(path + " does not exist");
    }
    if (f.isFile())
      System.out.println(path + " is not a directory");
    else if (f.isDirectory()) {
      String objects[] = f.list();
      for (int i=0; i<objects.length; i++)
        if (objects[i].contains(search)) list.add(objects[i]);
    } else
      System.err.println("Problem: " + path);
    
    String[] ret = new String[list.size()];
    for (int i=0; i<ret.length; i++)
      ret[i] = list.get(i);
    
    return ret;
  }
  
  
  public static String truncatePath(String base, String path) {
    return new File(base).toURI().relativize(new File(path).toURI()).getPath();
  }
  
  
  
  ////////////////////////////
  
  // ZIP
  
  static final int ZIPBUFFER = 2048;

  public static void zipFolder(String zipName, String path) {
      zipFiles(zipName,path,listFiles(path));
  }
  

  public static void zipFiles(String zipName, String path, String[] files) {
    File[] fs = new File[files.length];
    for (int i=0; i<files.length; i++)
      fs[i] = new File(files[i]);
    zipFiles(zipName,path,fs);
  }
  
  public static void zipFiles(String zipName, String path, File[] files) {
     try {
        BufferedInputStream origin = null;

        // get a list of files from current directory 
        // before opening the output stream since otherwise it gets included in the zip      

        FileOutputStream dest = new FileOutputStream(path+File.separator+zipName);
        ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(dest));
        //out.setMethod(ZipOutputStream.DEFLATED);
        
        byte data[] = new byte[ZIPBUFFER];

        for (int i=0; i<files.length; i++) {
          
           System.out.println("Adding: "+files[i]);

           // Careful: use absolute path to reach the file
           FileInputStream fi = new FileInputStream(files[i]);
           origin = new BufferedInputStream(fi, ZIPBUFFER);
           
           ZipEntry entry = new ZipEntry(truncatePath(path,files[i].getPath()));
           out.putNextEntry(entry);

           int count;
           while((count = origin.read(data, 0, ZIPBUFFER)) != -1) 
              out.write(data, 0, count);
           
           origin.close();
        }
        out.close();
        
     } catch(Exception e) {
        e.printStackTrace();
     }
  }

  
  public static void unzipFile(String zipName,String outputFolder) {

       BufferedOutputStream bufferedOutputStream = null;
       FileInputStream fileInputStream;

       File dest_file = new File(outputFolder);
       dest_file.mkdirs(); // creates if destination directory not existed    

       try {
           fileInputStream = new FileInputStream(zipName);
           ZipInputStream zipInputStream = new ZipInputStream(new BufferedInputStream(fileInputStream));
           ZipEntry zipEntry;

           while ((zipEntry = zipInputStream.getNextEntry()) != null) {
               String zipEntryName = zipEntry.getName();
               File file = new File(outputFolder + zipEntryName);

               if (file.exists()) {
                 System.out.println("file already exists, not overwriting");
               } else {
                   if(zipEntry.isDirectory()) {
                       file.mkdirs();
                   } else {
                       // because of bug... to make sure the directory is indeed created
                       File anotherFile = new File(outputFolder,zipEntryName);
                       anotherFile.getParentFile().mkdirs(); 
                       ///////////////
                       byte buffer[] = new byte[ZIPBUFFER];
                       FileOutputStream fileOutputStream = new FileOutputStream(file);
                       bufferedOutputStream = new BufferedOutputStream(fileOutputStream, ZIPBUFFER);
                       int count;

                       while ((count = zipInputStream.read(buffer, 0, ZIPBUFFER)) != -1) {
                           bufferedOutputStream.write(buffer, 0, count);
                       }
                       bufferedOutputStream.flush();
                       bufferedOutputStream.close();
                   }
               } 
           }
           zipInputStream.close();
       } catch(Exception e) { 
       System.out.println("problem extracting "+zipName+" : "+e);
       }    
  }
  
  
  // //////////////
  // download tool
  
  public static void downloadFile(String fileURL, String localName) {
    try {
      URL url = new URL(fileURL);
      ReadableByteChannel rbc = Channels.newChannel(url.openStream());
      FileOutputStream fos = new FileOutputStream(localName);
      fos.getChannel().transferFrom(rbc, 0, 1 << 24);
    } catch (Exception e) {
      System.out.println("problem downloading "+fileURL+" : "+e);
    }
  }
  

 
  public void execute(String cmd) {

    if (PApplet.platform == PApplet.WINDOWS) cmd = "cmd /c \"" + cmd + "\""; 

    try {
      println("[CMD] '"+cmd+"'");
      Process p = Runtime.getRuntime().exec(cmd);

      /*
       * need to process straight away stdout and stderr or it will hang
       * forever. 
       * 
       * any error messages ?
       */ 
      StreamGrep errorSiphon = new StreamGrep(p.getErrorStream(),"[ERR]");

      /*
       *  any output?
       */
      StreamGrep outputSiphon = new StreamGrep(p.getInputStream(),"[OUT]");

      /*  
       * start siphon threads
       */
      errorSiphon.start();
      outputSiphon.start();

      /*
       * wait for end of exec process and display exit value
       */ 
      int exitVal = p.waitFor();
      println("[EXIT " + exitVal + "]");
      
    } catch (Exception e) {
      println("[execution failure]");
      e.printStackTrace();
    }

  }

  public static String path(String path) {
    if (PApplet.platform == PApplet.WINDOWS) return "\""+path+"\"";
    else return path;
  }


class StreamGrep extends Thread{

    public boolean debug = false;
    
    InputStream is;
    String type;

    StreamGrep(InputStream is, String type)
    {
      this.is = is;
      this.type = type;
    }

    public void run()
    {
      try
      {
        BufferedReader br = new BufferedReader(new InputStreamReader(is));
        String line=null;
        while ( (line = br.readLine()) != null)
          if (debug) println(type + "\t((" + line +"))");    
      } 
      catch (IOException ioe)
      {
        ioe.printStackTrace();  
      }
    }
}  

