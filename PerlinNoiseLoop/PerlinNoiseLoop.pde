import peasy.*;
float noiseMax = 2;

int total = 25;

PeasyCam cam;
PVector[][] globe;

PImage rock;

void setup() {
  size(600, 600, P3D);
  lights();

  cam = new PeasyCam(this, 500);
  globe = new PVector[total + 1][total + 1];
  rock = loadImage("rock.jpg");
  
  for (int x = 0; x < total + 1; x++) {
    float lat = map(x, 0, total, 0, PI);
    for (int y = 0; y < total + 1; y++) {
      float lon = map(y, 0, total, 0, TWO_PI);

      float xOff = map(sin(lat) * cos(lon), -1, 1, 0, noiseMax);
      float yOff = map(sin(lat) * sin(lon), -1, 1, 0, noiseMax);
      float zOff = map(cos(lat), -1, 1, 0, noiseMax);

      /*float r = map(noise(xOff,yOff,zOff), 0, 1, 100, 200);*/
      float r = 100;
      
      PVector pos = getPosOnSphere(lat,lon,r);

      //pos = getPosOnSphere(lat,lon, noise(xOff,yOff,zOff) * r);

      globe[x][y] = pos;
    }
  }
}

void draw() {  
  background(0);
  fill(255);
  lights();

  for (int x = 0; x < total; x++) {
    beginShape(TRIANGLE_STRIP);
    for (int y = 0; y < total + 1; y++) {
      PVector v1 = globe[x][y];
      PVector v2 = globe[x + 1][y];
      println("V1:"+v1.x,v1.y,v1.z+",V2:"+v2.x,v2.y,v2.z);

      noStroke();
      texture(rock);
      vertex(v1.x, v1.y, v1.z);
      noStroke();
      texture(rock);
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}

  PVector getPosOnSphere(float rotX, float rotY, float r) {
  float x = r * sin(rotX) * cos(rotY);
  float y = r * sin(rotX) * sin(rotY);
  float z = r * cos(rotX);

  return new PVector(x, y, z);
}
