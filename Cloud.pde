class Cloud {
  float x, y, radius, speed, leftlimit,rightlimit;

  Cloud (float ax, float ay, float aradius, float aspeed) {
    x = ax;
    y = ay;
    radius = aradius;
    speed = aspeed;
    if(aspeed < 0) {
      leftlimit = ax - radius*4;
      rightlimit = ax;
    } else {
      leftlimit = ax;
      rightlimit = ax + radius*4;
    }
    
  }

  void drawCloud() {
    fill(#EDEDED);
    ellipseMode(CENTER);
    ellipse(x, y, 1.1*radius, radius);
    ellipse(x+(0.8*radius), y-(0.1*radius), 1.3*radius, 1.1*radius);
    ellipse(x+(1.6*radius), y, 1.1*radius, radius);
  }

  void updateCloud() {
    x += speed;
    if (x >= rightlimit) {
      speed = -speed;
      x = rightlimit;
    } else if (x <= leftlimit) {
      speed = -speed;
      x = leftlimit;
    }
  }
}

