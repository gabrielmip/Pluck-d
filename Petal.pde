class Petal {
  float x, y;
  float theta;
  float size;
  boolean plucked;
  PVector direction;
  int red, blue, green;
  float totalSize;


  Petal(float ax, float ay, float atheta, float asize) {
    x = ax;
    y = ay;
    theta = atheta;
    plucked = false;
    direction = new PVector(0, 0);
    size = asize;
    red = 255;
    blue = 0;
    if ((int)random(3) > 0) green = 255;
    else green = 155;
    if ((int)random(3) > 0) totalSize = 20;
    else totalSize = 15;
    
  }

  void setPlucked(boolean a) {
    plucked = a;

    if (x < width/2.0) {
      direction.x = cos(theta)*random(3);
    } else {
      direction.x = cos(theta)*random(3);
    }
  }

  void setSize(float a) {
    size = a;
  }

  boolean getPlucked() {
    return plucked;
  }

  void drawPetal() {
    fill(red, green, blue);
    pushMatrix();
    translate(x, y);

    if (plucked && y < height-30) rotate(cos(theta));
    else  rotate(theta);

    ellipse(0, 0, size*(totalSize+35), size*totalSize);
    popMatrix();
  }

  void updatePetal(float peak) {
    if (!plucked && size < 1) size += 0.00075;

    if (plucked) {
      if (peak > 0.13) {
        x += direction.x*peak;
        y -= 5*peak;
        theta += PI/(random(10)+48);
      } else {

        if (y >= height-30) {
          y = height-30;
          theta = PI;
        } else {
          //if((int)random(4) == 3) direction.x = -direction.x;
          x += direction.x/3;
          y += 1;
          theta += PI/(random(10)+48);
        }

        if (x >= width+30) x = width+30;
        else if ( x <= -30) x = -30;
      }
    }
  }
}

