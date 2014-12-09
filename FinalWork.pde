import ddf.minim.*;

Minim minim;
AudioInput in;
Flower flower;
Cloud cloud,cloud2;
int x, y;

void setup()
{
  size(800, 800, P3D);

  minim = new Minim(this);

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();

  flower = new Flower(width/2, height/2-40, 45);
  
  //Cloud (float ax, float ay, float aradius,float aspeed){
  cloud = new Cloud(width/10,height/10, 60, 0.2);
  cloud2 = new Cloud(8*width/10,4*height/10, 40, -0.2);
}

float getVolumePeaker(AudioInput in) {
  float lavg = 0;
  float ravg = 0;
  for (int i = 0; i < in.bufferSize () - 1; i++)
  {
    if (mod(in.left.get(i)) > lavg) lavg = mod(in.left.get(i)); 
    if (mod(in.left.get(i)) > ravg) ravg = mod(in.right.get(i));
  }

  if (lavg <= ravg) return ravg;
  return lavg;
}

float mod(float a) {
  if (a<0) return -a;
  return a;
}

void draw()
{
  noStroke();
  background(#52C2CB);
  fill(#4D674F);
  ellipseMode(CENTER);
  ellipse(width/2.0,height,width+100,100);
  
  cloud.updateCloud();
  cloud.drawCloud();
  cloud2.updateCloud();
  cloud2.drawCloud();
  
  textSize(18);
  fill(0);
  text("Blow into the mic!", 10, 24);
  
  float peak = getVolumePeaker(in);
  flower.updatePetals(peak);
  flower.drawFlower();
}

