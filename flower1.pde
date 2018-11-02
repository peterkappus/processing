
float k = 2;
float c = 0;
float rotation = 0;
float speed = 5;

float kDelta = 0.00001 * speed;
float amp;
float ampDelta = 0.05 * speed;
//colour delta
float colourDelta = 0.05 * speed;
float rotationDelta = 0.0001 * speed;
int howMany = 40;
float thickness = 0.001;

void setup() {  // setup() runs once
  amp = width/16;
  size(800,800);
  //fullScreen();
  frameRate(30);
  background(0);
  //smooth(4);
}

void draw() {
  strokeWeight(thickness);
  colorMode(HSB);
  c += colourDelta;
  stroke(c % 255,255,255);
  //rect(0,0,width,height);
  noFill();
  //clear();
  //background(0);
  translate(width/2, height/2);
  rotate(rotation += rotationDelta);
  amp += ampDelta;
  
  //stroke(255);

  beginShape();
  
  for(float a = 0.0; a < howMany; a ++) {
    float r = cos(k * a) * amp;
    float x = r * cos(k * a) * cos(a);
    float y = r * cos(k * a) * sin(a);
    curveVertex(x,y);
    //rotate(-0.0001);
  }
  
  endShape();
  
  //incr *= 1.001;
  k += kDelta;
  //amp *= 0.9999;
  //howMany++;
  //thickness *= 1.01;
}
