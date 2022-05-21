Preceptron per;

Point[] points = new Point[100000];

void setup() {
  size(800, 800);

  per = new Preceptron();

  for (int i = 0; i < points.length; i++) {
    points[i] = new Point();
  }

  float[] inputs = { -1, 0.5 };
  int guess = per.guess(inputs);

  println(guess);
}

void draw() {
  background(255);
  
  stroke(0);
  strokeWeight(5);
  line(0, 0, width, height);
  strokeWeight(2);

  for (Point point : points) {
    point.show();
  }

  for (Point point : points) {
    float[] inputs = { point.x, point.y }; 
    int target = point.label;
    //per.train(inputs, target);

    int guess = per.guess(inputs);

    if (guess == target) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }    

    noStroke();
    ellipse(point.x, point.y, 8, 8);
    
  }
}

void mousePressed() {
  for (Point point : points) {
    float[] inputs = { point.x, point.y }; 
    int target = point.label;
    per.train(inputs, target);
  } 
}
