static final int streamWidth = 100;

Stream[] streams;

int rows;

void setup() {
  size(600,600);
  
  rows = width / streamWidth;
  
  streams = new Stream[rows];
  
  for (int i = 0; i < streams.length; i++) {
    streams[i] = new Stream(i, floor(random(10,30)));
  }
}

void draw() {
  background(11);
  
  for (Stream stream : streams) {
    stream.show(); 
  }
}
