final static int[] stackOne = new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 };
final static int[] stackTwo = new int[] { 0, 0, 0, 2, 3, 3, 5, 5, 7, 7, 7 ,  7, 11, 11, 13, 13, 13, 13, 17, 17, 19 };

final static int stackOneMax = 10;
final static int stackTwoMax = 10;

final static int scale = 300;

final DisplayType type = DisplayType.PIE_CHAR;

boolean stackOneExtra;

void setup() {
  size(1200, 1200);

  if (stackOne.length != stackTwo.length) return;

  stackOneExtra = (stackOne[0] == 0);

  translate(width / 2, height / 2);

  switch (type) {
  case GRAPH: 
    drawGraph();
    break;
  case TABLE:
    drawTable();
    break;
  case PIE_CHAR:
    drawPieChar();
    break;
  }
}

void draw() {
}

void drawGraph() {
  stroke(255);
  strokeWeight(4);
  translate(-(stackOne.length / 2 * scale) - (scale / 2) + ((stackOneExtra) ? scale : 0), stackTwoMax / 2 * scale);
  line(0, 0, stackOne.length * scale - ((stackOneExtra) ? scale : 0), 0); 
  line(0, 0, 0, -(stackTwoMax * scale));

  int j = 0;
  for (int key : stackOne) {
    stroke(128);
    strokeWeight(7);
    point(key * scale, -(stackTwo[j] * scale));

    j++;
  }

  for (int i = 0; i <= stackOneMax; i++) {
    textSize(20);
    fill(51);
    text(i, i * scale, scale);
  }
  for (int i = 0; i <= stackTwoMax; i++) {
    textSize(16);
    fill(51);
    text(i, -scale, -(i * scale));
  }
}

void drawTable() {
  stroke(255);
  strokeWeight(4);
  translate(-(stackOne.length / 2 * scale) - (scale / 2) + ((!stackOneExtra) ? scale : 0) + scale / 2, scale);

  for (int i = 0; i <= stackOne.length; i++) {
    line(i * scale, 0, i * scale, -(scale * 2));
  }
  line(0, 0, (stackOne.length * scale) - ((!stackOneExtra) ? scale : 0), 0);
  line(0, -scale, (stackOne.length * scale) - ((!stackOneExtra) ? scale : 0), -scale);
  line(0, -scale*2, (stackOne.length * scale) - ((!stackOneExtra) ? scale : 0), -scale*2);

  int j = 0;
  int fontSize = 24;
  for (int key : stackOne) {
    fill(51);
    textSize(fontSize);
    text(stackTwo[j], scale * j + scale / 2 - fontSize / 10 - fontSize / 4.5 - (new String(""+stackTwo[j]).length() - 1 * 0.5), -scale / 2 + fontSize / 10 + fontSize / 4.5);
    text(key, scale * j + scale / 2 - fontSize / 10 - fontSize / 4.5 + (new String(""+key).length() - 1 * fontSize / 4), -scale / 2 + fontSize / 10 + fontSize / 4.5 - scale);
    j++;
  }

  // (scale * 1.5 * j) - (( -1.1fontSize ) / 9)
  // -scale / 2 + (-1.1 * fontSize) / 9
}

void drawPieChar() {
  float sum = 0;
  for (int val : stackTwo) {
    sum += val;
  }

  float angle = -HALF_PI;
  float spacing = TWO_PI / sum;
  println("Sum: "+sum, "Spacing:"+degrees(spacing));

  int j = 0;
  for (int val : stackTwo) {
    float pAngle = angle;
    angle += val * spacing;
    float x = scale * cos(angle);
    float y = scale * sin(angle);
    stroke(255);
    strokeWeight(4);
    line(0, 0, x, y);
    float a = angle - (angle - pAngle) / 2;
    x = (scale / 2) * cos(a);
    y = (scale / 2) * sin(a);
    fill(0);
    textSize(16);
    if (val != 0) {
      text(val, x, y);
    }
    x = (scale * 1.15) * cos(a);
    y = (scale * 1.15) * sin(a);
    if (val != 0) {
      text(stackOne[j], x, y);
    }
    
    j++;
  }

  noFill();
  strokeWeight(5);
  beginShape();
  for (float a = 0; a < TWO_PI; a += 0.05) {
    float x = scale * cos(a);
    float y = scale * sin(a);
    vertex(x, y);
  }
  endShape(CLOSE);
}


void keyPressed() {
  print(type);
  save("result-"+type+".png"); 
}
