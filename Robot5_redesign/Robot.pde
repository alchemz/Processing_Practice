class Robot {
  float x = 180;           // X-coordinate
  float y = 400;           // Y-coordinate
  float bodyHeight = 153;  // Body Height
  float neckHeight = 56;   // Neck Height
  float radius = 45;       // Head Radius
  float angle = 0.0;       // Angle for motion
  float a=0.0;

  float t;
  float[] xpos=new float[100];
  float[] ypos=new float[100];

  Robot() {

    for (int i=0; i<100; i++) {
      xpos[i]=mouseX;
      ypos[i]=mouseY;
    }
  }

  void display()
  {
    // Change height of neck
    neckHeight = 80 + sin(angle) * 30;
    angle += 0.05;
    t=frameCount/200.0;
    // Adjust the height of the head
    float ny = y - bodyHeight - neckHeight - radius;

    // Neck
    stroke(102);
    line(x+2, y-bodyHeight, x+2, ny); 
    line(x+12, y-bodyHeight, x+12, ny); 
    line(x+22, y-bodyHeight, x+22, ny); 

    // Antennae
    line(x+12, ny, x-18, ny-43);
    line(x+12, ny, x+42, ny-99);
    line(x+12, ny, x+78, ny+15);

    // Body
    noStroke();
    fill(102);
    ellipse(x, y-33, 33, 33);
    fill(0);
    rect(x-45, y-bodyHeight, 90, bodyHeight-33);
    fill(102);
    rect(x-45, y-bodyHeight+17, 90, 6);

    // Head
    fill(0);
    ellipse(x+12, ny, radius, radius); 
    fill(255);
    ellipse(x+24, ny-6, 14, 14);
    fill(0);
    ellipse(x+24, ny-6, 3, 3);


    //shift array
    for (int i=1; i<100; i++) {
      xpos[i-1]=xpos[i]+(noise(t, 4)-0.5)*2.0;
      ypos[i-1]=ypos[i]+(noise(t, 5)-0.5)*2.0;
    }
    xpos[99]=x+12;
    ypos[99]=ny-radius;


    //draw tail
    fill(100, 255, 0);
    beginShape(TRIANGLE_STRIP);
    for (int i=99; i>0; i--) {
      vertex(xpos[i], ypos[i]);
      vertex(xpos[i]+i/5.0, ypos[i]);
    }

    endShape();
    fill(0, 255, 0);
    beginShape(TRIANGLE_STRIP);
    for (int i=99; i>0; i--) {
      vertex(xpos[i], ypos[i]);
      vertex(xpos[i]-i/5.0, ypos[i]);
    }
    endShape();


    //draw object
    fill(0, 100, 0);
  //  ellipse(x+12, ny, 40, 20);
  }



  void move()
  {
    if (x>0 &&x<800) {
      // Change position by a small random amount
      x ++;
      y += random(-1, 1);
      y=y+sin(y);
    } else
    {
      x=x-800;
      x++;
      y=y-sin(y);//use the sine function to let the robot moving in a regular way
    }
  }
}
