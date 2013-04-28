import processing.opengl.*;
import anar.*;




/*
 * Example for Anar library by Guillaume LaBelle + Julien Nembrini
 * http://anar.ch
 */

Group g = new Group();

void setup() {
	size(800, 400, OPENGL);
	Anar.init(this);
	Anar.drawAxis();

	Param tr = new Param(30, 0, 100).addToSlidersMain();
	Param r1 = new Param(0, 0, 6).addToSlidersMain();
	Param r2 = new Param(0, 0, 6).addToSlidersMain();

	Obj box1 = new Box(10).rotateZ(r1).translateX(tr);
	g.add(box1);

	Obj box2 = new Box(10).fill(255, 0, 0);
	Transform t = new Transform(box1.face(0).pt(1), box1.face(0).pt(0), box1
			.face(0).pt(2));
	t.rotateX(r2);
	t.postTransform = false;
	box2.apply(t);

	g.add(box2);
}

void draw() {
	background(255);
	g.draw();
}



