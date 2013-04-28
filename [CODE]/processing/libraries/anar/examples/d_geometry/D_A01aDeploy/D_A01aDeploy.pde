import processing.opengl.*;
import processing.opengl.*;
import anar.*;

//import geometry.Point3D;




/*
 * Example for Anar library (Architectural Research)
 * by Guillaume LaBelle and Julien Nembrini (c) 2008
 * http://anar.ch
 */

;
Obj myObject;

Param angle = new Param(0.7f,-PI/4f,PI/4f);


///////////////////////////////////
///////////////////////////////////
///////////////////////////////////
///////////////////////////////////

void setup(){

    //size(800,400,OPENGL);
    size(1000,500,OPENGL);
  Anar.init(this);
  Anar.drawAxis(true);

  myObject = generatorDeploy();
  myObject.scale(5);    
  Anar.sliders(angle);
  Anar.camTarget(myObject);
  
  //TODO: (Bug) parentList not working (strange endless loop)
  //myObject.parentList(-1);
}

///////////////////////////////////
///////////////////////////////////
///////////////////////////////////
///////////////////////////////////


void draw(){
  background(255);
  myObject.draw();
}  


///////////////////////////////////
///////////////////////////////////
///////////////////////////////////
///////////////////////////////////


Obj generatorDeploy(){

  ///////////////////////////////////
  ///////////////////////////////////
  //INIT SOME CONTAINERS
  Obj outputFmz = new Obj();



  ///////////////////////////////////    
  ///////////////////////////////////
  //PREPARE TRANSFORMS

  //We limit the set of transforms to three different
  //    It will produce a limited set of different patterns

  //The elementary operation
  Translate modulor = new Translate(Anar.PtNull(0,0,1));


  //Create 3 subsequent Transform from this one
  //  I use TransformLinear to combine them as a group
  Transform sideA = new Transform();
  sideA.add(modulor);

  Transform sideB = new Transform();
  sideB.add(modulor);
  sideB.add(modulor);

  Transform sideC = new Transform();
  sideC.add(modulor);
  sideC.add(modulor);
  sideC.add(modulor);

  //Then I have three different transforms from the first one
  //  They have different lengths
  //  Remark, I ends up with only one parameter


  //Combine them in a table (it will be usefull when randomized)
  //    Here I need to remember that 0 is short, 1 normal and 2 is long
  Transform[] sides = new Transform[3];
  sides[0] = sideA;
  sides[1] = sideB;
  sides[2] = sideC;


  //It's good for sides
  //    Now let's create a rotation (let's keep it simple with only one rotation)
  //    On the chantier, it correspond to uniforms clips between panels

  //I need to create a RotateZ as it will be used inside Allingn
  //    Allign will allign an axis to Z coordinate then apply a transform and Come back to initial state
  RotateZ myRotation = new RotateZ(angle);


  ///////////////////////////////////    
  ///////////////////////////////////
  //ASSIGN TRANSFORMS    

  //I<ll create to lines and combine them later    
  Pts ptsA = new Pts();
  Pts ptsB = new Pts();

  //I need two initial points
  //    This is where I set the side length of the whole thing
  Pt originA = Anar.Pt(0,0,0).tag("originA");
  Pt originB = Anar.Pt(0,5,0).tag("originB");

  //Add them to the list
  ptsA.add(originA);
  ptsB.add(originB);
  
  //(Update) We need those POints to orient the translation
  PtDER originAA = Anar.Pt(originA);
  PtDER originBB = Anar.Pt(originB);
  
  originAA.apply(sides[0]);
  originBB.apply(sides[0]);
  
  //Add them to the list
  ptsA.add(originAA);
  ptsB.add(originBB);   
  

  //As the form is an inerplay between aNewPoint and a previousPt
  //    I<ll create two fields to track them
  //    Note, it's not derrived, it is the point itself (Pt previousA = Anar.Pt(originA))
  Pt previousA = originAA;
  Pt previousB = originBB;
  
  Pt previousAA = originA;
  Pt previousBB = originB;    
  


  //Ineed also to track the difference between both (number of times betweens modulos)
  //    At the beginning they are both alligns
  //    -1 means that ptsB is from a distance 1 of modulor less than ptsA
  //     2 means that ptsB is from a distance 2 of modulor more than ptsA
  int delta = 0;

  for (int i = 0; i<100; i++){
    //Create a points from previous (i label them - optional)
    PtDER newPtA = Anar.Pt(previousA).tag("A"+i);
    PtDER newPtB = Anar.Pt(previousB).tag("B"+i);

    //Choose one translations from our set.
    //    (we won't accept delta to be too long as we want to keep the set of faces to a small set of cases
    int lengthA, lengthB;   //Correspond to sides[0,1,2]

    do{
      lengthA = (int)random(sides.length);
      lengthB = (int)random(sides.length);
    } while (Math.abs(lengthA-lengthB+delta)>3); //Here I limit the maximum sitance between paths (both ways)

    //Update new delta state
    delta += lengthA-lengthB;
    

    //Create Rotation from an axis (eachPoint is different
    //    allign need an axis of rotation (defined here by the two old resulting points (previuos)
    //    axis = previousA,previousB
    Transform axisRotateA = new Transform(previousA,previousB,myRotation); 
    Transform axisRotateB = new Transform(previousA,previousB,myRotation); 
    
    
    //Create a Translation alligned with the previous
    //    Remember that we don't know how is oriented the last face
    Transform orientedTranslationA = new Transform(previousAA,previousA,sides[lengthA]); 
    Transform orientedTranslationB = new Transform(previousBB,previousB,sides[lengthB]); 
    
    
    //Apply to rotation to the translation
    Transform comboA = new Transform();
    comboA.add(orientedTranslationA);     
    comboA.add(axisRotateA);         //From the beginning

    
    Transform comboB = new Transform();   
    comboB.add(orientedTranslationB);     
    comboB.add(axisRotateB);         //From the beginning          
    


    //Here's where evrything is set together pt with transform
    newPtA.apply(comboA);
    newPtB.apply(comboB);
    
    //Alternative (if we don't want to apply the rotation
    //    Use this to see only the translation effect  on a plane    
    //newPtA.set(sides[lengthA]);
    //newPtB.set(sides[lengthB]);      
    
    
    //Put all that in that containers
    ptsA.add(newPtA);
    ptsB.add(newPtB);

    //Swap Previuos
    previousAA = previousA;
    previousBB = previousB;
    
    previousA = newPtA;
    previousB = newPtB;
  }



  ///////////////////////////////////    
  ///////////////////////////////////
  //RETURN EVRYTHING

  //cREATE FACES FROM TWO LINES WITH SAME NUMBERS OF POINTS
  outputFmz = new SweepTwoPaths(ptsA,ptsB);

  //Cosmetik
  print(ptsA);
  print(ptsB);
  //print(outputFmz.primitiveToString(-1));
  //TextIO.write("test.lsp",outputFmz.toAutocad());
  
  ptsA.color(new AColor(0,0,255));
  ptsB.color(new AColor(255,150,150));
  
  return outputFmz;

}



///////////////////////////////////
///////////////////////////////////
///////////////////////////////////
///////////////////////////////////





