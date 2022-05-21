import java.text.*;

HashMap<Float, Integer> colors = new HashMap<Float, Integer>();

OpenSimplexNoise openNoise;

void setup() {
  
  openNoise = new OpenSimplexNoise(100);
  
  size(500,500);
  
  colors.put(0.2f, color(0,255,0));
  colors.put(0.7f, color(2550,0,0));
  
}

int octaves = 1;
float persistance = 0.5;
float lacunarity = 2;

float scale = 0.1;

float inc = 0.03f;

float xOff = 0f;
float yOff = 0f;
float zOff = 0f;

void draw() {

  loadPixels();

  xOff = 0;
  for (int x = 0; x < width; x++) {
    yOff = 0;
    for (int y = 0; y < height; y++) {
      
      float amplitude = 1;
      float frequency = 0.01;
      
      float value = 0;
      
      for (int o = 0; o < octaves; o++) {
        float sampleX = x / scale * frequency;
        float sampleY = y / scale * frequency;
        
        
        //float perlinValue = (float) openNoise.eval(xOff, yOff, zOff);
        float perlinValue = (float) openNoise.eval(sampleX, sampleY, zOff);
        value += perlinValue * amplitude;
        
        amplitude *= persistance;
        frequency = lacunarity;
      }
      
      value *= 8;
      value = map(value, -1, 1, 0, 255);
      
      //float value = (float) openNoise.eval(xOff, yOff);
      
      //value = setMaxDecimals(value,1);
      //value *= 255;
      
      int col = color(value,value,value);
     
      pixels[x + y * width] = col; 
      
      yOff += inc;
    }
    xOff += inc;
  }
  
  updatePixels();
  zOff += 0.02f;
}

float setMaxDecimals(float a, int decimals) {
  
  String decimal = "";
  
  for (int i = 0; i < decimals; i++) {
     decimal += "#";
  }
  
  return Float.parseFloat(new DecimalFormat("#." + decimal + "f").format(a).replace(',', '.'));
}
