import processing.opengl.*;
import anar.*;




	/** container for grown mesh */
	Obj conicalMesh;

	/** vertices on the edge of the circular mesh (closed loop) */
	Pts circularEdge;
	/** normals corresponding to vertices on the edge */
	Pts conicalNormals;
	/** vertices on the edge of the conical mesh already grown */
	Pts conicalEdge;
	/** vertices on the edge of the conical mesh corresponding to faces adjacent to circular edge vertices */
	Obj conicalNeighbours;
	/** edge of the offset mesh */
	Pts offsetEdge;
	Obj offsetNeighbours;
	
	
	/** container for construction lines */
	Obj construction;
	
	Obj circles;
	
	Param offset;
	Obj offsetMesh;
	Param dh;
	Param angleWeight;
	Param random;
	
	Param[] middleCurve = new Param[4];
	Param middleLength;

	Param h,w;
	void setup(){
		size(800,400,OPENGL);
		Anar.init(this);

		Anar.drawAxis();

		middleCurve[0] = new Param(0.1f, -1,1).addToSlidersMain();
		middleCurve[1] = new Param(0.1f, -1,1).addToSlidersMain();
		middleCurve[2] = new Param(0.1f, -1,1).addToSlidersMain();
		middleCurve[3] = new Param(0.1f, -1,1).addToSlidersMain();
		middleLength = new Param(5,0,10).addToSlidersMain();
		dh = new Param(31.6245f,30,32).addToSlidersMain();
		angleWeight = new Param(.5f,0,1).addToSlidersMain();
		random = new Param(0.1f,0,1).addToSlidersMain();
		offset = new Param(-1,-10,10).addToSlidersMain();
		h = new Param(30);
		w = new Param(10,0,20).addToSlidersMain();

		initGrowth();
		
	}  


	/** start with a circular mesh of 4 equiplanar squares */
	void initGrowth() {
		
		
		circles = new Obj();
		construction = new Obj();
		
		Pt o = Anar.Pt(0,0,dh);
		Pt E = Anar.Pt(w.inv(),0,h);
		Pt W = Anar.Pt(w,0,h);
		Pt N = Anar.Pt(0,w,h);
		Pt S = Anar.Pt(0,w.inv(),h);
		
		Pt NE = addCircularPoint(N,o,E);
		Pt SW = addCircularPoint(S,o,W);
		Pt NW = addCircularPoint(N,o,W);
		Pt SE = addCircularPoint(S,o,E);
		
		Pt n = Anar.Pt(0,0,1);

		construction.add(new Pts(o,W));
		construction.add(new Pts(o,S));
		construction.add(new Pts(o,E));
		construction.add(new Pts(o,N));

		
		// transport normals
		Pt nN = transportNormals(o,N,o.plus(n));
		Pt nE = transportNormals(o,E,o.plus(n));
		Pt nW = transportNormals(o,W,o.plus(n));
		Pt nS = transportNormals(o,S,o.plus(n));

		circularEdge = new Pts(N,NW,W,SW,S,SE,E,NE);

		Pt nNW = transportNormals(N,NW,nN);
		Pt nNWb = transportNormals(W,NW,nW);

		Pt nNE = transportNormals(N,NE,nN);
		Pt nNEb = transportNormals(E,NE,nE);
		
		Pt nSW = transportNormals(S,SW,nS);
		Pt nSWb = transportNormals(W,SW,nW);
		
		Pt nSE = transportNormals(S,SE,nS);
		Pt nSEb = transportNormals(E,SE,nE);

		println(nSE +" "+ nSEb);
		println(nSW +" "+ nSWb);
		
		conicalNormals = new Pts(nN,nNW,nW,nSW,nS,nSE,nE,nNE);
		
		Pt cNE = new PtInterPlane(NE,nNE,N,nN,E,nE);
		Pt cNW = new PtInterPlane(NW,nNW,N,nN,W,nW);
		Pt cSE = new PtInterPlane(SE,nSE,S,nS,E,nE);
		Pt cSW = new PtInterPlane(SW,nSW,S,nS,W,nW);

//		Pt cNE = new PtInterPlane(o,n,N,nN,E,nE);
//		Pt cNW = new PtInterPlane(o,n,N,nN,W,nW);
//		Pt cSE = new PtInterPlane(o,n,S,nS,E,nE);
//		Pt cSW = new PtInterPlane(o,n,S,nS,W,nW);

		
		conicalEdge = new Pts(cNW,cSW,cSE,cNE);
		
		Pt oNW = offsetPoint(NW,N,W,cNW,offset);
		Pt oSW = offsetPoint(SW,S,W,cSW,offset);
		Pt oSE = offsetPoint(SE,S,E,cSE,offset);
		Pt oNE = offsetPoint(NE,N,E,cNE,offset);

//		Pt oNW = offsetPoint(o,N,W,cNW,offset);
//		Pt oSW = offsetPoint(o,S,W,cSW,offset);
//		Pt oSE = offsetPoint(o,S,E,cSE,offset);
//		Pt oNE = offsetPoint(o,N,E,cNE,offset);
		
		offsetEdge = new Pts(oNW,oSW,oSE,oNE);
		
		conicalNeighbours = new Obj();
		offsetNeighbours = new Obj();
		for (int i=0; i<circularEdge.numOfPts(); i++) {
			// build conical neighbours
			Pts neigh = new Pts();
			if (i%2==0) {
				neigh.add(conicalEdge.ptMod(i/2 - 1));
				neigh.add(conicalEdge.ptMod(i/2));
			} else
				neigh.add(conicalEdge.pt(i/2));
			conicalNeighbours.add(neigh);
			// build offset neighbours parallely
			neigh = new Pts();
			if (i%2==0) {
				neigh.add(offsetEdge.ptMod(i/2 - 1));
				neigh.add(offsetEdge.ptMod(i/2));
			} else
				neigh.add(offsetEdge.pt(i/2));
			offsetNeighbours.add(neigh);	
		}
		
		conicalMesh = new Obj();
		// draw cone axis to see when it matches the conical construction
//		Pt centerNW = new PtCircumCenter(N,W,o);
//		Pt centerNE = new PtCircumCenter(N,E,o);
//		Pt centerSW = new PtCircumCenter(S,W,o);
//		Pt centerSE = new PtCircumCenter(S,E,o);
//		
//		conicalMesh.add(new Pts(centerNW,Anar.Pt(Vertex.plus(Vertex.cross(Vertex.minus(N,centerNW),Vertex.minus(W,centerNW)),centerNW))));
//		conicalMesh.add(new Pts(centerSW,Anar.Pt(Vertex.plus(Vertex.cross(Vertex.minus(S,centerSW),Vertex.minus(W,centerSW)),centerSW))));
//		conicalMesh.add(new Pts(centerNE,Anar.Pt(Vertex.plus(Vertex.cross(Vertex.minus(N,centerNE),Vertex.minus(E,centerNE)),centerNE))));
//		conicalMesh.add(new Pts(centerSE,Anar.Pt(Vertex.plus(Vertex.cross(Vertex.minus(S,centerSE),Vertex.minus(E,centerSE)),centerSE))));
		
		conicalMesh.add(new Face(cNW,cNE,cSE,cSW));
						
		// offset
		offsetMesh = new Obj();
		offsetMesh.add(new Face(cNW,oNW,oNE,cNE));
		offsetMesh.add(new Face(cSW,oSW,oSE,cSE));
		offsetMesh.add(new Face(cNW,oNW,oSW,cSW));
		offsetMesh.add(new Face(cSE,oSE,oNE,cNE));
		
		Anar.camTarget(conicalMesh);

		
	}
	
	void growMesh() {

		Pts newCircularEdge = new Pts();
		Pts newConicalEdge = new Pts();
		Pts newConicalNormals = new Pts();
		Obj newConicalNeighbours = new Obj();
		Pts newOffsetEdge = new Pts();
		Obj newOffsetNeighbours = new Obj();
		
		Vertex n = new Vertex();
		
		// find corner to start
		int start=0;
		for (int i=0; i<circularEdge.numOfPts(); i++) {
			if (conicalNeighbours.line(i).numOfPts() == 1) {
				start=i;
				break;
			}
		}
		
		// initialize curvature counter
		int curveC = 0;
		
		// since sure to be at corner
		// initialize lists
		newCircularEdge.add(circularEdge.pt(start));
		newConicalEdge.add(conicalNeighbours.line(start).pt(0));
		newConicalNormals.add(conicalNormals.pt(start));
		newConicalNeighbours.add(new Pts(conicalNeighbours.line(start).pt(0)));
		newOffsetEdge.add(offsetEdge.pt(start));
		newOffsetNeighbours.add(new Pts(offsetNeighbours.line(start).pt(0)));
		
		
		for (int i=0; i<circularEdge.numOfPts(); i++) {
			
		    int ii = i+start;
		    
		    boolean lastPoint = false;
		    if (i == circularEdge.numOfPts()-1) lastPoint = true; 
			
			Pt p = circularEdge.ptMod(ii-1);
			Pt q = circularEdge.ptMod(ii);
			Pt r = circularEdge.ptMod(ii+1);
			
			Vertex m = Vertex.cross(q.minus(p),q.minus(r)); 
			if (i == start) n = m;
			
			// compute angle
			float angle = Vertex.angle(p, q, r);
			// use normal to infer triangle orientation
			if (Vertex.dot(n, m)<0) 
				angle = 2 * (float) Math.PI - angle;
				
			
			// grow according to rules
			// first try to make only use of neighbours
			
			float tau = (float) Math.PI/10;
			
			//////////////
			//////////
			// TODO make it orphaned
			
			
//			if (angle < Math.PI + tau) {
			if (conicalNeighbours.lineMod(ii).numOfPts() == 3) {
				// corner of the edge -> add single circular face
				Pt newPt = addCircularPoint(p,q,r);
				
				// complete new circular edge
				newCircularEdge.add(newPt);
				if (!lastPoint) newCircularEdge.add(r);
				
				// transport normals by symmetry
				Pt newN = transportNormals(p,newPt,conicalNormals.ptMod(ii-1));
				newConicalNormals.add(newN);
				if (!lastPoint) newConicalNormals.add(conicalNormals.ptMod(ii+1));
				
				// compute new conical edge
				Pt newPtConic = (new PtInterPlane(newPt,newN.minus(newPt),
						p,conicalNormals.ptMod(ii-1).minus(p),q,conicalNormals.ptMod(ii).minus(q))).orphaned();

				newConicalEdge.add(newPtConic);
				
				Pts neigh = conicalNeighbours.lineMod(ii);
				newConicalEdge.add(neigh.pt(2));
				
				// complete new conical neighbours list
				// in this case only one neighbour
				newConicalNeighbours.lineEnd().add(newPtConic);
				newConicalNeighbours.add(new Pts(newPtConic));
				if (!lastPoint) newConicalNeighbours.add(new Pts(newPtConic,neigh.pt(2)));
				else newConicalNeighbours.line(0).add(0,newPtConic);
				
				// add faces to conical mesh
				// 3 neighbours plus one point
				Face conical = new Face(neigh);
				conical.add(newPtConic);
				conicalMesh.add(conical.copy().orphaned());

				// compute new offset point
				Pt newPtOffset = offsetPoint(p,q,r,newPtConic,offset);
				Pts neighOff = offsetNeighbours.lineMod(ii);
				// complete offset edge
				newOffsetEdge.add(newPtOffset);
				newOffsetEdge.add(neighOff.pt(2));
				// complete new offset neighbours list
				// in this case only one neighbour
				newOffsetNeighbours.lineEnd().add(newPtOffset);
				newOffsetNeighbours.add(new Pts(newPtOffset));
				if (!lastPoint) newOffsetNeighbours.add(new Pts(newPtOffset,neighOff.pt(2)));
				else newOffsetNeighbours.line(0).add(0,newPtOffset);				
				
				// add faces to offset mesh
				offsetMesh.add(new Face(neighOff.pt(0),newPtOffset,newPtConic,neigh.pt(0)));
				offsetMesh.add(new Face(neighOff.pt(2),newPtOffset,newPtConic,neigh.pt(2)));
				
//			} else if (angle < 2*Math.PI - tau) {
			} else if (conicalNeighbours.lineMod(ii).numOfPts() == 2) {
				// normal growth -> add two circular faces + choose orientation of middle edge

				// choose bisectrix of angle + deflect using normal from cross product
				// TODO first choice let's see how it goes
				Vertex dir0 = Vertex.minus(q,p).normalize(); 
				Vertex dir1 = Vertex.minus(q,r).normalize(); 

				Vertex normal = (Vertex) Vertex.cross(dir0, dir1).multiply(-1);
				Vertex bisectCurvature;
				if (normal.length()>0.1) {
					normal.normalize();
					bisectCurvature = Vertex.plus(dir0,dir1).normalize();
				} else {
					normal = new Vertex(conicalNormals.ptMod(ii).minus(q)).normalize();
					bisectCurvature = Vertex.cross(dir0,normal).normalize();
				}
				println(normal+"\t "+bisectCurvature);
				
				Vertex middle;
				middle = (Vertex) normal.multiply(middleLength.toFloat());
				middle = (Vertex) middle.plus(bisectCurvature.multiply(middleCurve[curveC].toFloat()));
				middle = (Vertex) middle.plus(q);
					
				curveC++;
				
				int localShape = 0;
				if (conicalNeighbours.lineMod(ii-1).numOfPts()==1) localShape++;
				if (conicalNeighbours.lineMod(ii+1).numOfPts()==1) localShape+=2;
				
				Pt middlePt = Anar.Pt(middle);
				
				switch (localShape) {
				case 3 : // corner before and after

					Pt newPt1 = addCircularPoint(p,q,middlePt);
					Pt newPt2 = addCircularPoint(r,q,middlePt);

					// complete new circular edges
					newCircularEdge.add(newPt1,middlePt,newPt2);
					if (!lastPoint) newCircularEdge.add(r);
					
					// transport normals by symmetry
					Pt newNp = transportNormals(p,newPt1,conicalNormals.ptMod(ii-1));
					newConicalNormals.add(newNp);
					Pt newNq = transportNormals(q,middlePt,conicalNormals.ptMod(ii));
					newConicalNormals.add(newNq);
					Pt newNr = transportNormals(r,newPt2,conicalNormals.ptMod(ii+1));
					newConicalNormals.add(newNr);
					if (!lastPoint) newConicalNormals.add(conicalNormals.ptMod(ii+1));
					
					// compute new conical edges
//					Pt newPtConic1 = new PtInterPlane(newPt1,newNp.minus(newPt1),
//							p,conicalNormals.ptMod(ii-1).minus(p),q,conicalNormals.ptMod(ii).minus(q));
					Pt newPtConic1 = new PtInterPlane(newPt1,newNp.minus(newPt1),
							middlePt,newNq.minus(middlePt),p,conicalNormals.ptMod(ii-1).minus(p)).orphaned();

					Pt newPtConic2 = new PtInterPlane(newPt2,newNr.minus(newPt2),
							r,conicalNormals.ptMod(ii+1).minus(r),q,conicalNormals.ptMod(ii).minus(q)).orphaned();

					newConicalEdge.add(newPtConic1,newPtConic2);
					
					Pts neigh = conicalNeighbours.lineMod(ii);
					newConicalEdge.add(neigh.pt(1));
					
					// complete new conical neighbours list
					// in this case added five points on edge so five lists
					newConicalNeighbours.lineEnd().add( newPtConic1);
					newConicalNeighbours.add(new Pts(newPtConic1));
					newConicalNeighbours.add(new Pts(newPtConic1,newPtConic2));
					newConicalNeighbours.add(new Pts(newPtConic2));
					if (!lastPoint) newConicalNeighbours.add(new Pts(newPtConic2,neigh.pt(1)));
					else newConicalNeighbours.line(0).add(0,newPtConic2);
						
					// add faces to conical mesh
					// 3 neighbours plus one point
					Face conical = new Face(neigh);
					conical.add(newPtConic2);
					conical.add(newPtConic1);
					conicalMesh.add(conical.copy().orphaned());
					
					// compute new offset point
					Pt newPtOffset1 = offsetPoint(p,q,r,newPtConic1,offset);
					Pt newPtOffset2 = offsetPoint(p,q,r,newPtConic2,offset);
					Pts neighOff = offsetNeighbours.lineMod(ii);
					// complete offset edge
					newOffsetEdge.add(newPtOffset1,newPtOffset2);
					newOffsetEdge.add(neighOff.pt(1));
					// complete new offset neighbours list
					// in this case only one neighbour
					newOffsetNeighbours.lineEnd().add(newPtOffset1);
					newOffsetNeighbours.add(new Pts(newPtOffset1));
					newOffsetNeighbours.add(new Pts(newPtOffset1,newPtOffset2));
					newOffsetNeighbours.add(new Pts(newPtOffset2));
					if (!lastPoint) newOffsetNeighbours.add(new Pts(newPtOffset2,neighOff.pt(1)));
					else newOffsetNeighbours.line(0).add(0,newPtOffset2);				
					
					// add faces to offset mesh
					offsetMesh.add(new Face(neighOff.pt(0),newPtOffset1,newPtConic1,neigh.pt(0)));
					offsetMesh.add(new Face(neighOff.pt(1),newPtOffset2,newPtConic2,neigh.pt(1)));
					offsetMesh.add(new Face(newPtConic1,newPtOffset1,newPtOffset2,newPtConic2));
						
					break;
				case 2 : // corner after
					newPt1 = newCircularEdge.ptEnd(1);
					middlePt = newCircularEdge.ptEnd(); 
					newPt2 = addCircularPoint(r,q,middlePt);

					// complete new circular edges
					newCircularEdge.add(newPt2);
					if (!lastPoint) newCircularEdge.add(r);
						
					// transport normals by symmetry
					newNr = transportNormals(r,newPt2,conicalNormals.ptMod(ii+1));
					newConicalNormals.add(newNr);
					if (!lastPoint) newConicalNormals.add(conicalNormals.ptMod(ii+1));

					// compute new conical edges
					newPtConic1 = newConicalEdge.ptEnd();
					newPtConic2 = new PtInterPlane(newPt2,newNr.minus(newPt2),
							r,conicalNormals.ptMod(ii+1).minus(r),q,conicalNormals.ptMod(ii).minus(q)).orphaned();

					newConicalEdge.add(newPtConic2);

					
					neigh = conicalNeighbours.lineMod(ii);
					newConicalEdge.add(neigh.pt(1));
					
					// complete new conical neighbours list
					// in this case added five points on edge so five lists
					newConicalNeighbours.lineEnd().add(newPtConic2);
					newConicalNeighbours.add(new Pts(newPtConic2));
					if (!lastPoint) newConicalNeighbours.add(new Pts(newPtConic2,neigh.pt(1)));
					else newConicalNeighbours.line(0).add(0,newPtConic2);

					// add faces to conical mesh
					// 3 neighbours plus one point
					conical = new Face(neigh);
					conical.add(newPtConic2);
					conical.add(newPtConic1);
					conicalMesh.add(conical.copy().orphaned());
					
					// add faces to offset mesh
					//TODO copy from above
					
					break;
				case 1 : //corner before
					newPt1 = addCircularPoint(p,q,middlePt);

					// complete new circular edges
					newCircularEdge.add(newPt1,middlePt);
					
					// transport normals by symmetry
					newNp = transportNormals(p,newPt1,conicalNormals.ptMod(ii-1));
					newConicalNormals.add(newNp);
					newNq = transportNormals(q,middlePt,conicalNormals.ptMod(ii));
					newConicalNormals.add(newNq);
					
					// compute new conical edges
					newPtConic1 = new PtInterPlane(newPt1,newNp.minus(newPt1),
							p,conicalNormals.ptMod(ii-1).minus(p),q,conicalNormals.ptMod(ii).minus(q)).orphaned();

					newConicalEdge.add(newPtConic1);
					
					neigh = conicalNeighbours.lineMod(ii);
					
					// complete new conical neighbours list
					// in this case added five points on edge so five lists
					newConicalNeighbours.lineEnd().add(newPtConic1);
					newConicalNeighbours.add(new Pts(newPtConic1));
					newConicalNeighbours.add(new Pts(newPtConic1));
				    
					// add no faces to conical mesh

					// TODO offset mesh copy from above
					
					break;
				case 0 : // no corner
					middlePt = newCircularEdge.ptEnd();
					newPt2 = addCircularPoint(r,q,middlePt);

					// complete new circular edges
					newCircularEdge.add(newPt2);
					
					// transport normals by symmetry
					newNr = transportNormals(r,newPt2,conicalNormals.ptMod(ii+1));
					newConicalNormals.add(newNr);
					
					// compute new conical edges
					newPtConic1 = newConicalEdge.ptEnd();
					
					newPtConic2 = new PtInterPlane(newPt2,newNr.minus(newPt2),
							r,conicalNormals.ptMod(ii+1).minus(r),q,conicalNormals.ptMod(ii).minus(q)).orphaned();

					newConicalEdge.add(newPtConic2);
					
					neigh = conicalNeighbours.lineMod(ii);
					
					// complete new conical neighbours list
					newConicalNeighbours.lineEnd().add(newPtConic2);
					newConicalNeighbours.add(new Pts(newPtConic2));
				    
					// add face to conical mesh
					conical = new Face(neigh);
					conical.add(newPtConic2);
					conical.add(newPtConic1);
					conicalMesh.add(conical.copy().orphaned());
					
					// add faces to offset mesh

					// TODO offset mesh copy from above

					break;					
				}				
				
//			} else {
			} else if (conicalNeighbours.lineMod(ii).numOfPts() == 1) {
				// corner of the circular mesh -> don't grow
			}
				

			
		}
		
		circularEdge = newCircularEdge;
		conicalEdge = newConicalEdge;
		conicalNeighbours = newConicalNeighbours;
		conicalNormals = newConicalNormals;
		offsetEdge = newOffsetEdge;
		offsetNeighbours = newOffsetNeighbours;
		
//		for (int i=0; i<conicalNeighbours.numOfLines(); i++) {
//			print(conicalNeighbours.line(i).numOfPts()+" ");			
//		}
//		println();

		println(conicalMesh.numOfFaces());
		
		Anar.camTarget(conicalMesh);
	}
	
	Pt offsetPoint(Pt a, Pt b, Pt c, Pt conic, Param off) {
		
		Pt dir = new PtNormalize(new PtCircumCenter(a,b,c),conic);

		// check that offset direction is pointing vertically
		// TODO this is a stub. make it more general
		if (Vertex.dot(new Vertex(0,0,1), dir)<0)
			dir.scale(offset.inv());
		else dir.scale(offset);
		
		return conic.plus(dir).copy().orphaned();
	}

	
	Pt addCircularPoint(Pt a,Pt b,Pt c) {
		Pt center = new PtCircumCenter(a,b,c);

		circles.add(new Circle(a.orphaned(),b.orphaned(),c.orphaned()));
		
		Pt v1 =  a.minus(center);
		Pt v2 =  b.minus(center);
		Pt v3 =  c.minus(center);
		
		// variants of constraints on the mesh

		//		      Param rate = new Param(0.5f,0,1).addToSlidersMain();
//		float rate = fixArea(v1,v2,v3,10);
		//			  Param rate = new Param(fixParallel(v1,v2,v3),0,1).addToSlidersMain(); 
		float rate = fixParallel(v1,v2,v3,angleWeight.toFloat()); 
		 
		return new PtArc(a.orphaned(),b.orphaned(),c.orphaned(),rate);
	}
	
	Pt transportNormals(Pt p,Pt q, Pt n) {
		// both following symmetries correspond to orthogonal symmetry relative to mid point and segment
		Pt sym = new PtSymmetric(n,new PtMid(p,q));
		return (new PtSymmetric(sym,p,q)).orphaned();
	}
	
	


	float fixArea(Pt v1, Pt v2, Pt v3, float targetArea) {
		float r = v1.length();
		println(r);

		float alpha1 = (float) Math.acos(Vertex.dot(v1, v2)/(r*r));
		float alpha2 = (float) Math.acos(Vertex.dot(v1, v3)/(r*r));

		float sinA1 = (float) Math.sin(alpha1);
		float sinA2 = (float) Math.sin(alpha2);
		float C = (float) Math.sin(alpha1+alpha2); // c
		float B = 1f - (float) Math.cos(alpha1+alpha2);

		float deltaArea = targetArea - .5f*r*r*(sinA1+sinA2); 

		float delta = C*C - 4*B*B*(deltaArea - B*B); 

		float rate = .5f;
		if (delta > 0) {

			float x1 = (- C + (float) Math.sqrt(delta))/(2*B*B);
			float x2 = (- C - (float) Math.sqrt(delta))/(2*B*B);

			float alpha = 0;
			if (Math.abs(x1) <= 1)
				alpha = (float) Math.acos(x1);
			else if (Math.abs(x2) <= 1)
				alpha = (float) Math.acos(x2);
			rate = alpha/ ((float)(2*Math.PI) - alpha1 - alpha2);

		}
		float corr = .05f;
		if (rate == 0) rate += corr;
		if (rate == 1) rate -= corr;

		return rate;
	}


	float fixParallel(Pt v1, Pt v2, Pt v3, float weight) {

		float r = v1.length();
//			  println(r+" "+v2.length()+" "+v3.length());

		float alpha2 = (float) Math.acos(Vertex.dot(v1, v2)/(r*r));
		float alpha1 = (float) Math.acos(Vertex.dot(v2, v3)/(r*r));

//		float alpha2 = Vertex.angle(v1,new Vertex(), v2);
//		float alpha1 = Vertex.angle(v2,new Vertex(), v3);

//		println("angle a1 "+alpha1+" a2 "+alpha2);

		// one parallel
		float alphaV3 = (float) (2*Math.PI) - alpha1 - 2*alpha2;
		// second parallel
		float alphaV1 =  alpha1;
		// mean parallel
//		float alpha = (float) (Math.PI) - alpha2;

		float alpha = weight*alphaV1 + (1-weight)*alphaV3;
		
		float rate = 0;
		if (2*Math.PI - alpha1- alpha2 > 0.000001)
			rate = alpha/ ((float)(2*Math.PI) - alpha1 - alpha2);

		float corr = .1f;
		if (rate == 0) rate += corr;
		if (rate == 1) rate -= corr;
		
		return rate;
	}



	void draw(){
		background(225);
		if (drawCircularEdge) circularEdge.draw();
		if (drawConicalNormals) conicalNormals.draw();
		if (drawConicalEdge) conicalEdge.draw();
		if (drawConicalMesh) conicalMesh.draw();
		if (drawOffsetMesh) offsetMesh.draw();
		if (drawCirclesMesh) circles.draw();
		
		circularEdge.pt(0).draw();

      offsetMesh.draw();
	}

	boolean drawConicalEdge = true;
	boolean drawConicalMesh = true;
	boolean drawCirclesMesh = false;
	boolean drawConicalNormals = true;
	boolean drawCircularEdge = true;
	boolean drawOffsetMesh = true;
	
	int step = 0;

	void keyPressed(){
		if (key == ' ') growMesh();
		if (key == 'z') initGrowth();
		if (key == 'q') drawConicalMesh = !drawConicalMesh;
		if (key == 'w') drawCirclesMesh = !drawCirclesMesh;
		if (key == 'e') drawOffsetMesh = !drawOffsetMesh;
		if (key == 'd') drawConicalNormals = !drawConicalNormals;
		if (key == 's') drawCircularEdge = !drawCircularEdge;
		if (key == 'a') drawConicalEdge = !drawConicalEdge;
		
		// special situations selected for examples in paper
		if (key == 'x') for (int i=0; i<middleCurve.length; i++) middleCurve[i].set(0.01f);
		if (key == 'c') for (int i=0; i<middleCurve.length; i++) middleCurve[i].set(-.01f);
		if (key == 'v') for (int i=0; i<middleCurve.length; i++) middleCurve[i].set(0.5f);
		if (key == 'b') for (int i=0; i<middleCurve.length; i++) middleCurve[i].set(-.5f);
		if (key == 'n') for (int i=0; i<middleCurve.length; i++) middleCurve[i].set(-.45f + i*.3f); // strange
		if (key == 'm') for (int i=0; i<middleCurve.length; i++) middleCurve[i].set(i%2 * (i-2) * .3f + (i+1)%2 * -.8f); 
		if (key == ',') for (int i=0; i<middleCurve.length; i++) middleCurve[i].set(i%2 * .5f + (i+1)%2 * -.5f); //saddle point
		
  if (key == '.') {       
    
    Group conicalPanels = new Group();
    for(int i=0; i<conicalMesh.numOfFaces(); i++)
      conicalPanels.add(conicalMesh.face(i));
    
    ObjExporter.export(new Obj().add(circularEdge),"circularEdge"+step);
    ObjExporter.export(new Obj().add(conicalNormals),"conicalNormals"+step);
    ObjExporter.export(new Obj().add(conicalEdge),"conicalEdge"+step);
    ObjExporter.export(conicalPanels,"conicalPanels"+step);
    ObjExporter.export(conicalMesh,"conicalMesh"+step);
    ObjExporter.export(new Obj().add(offsetMesh),"offsetMesh"+step);
    ObjExporter.export(new Obj().add(circles),"circles"+step);
    step++;
  }		
  
   

		
	}


