Triangle main;

int w = 500;
int h = 250;

float zoom = 1;

void setup() {
  size(600, 600);
  //fullScreen();
  translate(width / 2, height / 2);

  main = new Triangle(0, 0, w, h, 1);
}

void draw() {
  translate(width / 2, height / 2);
  background(200);

  main.show(); 
  //triangle(-50-zoom, 0+zoom, 50+zoom, 0+zoom, 0, -50-zoom);
}
