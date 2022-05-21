PImage terrainMap;

PerlinNoise perlin = new PerlinNoise(3,3,1,1,0);

ArrayList<PImage> noiseMaps = new ArrayList<PImage>();

void setup() {
  size(600, 600);

  //terrainMap = loadImage("TerrainMap.png");
}

float xOff = 0;
float yOff = 0;

void draw() {
  // image(terrainMap, 0, 0);

  colorMode(RGB);

  loadPixels();

  for (int x = 0; x < width; x++) {
    yOff = 0;
    for (int y = 0; y < height; y++) {
      int b = (int) (perlin.get(xOff, yOff) * 255);
      
      drawPixel(x,y,b,b,b);
      
      yOff += 0.01;
    }
    xOff += 0.01;
  }

  updatePixels();
  
  //noLoop();
}

void drawPixel(int x, int y, int val1, int val2, int val3) {
  int index = x + y * width;
  color col = color(val1,val2,val3);
  
  pixels[index] = col;
}
