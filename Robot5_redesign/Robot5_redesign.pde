// Robot 5: Motion from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010
import processing.opengl.*;

Robot robots;

void setup() {
  size(800, 480,OPENGL);
  smooth();
  ellipseMode(RADIUS);
  robots=new Robot();
}

void draw() {
  background(255);
  robots.move();
  robots.display();
 // robots.wave();
}


