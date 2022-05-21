final int r = 300;

final float strokeWeight = 0.05;
final int drawPerRun = 1;

final int maxPoints = 2000;
final int maxFactor = 200;

final int startingPoints = 200;
final float startingFactor = 0;

final int delay = 0;

int points = startingPoints;
float factor = startingFactor;

final boolean updating = false;
final boolean growing = false;
final boolean animate = false;

final boolean showPointNum = false;

float spacing = PI / 180 * (360 / points);

float angle = PI;

PVector[] pointPos;

void setup() {
  //size(600, 600);
  fullScreen();

  translate(width / 2, height / 2);

  drawBase(points);
}

int index = 0;

void draw() {
  translate(width / 2, height / 2);

  factor += 0.01;
  /*points++;
   drawBase(points);
   drawLines(points);*/

  if (animate) {
    for (int i = 0; i < drawPerRun; i++) {
      drawLines(index);
      index++;

      if (index >= points && updating) {
        index = 0;
        points++;
        drawBase(points);
      }

      if (index >= maxPoints && growing) {
        delay(delay);
        index = 0; 
        points = startingPoints;
        drawBase(points);
        factor++;
      }

      if (factor > maxFactor) {
        drawBase(points);
        drawLines(points);
        noLoop();
        return;
      }
    }
  } else {
    drawBase(points);
    drawLines(points);
  }
}


void keyPressed() {
  switch (keyCode) {
  case 38: 
    points++;
    break;
  case 40: 
    points--;
    break;
  case 37: 
    factor++; 
    break;
  case 39: 
    factor--;

    break;
  }

  points = constrain(points, 1, maxPoints);
  factor = constrain(factor, 1, maxFactor);

  drawBase(points);
  drawLines(points);
}

void drawBase(int newPoints) {
  pointPos = new PVector[newPoints];
  spacing = PI / 180 * (360f / newPoints);


  background(11);
  //noStroke();
  //fill(180);
  noFill();
  strokeWeight(10);
  stroke(180);
  circle(0, 0, r * 2);
  angle = PI;

  for (int i = 0; i < newPoints; i++) {
    int x = floor(r * cos(angle));
    int y = floor(r * sin(angle));

    stroke(128);
    strokeWeight(10);
    //point(x, y);
    pointPos[i] = new PVector(x, y);

    colorMode(HSB);
    fill(120, 255, 255);
    if (showPointNum) {
      textSize(32);
      String num = ""+i;
      PVector vec = getPos(angle, r + 30 + num.length() * 10);
      text(i, vec.x - 15, vec.y);
      colorMode(RGB);
    }

    angle += spacing;
  }
}

void drawLines(int times) {
  int current = 0;
  float toIndex;

  PVector from;
  PVector to;

  for (int i = 0; i < times; i++) {

    toIndex = (current * factor) % points;//current;

    from = pointPos[current];
    to = getPos(spacing * toIndex);

    stroke(250);
    strokeWeight(strokeWeight);
    line(-from.x, from.y, -to.x, to.y);

    current = (current + 1) % points;
  }
}

PVector getPos(float angle) {
  PVector vec = new PVector();

  vec.x = r * cos(angle);
  vec.y = r * sin(angle);

  return vec;
}
PVector getPos(float angle, float ra) {
  PVector vec = new PVector();

  vec.x = ra * cos(angle);
  vec.y = ra * sin(angle);

  return vec;
}
