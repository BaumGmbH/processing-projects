import peasy.*;

PeasyCam cam;

void setup() {
  size(300,300, P3D);
  cam = new PeasyCam(100.0);
  
  for (float a = 0; a <= 360; a += 12) {
    for (float b = 0; b <= 360; b += 12) {
      stroke(255);
      strokeWeight(5);
      PVector pos = b(5, a,b);
      point(pos.x,pos.y,pos.z);
    }
  }
}

PVector b(float r, float a, float b) {
  float x = r * cos(a) * sin(b);
  float y = r * sin(a) * sin(b);
  float z = r * cos(b);
  
  return new PVector(x,y,z);
}
