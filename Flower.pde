class Flower {
  int x;
  int y;
  ArrayList<Petal> petals;
  ArrayList<Petal> plucked;
  float radius;

  Flower(int x, int y, int nPetals) {
    radius = width/3.0;
    plucked = new ArrayList<Petal>();
    petals = new ArrayList<Petal>(); 
    for (float i = 0; i < TWO_PI; i+= (TWO_PI/nPetals)) {
      petals.add(new Petal(x+(radius-5)/2*cos(i), y+(radius-5)/2*sin(i), i, 1));
    }

    this.x = x;
    this.y = y;
  }

  void drawFlower() {
    rectMode(CORNERS);
    fill(#0A7115);
    //rect(x-10, y, x+10, height);

    beginShape();
    curveVertex(x, y);
    curveVertex(x, y);
    curveVertex(x+10, y);
    curveVertex(x+30, 7*height/8.0);
    curveVertex(x+10, height+20);
    curveVertex(x-10, height+20);
    curveVertex(x+10, 7*height/8.0);
    curveVertex(x-10, y);
    curveVertex(x+10, y);
    curveVertex(x, y);
    endShape();

    fill(#5D4301);
    ellipseMode(CENTER);
    ellipse(x, y, radius, radius);
    ellipseMode(CORNER);
    for (int i = 0; i < petals.size (); i++) {
      petals.get(i).drawPetal();
    }
    ellipseMode(CENTER);
    for (int i = 0; i < plucked.size (); i++) {
      plucked.get(i).drawPetal();
    }
  }


  void updatePetals(float peak) {
    //the chance of plucking a petal is 0.25
    if (peak > 0.13 && (int)random(4) == 3 ) {
      int petalID = (int)random(petals.size());
      Petal aPlucked = petals.get(petalID);

      Petal newPlucked = new Petal(aPlucked.x, aPlucked.y, aPlucked.theta, aPlucked.size);
      newPlucked.setPlucked(true);

      plucked.add(newPlucked);
      aPlucked.setSize(0);
    }

    for (int i = 0; i < petals.size (); i++) {
      petals.get(i).updatePetal(peak);
    }

    for (int i = 0; i < plucked.size (); i++) {
      plucked.get(i).updatePetal(peak);
    }

    float posx, posy;
    for (int i = 0; i < plucked.size (); i++) {
      posx = plucked.get(i).x;
      posy = plucked.get(i).y;
      if ( (posx <= 0 || posx >= width) && posy == height - 30 ) {
        plucked.remove(i);
        i--;
      }
    }
  }
}

