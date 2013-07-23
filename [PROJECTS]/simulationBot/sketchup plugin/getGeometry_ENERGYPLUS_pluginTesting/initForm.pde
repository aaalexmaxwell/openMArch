String[] layerList;
String[] matchList;
String[] matchData;
String[] grpMat;

String objLoc;
String txtLoc;
String zoneName;
Group fullModel = new Group();
Group[] importedObj;
int zoneCount;
int numZones=1;

ArrayList<Face> tempFaces;

void initForm() {

  // values are in m but you may change this by modifying 
  EnergyPlus.scale = 1f;

  ///////////////////////////
  // geometry building blocks

  Face.showNormal = false;

  Param rot = new Param(0f, -PI, PI).tag("rotation").addToSlidersMain();
  Transform rotZ = new RotateZ(rot);

  Param windowWall = new Param(.3f, .1f, .9f).tag("window/wall").addToSlidersMain();
  Param thickness = new Param(.3f, .05f, .5f).tag("thickness").addToSlidersMain();
  Param shadinglength = new Param(1f, .05f, 2f).tag("shading").addToSlidersMain();


  // //////////////
  // Materials

  /*Material,
   20mm wood,               !- Name
   MediumSmooth,            !- Roughness
   0.02,                    !- Thickness {m}
   0.15,                    !- Conductivity {W/m-K}
   608,                     !- Density {kg/m3}
   1630;                    !- Specific Heat {J/kg-K}*/
  EnergyPlus.defineMaterial("wood 20mm", 3, 0.02f, .15f, 608f, 1630f);



  /*Material,
   Plaster Interior - 1500 kg/m3 - 5mm,  !- Name
   MediumRough,             !- Roughness
   0.005,                   !- Thickness {m}
   0.8,                     !- Conductivity {W/m-K}
   1500,                    !- Density {kg/m3}
   900;                     !- Specific Heat {J/kg-K}*/
  EnergyPlus.defineMaterial("Plaster In", 2, 0.005f, 0.8f, 1500f, 900f);  

  /*Material:AirGap,
   F04 Wall air space resistance,  !- Name
   0.15;                    !- Thermal Resistance {m2-K/W}*/
  EnergyPlus.defineMaterialAirGap("air gap", .15f);


  /*Material,
   Masonry 24cm - 1600 kg/m3 - 240mm,  !- Name
   MediumRough,             !- Roughness
   0.24,                   !- Thickness {m}
   1.1,                     !- Conductivity {W/m-K}
   1800,                    !- Density {kg/m3}
   790;                     !- Specific Heat {J/kg-K}*/
  EnergyPlus.defineMaterial("Masonry 24", 2, 0.24f, 1.1f, 1800f, 790f);

  /*Material,
   Insulation: Holzfazerplatten baustoffkennwerte-120106.xls zeile 628,  !- Name
   VeryRough,               !- Roughness
   0.025,                   !- Thickness {m}
   0.038,                   !- Conductivity {W/m-K}
   55,                      !- Density {kg/m3}
   1400;                    !- Specific Heat {J/kg-K}*/
  EnergyPlus.defineMaterial("insulation parametric", thickness, .038f, 55, 1400);


  // //////////////
  // Constructions

  // using predefined ones

  String SLABFLOOR = "Medium Floor";
  String SLABGROUND = "Concrete Slab - wooden flooring";
  String SLABROOF = "Medium Roof/Ceiling Insulated";

  String WALLINTERIOR = "Brick Partition Wall - plastered";

  String WIN = "Trp Clr 3mm/13mm Arg";


  // defining a parametric construction
  String WALLFACADE = "wall facade";
  EnergyPlus.defineConstruction(WALLFACADE, "wood 20mm", "air gap", "insulation parametric", "Masonry 24", "Plaster In");    

  // set the air change rate (.5 ACH standard for housing)
  EnergyPlus.defineOutdoorAirSpecification("outdoorAirSpec", .5f);

  initInternalLoads();

  layerList = loadStrings(sketchPath("loadLayers.txt"));
  Group[] importedObj = new Group[layerList.length];
  Obj[] zones = new Obj[layerList.length];

  for (int z=0; z<layerList.length; z++) {
    zoneCount = zoneCount+1;
    if (layerList[z].equals("00_Scene")) {
      zoneCount = zoneCount-1;
    }
    zones[z] = new Obj();
    String[] temp = split(layerList[z], "_");
    if (temp[1].equals("Zone2")) {
      numZones = 2;
    }
  }
  println(zoneCount);
  println(numZones);
  println(layerList.length);

  boolean emptyzone = false;

  for (int i=0; i<layerList.length; i++) { ///start loop of imported obj files
    objLoc = layerList[i]+".obj";
    txtLoc = layerList[i]+".txt";
    zoneName = layerList[i];

    println(objLoc);
    println(txtLoc);
    
    if (layerList[i].equals("00_Scene")) {
      println("scene found");
      importedObj[i] = new OBJLoader(sketchPath(objLoc)).main; 

      EnergyPlus.setType(zones[i], EnergyPlus.SCENE);
      EnergyPlus.setName(zones[i], zoneName);

      for (int m=0; m<importedObj[i].numOfGroup(); m++) {
        tempFaces = importedObj[i].group(m).allFaces();
        for (int f=0; f<tempFaces.size(); f++) {
          Face sc = tempFaces.get(f);
          sc.stroke(100,100,100);
          sc.fill(100,100,100,200);
          zones[i].add(sc);
        }
      }
      fullModel.add(zones[i]);
    } 
    else {

      int rd = i*50;
      int grn = i*50;
      int bl = i*50;
      println("-------fail------");
      println(i);
      importedObj[i] = new OBJLoader(sketchPath(objLoc)).main; 
      println("-------end fail------");
      matchList = loadStrings(sketchPath(txtLoc));
      

      int count = 0;
      String[] grpMat = new String [importedObj[i].numOfGroup()];

      for (int j=0; j<matchList.length; j++) {
        char tempChar = matchList[j].charAt(0);
        if (tempChar=='g') {
          String[] mat = split(matchList[j], " ");
          grpMat[count] = mat[1];
          count = count+1;
        }
      }

      EnergyPlus.setName(zones[i], zoneName);
      EnergyPlus.setHVACcontrolled(zones[i], "All Zones", "outdoorAirSpec");

      String[] zoneID = split (zoneName, "_");

      /////LOOP THROUGH THE GROUPS WITHIN THE EACH ZONE OBJ FILE
      /////CREATE FACES, ASSIGN MATERIALS AND ADD TO NEW OBJ CALLED 'ZONE'
      /////THEN ADD THE ZONE OBJ TO THE ANAR GROUP

      for (int m=0; m<importedObj[i].numOfGroup(); m++) {
        tempFaces = importedObj[i].group(m).allFaces();

        if (grpMat[m].equals("MAT_wallWindow")) {
          println(m + " MAT_wallWindow"+" found");
          for (int f=0; f<tempFaces.size(); f++) {
            Face wall = tempFaces.get(f).apply(rotZ);
            wall.stroke(125, 125, 155, 100);
            wall.fill(150, 150, 255);
            //////ASSIGN ENERGY PLUS MATERIAL HERE
            EnergyPlus.setType(wall, EnergyPlus.WALL); 
            EnergyPlus.setBoundary(wall, EnergyPlus.OUTDOORS);
            EnergyPlus.setConstruction(wall, WALLFACADE);
            //////ADD GEOMETRY TO GROUP
            zones[i].add(wall);
            //////ASSIGN ENERGY PLUS MATERIAL HERE
            Face window = wall.percent(windowWall);
            window.stroke(200, 200, 200, 100);
            window.fill(0, 255, 255);
            EnergyPlus.setType(window, EnergyPlus.WINDOW);
            EnergyPlus.setConstruction(window, WIN);
            EnergyPlus.setParent(window, wall);
            //////ADD GEOMETRY TO GROUP
            zones[i].add(window);
          }
        } 
        else if (grpMat[m].equals("MAT_wallWindowShade")) {
          println(m + " MAT_wallWindowShade"+" found");
          for (int f=0; f<tempFaces.size(); f++) {
            Face wall = tempFaces.get(f).apply(rotZ);
            wall.stroke(125, 125, 155, 100);
            wall.fill(255, 0, 0);
            //////ASSIGN ENERGY PLUS MATERIAL HERE
            EnergyPlus.setType(wall, EnergyPlus.WALL); 
            EnergyPlus.setBoundary(wall, EnergyPlus.OUTDOORS);
            EnergyPlus.setConstruction(wall, WALLFACADE);
            //////ADD GEOMETRY TO GROUP
            zones[i].add(wall);
            //////ASSIGN ENERGY PLUS MATERIAL HERE
            Face window = wall.percent(windowWall);
            window.stroke(200, 200, 200, 100);
            window.fill(0, 0, 255);
            EnergyPlus.setType(window, EnergyPlus.WINDOW);
            EnergyPlus.setConstruction(window, WIN);
            EnergyPlus.setParent(window, wall);
            //////ADD GEOMETRY TO GROUP
            zones[i].add(window);

            // create a enclosing frame around the window
            //Obj shades = new Extrude(window, new Pts(window.center(), window.normal(1)));
            // this parametric version requires a new version of the library
            Obj shades = new Extrude(window, new Pts(window.center(), window.normal(shadinglength)));
            
            // remove the top and bottom of the extrusion
            shades.removeFace(5);
            shades.removeFace(4);

            for (int ii=0; ii<shades.numOfFaces(); ii++) {
              Face shade = shades.face(ii); 
              shade.stroke(125, 125, 205);
              shade.fill(255, 0, 0);
              EnergyPlus.setType(shade, EnergyPlus.SHADING);
              EnergyPlus.setParent(shade, window);
              //////ADD GEOMETRY TO GROUP
              zones[i].add(shade);
            }
          }
        } 

        else if (grpMat[m].equals("MAT_wallExt")) {
          println(m + " MAT_wallExt"+" found");
          for (int f=0; f<tempFaces.size(); f++) {
            Face wall = tempFaces.get(f).apply(rotZ);
            wall.stroke(125, 125, 155, 100);
            wall.fill(150, 150, 150);
            //////ASSIGN ENERGY PLUS MATERIAL HERE
            EnergyPlus.setType(wall, EnergyPlus.WALL); 
            EnergyPlus.setBoundary(wall, EnergyPlus.OUTDOORS);
            EnergyPlus.setConstruction(wall, WALLFACADE);
            //////ADD GEOMETRY TO GROUP
            zones[i].add(wall);
          }
        }  
        else if (grpMat[m].equals("MAT_wallInt")) {
          println(m + " MAT_wallInt"+" found");
          for (int f=0; f<tempFaces.size(); f++) {
            Face wall = tempFaces.get(f).apply(rotZ);
            wall.stroke(125, 150, 150, 100);
            //////ASSIGN ENERGY PLUS MATERIAL HERE
            EnergyPlus.setType(wall, EnergyPlus.WALL); 
            EnergyPlus.setBoundary(wall, zones[i-1]);
            EnergyPlus.setConstruction(wall, WALLINTERIOR);
            //////ADD GEOMETRY TO GROUP
            zones[i].add(wall);
          }
        }
        else if (grpMat[m].equals("MAT_floor")) {
          println(m + " MAT_floor"+" found");
          for (int f=0; f<tempFaces.size(); f++) {
            Face flr = tempFaces.get(f).apply(rotZ);
            flr.stroke(125, 150, 125, 100);   
            //////ASSIGN ENERGY PLUS MATERIAL HERE
            EnergyPlus.setType(flr, EnergyPlus.FLOOR); 
            if (numZones == 2) {
              EnergyPlus.setBoundary(flr, zones[i-2]);
            } 
            else {
              EnergyPlus.setBoundary(flr, zones[i-1]);
            }
            EnergyPlus.setConstruction(flr, SLABFLOOR);
            //////ADD GEOMETRY TO GROUP
            zones[i].add(flr);
          }
        }
        else if (grpMat[m].equals("MAT_ground")) {
          println(m + " MAT_ground"+" found");
          for (int f=0; f<tempFaces.size(); f++) {
            Face flr = tempFaces.get(f).apply(rotZ);
            flr.stroke(150, 125, 125, 100);
            //////ASSIGN ENERGY PLUS MATERIAL HERE
            EnergyPlus.setType(flr, EnergyPlus.FLOOR); 
            EnergyPlus.setBoundary(flr, EnergyPlus.GROUND);
            EnergyPlus.setConstruction(flr, SLABGROUND);
            //////ADD GEOMETRY TO GROUP
            zones[i].add(flr);
          }
        }
        else if (grpMat[m].equals("MAT_roof")) {
          println("MAT_roof"+" found");
          for (int f=0; f<tempFaces.size(); f++) {
            Face roof = tempFaces.get(f).apply(rotZ);
            roof.stroke(100, 100, 150, 100);
            roof.fill(0, 255, 0);
            //////ASSIGN ENERGY PLUS MATERIAL HERE
            EnergyPlus.setType(roof, EnergyPlus.ROOF); 
            EnergyPlus.setBoundary(roof, EnergyPlus.OUTDOORS);
            EnergyPlus.setConstruction(roof, SLABROOF);
            //////ADD GEOMETRY TO GROUP
            zones[i].add(roof);
          }
        }

        if (grpMat[m].equals("MAT_shading")) {
          println("MAT_shading"+" found");
          for (int f=0; f<tempFaces.size(); f++) {
            Face shade = tempFaces.get(f).apply(rotZ);
            //////ASSIGN ENERGY PLUS MATERIAL HERE
            EnergyPlus.setType(shade, EnergyPlus.SCENE); 
            //////ADD GEOMETRY TO GROUP
            zones[i].add(shade);
          }
        }
      }///loop of groups in the imported obj file

        setInternalLoads(zones[i]);

      println("------------------ number of faces in zone "+zones[i].numOfFaces());

      if (zones[i].numOfFaces()==0) {
        emptyzone = true;
        println("\n\nTHERE IS AN EMPTY ZONE IN THE MODEL.\n MAKE SURE THE LAYER ASSIGNEMENT ISN SKETCHUP IS CORRECT\n\n");
    }
      
      fullModel.add(zones[i]);
      Anar.camTarget(fullModel);
    }

  }///end loop of imported obj files
  
    if (emptyzone)
      println("\n\nTHERE IS AN EMPTY ZONE IN THE MODEL.\n MAKE SURE THE LAYER ASSIGNEMENT ISN SKETCHUP IS CORRECT\n\n");
//    Anar.camTarget(fullModel);
}

