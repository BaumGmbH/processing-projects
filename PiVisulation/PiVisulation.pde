int spacing = 20;

int w = 10;
int h = 10;

int cols, rows;

Node[][] nodes;

String pi;

void setup() {
  size(220, 220);
  background(51);
  println(5 + -2);

  pi = loadStrings("pi.txt")[0];

  cols = width / spacing;
  rows = height / spacing;

  nodes = new Node[cols][rows];

  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      Node node = /*new Node(i, j, Integer.parseInt(""+pi.charAt(i + j * h)));*/new Node(i,j,floor(random(10)));
      
      nodes[i][j] = node;
    }
  }

  for (int i = 0; i < w; i++) { 
    for (int j = 0; j < h; j++) {
      println("Current: " + i, j);
      Node node = nodes[i][5];
      
      //node.connect();
      node.show();
    }
  }
  
  
  /*Node node = nodes[5][5];
  node.connect();
  node.show();
  printArray(node.connections);*/
  println(5 + -2);
}

void draw() {
}
