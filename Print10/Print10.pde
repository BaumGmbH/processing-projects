final int size = 40;

int rows, cols;

void setup() {
  size(1200, 800);
  background(51);
  textSize(size);

  rows = width  / size;
  cols = height / size;
}

int xOff = 0;
int yOff = 0;

void draw() {

  if (random(1) > 0.9) {
    line(xOff, yOff, xOff+size, yOff+size);
  } else {
    line(xOff+size, yOff, xOff, yOff+size);
  }

  xOff += size;
  if (xOff >= width) {
    xOff = 0;
    yOff += size;
    if (yOff >= height) {
      noLoop();
      return;
    }
  }
}
