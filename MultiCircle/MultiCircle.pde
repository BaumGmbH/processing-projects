static final int levels = 128;

CircleLine main;

void setup() {
  //size(400,400);
  fullScreen();
  translate(width / 2, height / 2);
  background(180);

  main = new CircleLine(0, 0, 150, levels, 1, null);
}

float off = 0;

void draw() {
  translate(width / 2, height / 2);
  for (int i = 0; i < 50; i++) {
    //background(180);

    main.update();
    main.show();
    rotate(radians(0.1 * i + off));
    off += 0.1 * i;
  }
  rotate(radians(50));
  
}

void mousePressed() {
  save("Dot-Circle.png"); 
}
