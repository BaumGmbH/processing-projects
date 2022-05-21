static final int speed = 100;
static int destX;
static int destY;
static Walker walker;

ArrayList<ArrayList<PVector>> paths = new ArrayList<ArrayList<PVector>>();

void setup() {
  size(600, 600);

  DiffAggeration.destX = width / 2;
  DiffAggeration.destX = height / 2;

  walker = new Walker(rand(width), rand(height));
}

void draw() {
  background(180);

  fill(0, 200, 0);
  noStroke();
  ellipse(destX, destY, 3, 3);

  stroke(20);
  strokeWeight(1);
  noFill();

  for (int i = 0; i < speed; i++) {
    walker.walk();

    for (ArrayList<PVector> path : paths) {
      beginShape();
      for (PVector pos : path) {
        vertex(pos.x, pos.y);
      }
      endShape();
    }
  }
}

int rand(int from, int to) {
  double random = Math.random() * to;

  return (int) (Math.round(random) + from);
}

int rand(int to) {
  return rand(0, to);
}
