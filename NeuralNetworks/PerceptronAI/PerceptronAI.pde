static Perceptron perceptron;
static ArrayList<Point> points;

static int startingSize = 1000;

void setup() {
 size(600, 600);
 
 perceptron = new Perceptron(3);
 points = new ArrayList<Point>();
 
 for (int i = 0; i < startingSize; i++) {
   points.add(new Point());
 }
 
 float[] inputs = { -1, 0.5, 1 };
 int guess = perceptron.guess(inputs);
 
 println(guess);
}

void draw() {
  
  for (int i = 0; i < 100; i++)
    points.add(new Point());
  
  background(255);
  
  Point pointA = new Point(-1, getYValue(-1));
  Point pointB = new Point(1, getYValue(1));
  stroke(0);
  strokeWeight(5);
  line(pointA.pixelX(), pointA.pixelY(), pointB.pixelX(), pointB.pixelY());
  Point pointC = new Point(-1, perceptron.guessY(-1));
  Point pointD = new Point(1, perceptron.guessY(1));
  stroke(0, 0, 255);
  strokeWeight(1);
  line(pointC.pixelX(), pointC.pixelY(), pointD.pixelX(), pointD.pixelY());
  
  for (Point point : points) {
   point.show();
   
   float[] inputs = { point.x, point.y, point.bias };
   int target = point.label;
   
   perceptron.train(inputs, target);
   
   int guess = perceptron.guess(inputs);
   //fill(guess != target ? 0 : 255, guess == target ? 0 : 255, 0);
   noStroke();
   if (guess == target) {
     fill(0, 255, 0);
   } else {
     fill(255, 0, 0);
   }
   
   ellipse(point.pixelX(), point.pixelY(), 4, 4);
   
  }
}

void mousePressed() {
  /*for (Point point : points) {   
   float[] inputs = { point.x, point.y, point.bias };
   int target = point.label;
   
   perceptron.train(inputs, target);
  }*/
  //points.add(new Point(map(mouseX, 0, width, -1, 1), map(mouseY, 0, height, -1, 1)));
  //print(points.size());
}
