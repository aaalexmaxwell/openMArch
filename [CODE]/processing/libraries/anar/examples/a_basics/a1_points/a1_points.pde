import processing.opengl.*;
import anar.*;



//TODO remove red lines in example 8 and 9, or make them gray
//TODO better text resolution




	int screen = 0; // current 'screen' = focused example (screen 0 = example 1 !)
	int screens = 9; // number of existing screens

	String title = new String("POINTS"); // title like POINTS, LINES, POLYLINES, ... (constant for this file)
	String[] subtitles = new String[screens]; // subtitles of each screen or example
	Group examples[] = new Group[screens]; // groups all point of each example for an easier handling

	AColor highlight = new AColor(209, 30, 5);
	AColor highlight2 = new AColor(209, 30, 5, 150);

	
	void setup(){
		
		size(1100, 600, OPENGL);
		Anar.init(this);
		
		// create (empty) groups and define default subtitles:
		for (int i = 0; i < screens; i++){
			subtitles[i] = "no subtitle defined";
			examples[i] = new Group();
		}
		
		
		
		
		
		
		
		
		
		
		// example 1:
		
		
		
		screen = 0;
		
		subtitles[screen] = new String("PtMid");
		Pt a1 = Anar.Pt(0f-200f, 200f);
		Pt a2 = Anar.Pt(60f-200f, 200f);
		
		PtMid a_PtMid = new PtMid(a1, a2);
		// = point in the middle between a1 and a2
		
		a_PtMid.fill(highlight); // make point red
		examples[screen].add(a1).add(a2).add(a_PtMid); // adding all points of this example to its group
	
	
	
	
		
		
		
		
		
		
		// example 2:
		
		
		
		screen = 1;
		
		subtitles[screen] = new String("PtMid subdivisions");
		Pt b1 = Anar.Pt(0f, -21f+200f);
		Pt b2 = Anar.Pt(40f, -21f+200f);
		Pt b3 = Anar.Pt(0f, -7f+200f);
		Pt b4 = Anar.Pt(40f, -7f+200f);
		Pt b5 = Anar.Pt(0f, 7f+200f);
		Pt b6 = Anar.Pt(40f, 7f+200f);
		Pt b7 = Anar.Pt(0f, 21f+200f);
		Pt b8 = Anar.Pt(40f, 21f+200f);

		
		PtMid b_PtMid1 = new PtMid(b1, b2, 10, 7);
		// = point at the specified subdivision between b1 and b2 = at 70% of the way from b1 to b2
		PtMid b_PtMid2 = new PtMid(b3, b4, 400, 280);
		// = point at the specified subdivision between b3 and b4 = same as before, since ratio is the same
		PtMid b_PtMid3 = new PtMid(b5, b6, 10, 5);
		// = point at the specified subdivision between b5 and b6 = in the middle
		PtMid b_PtMid4 = new PtMid(b7, b8, 10, 12);
		// = point at the specified subdivision between b7 and b8 = not between points anymore

		b_PtMid1.fill(highlight); // make point red
		b_PtMid2.fill(highlight); // make point red
		b_PtMid3.fill(highlight); // make point red
		b_PtMid4.fill(highlight); // make point red
		examples[screen].add(b1).add(b2).add(b_PtMid1); // adding all points of this example to its group
		examples[screen].add(b3).add(b4).add(b_PtMid2); // adding all points of this example to its group
		examples[screen].add(b5).add(b6).add(b_PtMid3); // adding all points of this example to its group
		examples[screen].add(b7).add(b8).add(b_PtMid4); // adding all points of this example to its group
	
	
	
	
		
		
		
		
		
		
		// example 3:
		
		
		
		screen = 2;
		
		subtitles[screen] = new String("PtBary 2 points");
		Pt c1 = Anar.Pt(0f+200f, -21f+200f);
		Pt c2 = Anar.Pt(40f+200f, -21f+200f);
		Pt c3 = Anar.Pt(0f+200f, -7f+200f);
		Pt c4 = Anar.Pt(40f+200f, -7f+200f);
		Pt c5 = Anar.Pt(0f+200f, 7f+200f);
		Pt c6 = Anar.Pt(40f+200f, 7f+200f);
		Pt c7 = Anar.Pt(0f+200f, 21f+200f);
		Pt c8 = Anar.Pt(40f+200f, 21f+200f);

		
		PtBary c_PtBary1 = new PtBary(c1, c2, 10f, 7f);
		// = point at the weighted location between c1 (weight is 10) and c2 (weight is 7) = closer to c1, since 10 > 7
		PtBary c_PtBary2 = new PtBary(c3, c4, 400f, 280f);
		// = point at the weighted location between c3 (weight is 400) and c4 (weight is 280) = NOT the same as before, ALTHOUGH ratio is the same (compare to PtMid)
		PtBary c_PtBary3 = new PtBary(c5, c6, 10f, 5f);
		// = point at the weighted location between c5 (weight is 10) and c6 (weight is 5) = distance to c5 is half the distance to c6
		PtBary c_PtBary4 = new PtBary(c7, c8, 10f, 12f);
		// = point at the weighted location between c7 (weight is 10) and c8 (weight is 12) = with POSITIVE weights, PtBary is ALWAYS located between the specified two points (compare to PtMid)
		

		c_PtBary1.fill(highlight); // make point red
		c_PtBary2.fill(highlight); // make point red
		c_PtBary3.fill(highlight); // make point red
		c_PtBary4.fill(highlight); // make point red
		examples[screen].add(c1).add(c2).add(c_PtBary1); // adding all points of this example to its group
		examples[screen].add(c3).add(c4).add(c_PtBary2); // adding all points of this example to its group
		examples[screen].add(c5).add(c6).add(c_PtBary3); // adding all points of this example to its group
		examples[screen].add(c7).add(c8).add(c_PtBary4); // adding all points of this example to its group

		

		
		
		
		
		
		
		
		// example 4:
		
		
		screen = 3;
		
		subtitles[screen] = new String("PtCircumCenter");
		Pt d1 = Anar.Pt(0f-200f, 0f);
		Pt d2 = Anar.Pt(40f-200f, 0f);
		Pt d3 = Anar.Pt(-7f-200f, 8f);
		
		PtCircumCenter d_PtCircumCenter = new PtCircumCenter(d1, d2, d3);
		// = center (point) of a circle which goes through d1, d2 and d3
		// = point with equal distances to d1, d2 and d3
		// (always existent if points are not equal or on a straight line)
		
		d_PtCircumCenter.fill(highlight); // make point red
		examples[screen].add(d1).add(d2).add(d3).add(d_PtCircumCenter); // adding all points of this example to its group
		
		// only for legibility reasons (adding a circle):
		Circle d_circle = new Circle(d_PtCircumCenter, d_PtCircumCenter.length(d1), 128);
		examples[screen].add(d_circle.discretization(128).stroke(150));
		// ----------------------------

		
		
		
		
		
		
		
	
		
		// example 5:
		
		
		
		screen = 4;
		
		subtitles[screen] = new String("PtIntersect 2D");
		Pt e1 = Anar.Pt(0f, 0f);
		Pt e2 = Anar.Pt(40f, 0f);
		Pt e3 = Anar.Pt(-20f, 60f);
		Pt e4 = Anar.Pt(10f, 20f);
		
		PtIntersect e_PtIntersect = new PtIntersect(e1, e2, e3, e4);
		// = intersection point of line e1-e2 and line e3-e4
		
		e_PtIntersect.fill(highlight); // make point red
		examples[screen].add(e1).add(e2).add(e3).add(e4).add(e_PtIntersect); // adding all points of this example to its group

		// only for legibility reasons (adding lines):
		examples[screen].add(new Pts(e1, e2).stroke(150)).add(new Pts(e3, e4).stroke(150)).add(new Pts(e4, e_PtIntersect).render(new RenderPtsLineDotted(150)));
		// ----------------------------

		
	
		
		
		
		
		
		
		
		// example 6:
		
		
		
		screen = 5;
		
		subtitles[screen] = new String("PtIntersect 3D");
		Pt f1 = Anar.Pt(0f+200f, 0f);
		Pt f2 = Anar.Pt(40f+200f, 0f);
		Pt f3 = Anar.Pt(-20f+200f, 60f, -20f);
		Pt f4 = Anar.Pt(10f+200f, 20f);
		
		PtIntersect f_PtIntersect = new PtIntersect(f1, f2, f3, f4);
		// = intersection point between line f1-f2 and line f3-f4
		// = since lines are skew the middle point of the line representing the shortest distance between the two lines is chosen
		
		Pt f_IntersectA = f_PtIntersect.getInterA();
		Pt f_IntersectB = f_PtIntersect.getInterB();

		f_PtIntersect.fill(highlight); // make point red
		f_IntersectA.fill(highlight2); // make point light red
		f_IntersectB.fill(highlight2); // make point light red
		
		examples[screen].add(f1).add(f2).add(f3).add(f4).add(f_PtIntersect); // adding all points of this example to its group
		examples[screen].add(f_IntersectA).add(f_IntersectB); // adding all points of this example to its group

		// only for legibility reasons (adding lines):
		examples[screen].add(new Pts(f1, f2).stroke(150)).add(new Pts(f3, f4).stroke(150)).add(new Pts(f4, f_IntersectA).render(new RenderPtsLineDotted(150)));
		// ----------------------------

		
		
		
		
		
		
		
		
	
		// example 7:
		
		
		
		screen = 6;
		
		subtitles[screen] = new String("PtCenter");
		Pt g1 = Anar.Pt(0f-200f, -200f);
		Pt g2 = Anar.Pt(16f-200f, 12f-200f, -12f);
		Pt g3 = Anar.Pt(40f-200f, -200f);
		Pt g4 = Anar.Pt(20f-200f, 30f-200f, -20f);
		Pt g5 = Anar.Pt(10f-200f, -20f-200f, -40f);
		Pt g6 = Anar.Pt(6f-200f, 10f-200f, 12f);
		Pt g7 = Anar.Pt(30f-200f, -40f-200f, 16f);
		
		PtCenter g_PtCenter = new PtCenter(g1, g2, g3, g4, g5, g6, g7);
		// = center point of all 7 points
		
		g_PtCenter.fill(highlight); // make point red
		examples[screen].add(g1).add(g2).add(g3).add(g4).add(g5).add(g6).add(g7).add(g_PtCenter); // adding all points of this example to its group

		
	
		
		
		
		
		
		
		
		// example 8:
		
		
		
		screen = 7;
		
		subtitles[screen] = new String("PtProj orthogonal");
		Pt h1 = Anar.Pt(0f, 0f-200f);
		Pt h2 = Anar.Pt(40f, 0f-200f);
		Pt h3 = Anar.Pt(20f, 30f-200f, -20f);
		Pt h4 = Anar.Pt(10f, -20f-200f, -40f);
		
		PtProj h_PtProj = new PtProj(h1, h2, h3, h4);
		// = orthogonal projection of h1 on the plane which is defined by h2, h3 and h4
		// = this point will be on that plane
		
		h_PtProj.fill(highlight); // make point red
		examples[screen].add(h1).add(h2).add(h3).add(h4).add(h_PtProj); // adding all points of this example to its group

		// only for legibility reasons (adding line and face):
		Face h_triangle = new Face().add(h2).add(h3).add(h4);
		h_triangle.fill(150, 100);
		Pts h_line = new Pts().add(h1).add(h_PtProj);
		examples[screen].add(h_triangle).add(h_line.render(new RenderPtsLineDotted(150)));
		// ----------------------------

		
		
		
		
		
		
		
		
	
		// example 9:
		
		
		
		screen = 8;
		
		subtitles[screen] = new String("PtProj directional");
		Pt i1 = Anar.Pt(0f+200f, 0f-200f);
		Pt i2 = Anar.Pt(16f+200f, 12f-200f, -12f);
		Pt i3 = Anar.Pt(40f+200f, 0f-200f);
		Pt i4 = Anar.Pt(20f+200f, 30f-200f, -20f);
		Pt i5 = Anar.Pt(10f+200f, -20f-200f, -40f);
		
		PtProj i_PtProj = new PtProj(i1, i2, i3, i4, i5);
		// = projection of h1 in direction of h2 on the plane defined by h3, h4 and h5
		// = intersection of line h1-h2 and the plane defined by h3, h4 and h5
		// = this point will be on that plane
		
		i_PtProj.fill(highlight); // make point red
		examples[screen].add(i1).add(i2).add(i3).add(i4).add(i5).add(i_PtProj); // adding all points of this example to its group

		// only for legibility reasons (adding line and face):
		Face i_triangle = new Face().add(i3).add(i4).add(i5);
		Pts i_line = new Pts().add(i1).add(i2);
		Pts i_line2 = new Pts().add(i2).add(i_PtProj);
		examples[screen].add(i_triangle.fill(150, 100)).add(i_line.stroke(150)).add(i_line2.render(new RenderPtsLineDotted()));
		// ----------------------------

		
		


		
		
		

		
		screen = 0; // during runtime we want to start with the first screen
	}
	
	
	void draw(){
		
		background(200);

		// display text on the screen:
		Anar.text2D("press spacebar to switch focus", 15f, 25f, 1.5f);
		Anar.text2D(title + " - EXAMPLE " + (screen+1), 15f, 55f, 3f);
		Anar.text2D(subtitles[screen], 15f, 70f, 2f);
		Anar.text2D("given points", 50f, 112f, 1.5f);
		Anar.text2D("resulting point", 50f, 132f, 1.5f);
		
		// draw color key: 
		Anar.screenDrawBegin();
		// now original processing 2D
		strokeWeight(0);
		fill(222, 222, 222);
		rect(15f, 100f, 25f, 15f);
		fill(highlight.toInt());
		rect(15f, 120f, 25f, 15f);
		strokeWeight(1);
		stroke(150);
		
		Anar.screenDrawEnd();
		
		
		// draw each example (group):
		for (int i = 0; i < screens; i++){
			examples[i].draw(); 
			/*
			 * If the points of each example would NOT be grouped,
			 * each point had to be drawn separately:
			 * 
			 * a1.draw();
			 * a2.draw();
			 * a3_PtMid.draw(); 
			 * ...
			 * 
			 */
		}
		
		
		Anar.camTarget(examples[screen]);

		
	}
	
	
	void keyPressed(){

		if(key==' ') {
			screen = (++screen)%screens;
		  }
		if(key=='x') {
			screen = (screens+screen-1)%screens;
		  }
		
	}
	
