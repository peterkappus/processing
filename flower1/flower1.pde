

float speed = 10;

boolean isColor = true;

//luxurious
/*float k = 2;
float kDelta = 0.00001 * speed;
float ampDelta = 0.05 * speed;
float colorDelta = 0.05 * speed;
*/


//spikey
float k = 1.95;
float kDelta = -0.00005 * speed;
float ampDelta = -0.02 * speed;
float colorDelta = 0.04 * speed;


float c = 0;
float rotation = 0;

float amp;
//color delta
float rotationDelta = 0.00001 * speed;
int howMany = 70;
float thickness = 0.001;



void setup() {  // setup() runs once
  //stay put!
ampDelta = 0;
rotationDelta = 0;

amp = width * 0.49;
  size(800,800);
  //fullScreen();
  frameRate(30);
  background(0);
  smooth(4);
  if(isColor) {
    colorMode(HSB);
  }
  
}

void draw() {
  if(amp < 2) {
    return;
  }
  
  strokeWeight(thickness);
  c += colorDelta;
  stroke(c % 255);

  if(isColor){
    stroke(c % 255,255,255);
  }
  
  
  
  noFill();
  //clear();
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
  
  //print(k);
  //print("\n");
  //incr *= 1.001;
  k += kDelta;
  //amp *= 0.9999;
  //howMany++;
  //thickness *= 1.01;
  
  //saveFrame("output/flower_#####.png");
  println(frameRate);
  
  //slowly fade out... draw a slighly opaque square over the image each iteration
  translate(-width/2,-height/2);
  noStroke();
  fill(0,0,0,5);
  rect(0,0,width,height);
}
