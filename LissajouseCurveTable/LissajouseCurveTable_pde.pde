int amount = 2;
int scale;

double speedDiff = 1.5;

double[][] angles;

void setup() {
  size(300, 300);
  background(51);

  scale = height / (amount + 1);

  angles = new double[width][height];
}

void draw() {
  noFill();
  stroke(255);

  ellipse(scale / 2 + scale, scale / 2, scale, scale);
  ellipse(scale / 2 + scale * 2, scale / 2, scale, scale);
  ellipse(scale / 2, scale / 2 + scale, scale, scale);
  ellipse(scale / 2, scale / 2 + scale * 2, scale, scale);

  moveBall(1, 0);
  moveBall(2, 0);
  moveBall(0, 1);
  moveBall(0, 2);
  
  drawCurves();
  noLoop();
}

void drawTable() {
  noFill();
  stroke(255);

  ellipse(scale / 2 + scale, scale / 2, scale, scale);
  ellipse(scale / 2 + scale * 2, scale / 2, scale, scale);
  ellipse(scale / 2, scale / 2 + scale, scale, scale);
  ellipse(scale / 2, scale / 2 + scale * 2, scale, scale);
}

int moveBall(int xIndex, int yIndex) {
  int x = scale / 2 + scale * xIndex;
  int y = scale / 2 + scale * yIndex;
  int r = scale / 2;

  double angle = angles[xIndex][yIndex];

  int i = (xIndex > yIndex) ? xIndex : yIndex;

  double newAngle = (angle + (speedDiff * i)) % 360;
  System.out.println("Angle: " + angle + " | New: " + newAngle + "| xIndex: " + xIndex);

  double ballX = r * sin(PI / 180 * (float) newAngle) + x;
  double ballY = r * cos(PI / 180 * (float) newAngle) + y;

  //fill(255);
  //ellipse((float) ballX, (float) ballY, 5, 5);
  angles[xIndex][yIndex] = newAngle;

  return (i == xIndex) ? floor((float) ballX) : floor((float) ballY);
}

void drawCurves() {
  int[][] positions = new int[width][height];

  for (int j = 0; j < amount; j++) {
    positions[j][0] = moveBall(j, 0);
  }
  for (int j = 0; j < amount; j++) {
    positions[0][j] = moveBall(0, j);
  }

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      ellipse(x,y,3,3);
    }
  }
}
