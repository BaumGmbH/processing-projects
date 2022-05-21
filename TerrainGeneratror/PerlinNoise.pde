class PerlinNoise {

  double persistence;
  double frequency;
  double amplitude;

  int octaves;
  int seed;

  PerlinNoise(double persistence, double frequency, double amplitude, int octaves, int seed) {
    this.persistence = persistence;
    this.frequency = frequency;
    this.amplitude = amplitude;

    this.octaves = octaves;
    this.seed = seed;
  }

  double get(double x, double y) {
    return this.amplitude * total(x, y);
  }

  private double total(double x, double y) {
    double t = 0;
    double amplitude = 1;
    double frequency = this.frequency;

    for (int i = 0; i < octaves; i++) {
      t += getValue(x * frequency + seed, y * frequency + seed) * amplitude;
      frequency *= 2;
    }
    
    return t;
  }

  private double getValue(double x, double y) {
    int xInt = (int) x;
    int yInt = (int) y;

    double xFrac = x - xInt;
    double yFrac = y - yInt;

    double n01 = getNoise(xInt - 1, yInt - 1);
    double n02 = getNoise(xInt + 1, yInt - 1);
    double n03 = getNoise(xInt - 1, yInt + 1);
    double n04 = getNoise(xInt + 1, yInt + 1);
    double n05 = getNoise(xInt - 1, yInt);
    double n06 = getNoise(xInt + 1, yInt);
    double n07 = getNoise(xInt, yInt - 1);
    double n08 = getNoise(xInt, yInt + 1);
    double n09 = getNoise(xInt, yInt);
    double n12 = getNoise(xInt + 2, yInt - 1);
    double n14 = getNoise(xInt + 2, yInt + 1);
    double n16 = getNoise(xInt + 2, yInt);
    double n23 = getNoise(xInt - 1, yInt + 2);
    double n24 = getNoise(xInt + 1, yInt + 2);
    double n28 = getNoise(xInt, yInt + 2);
    double n34 = getNoise(xInt + 2, yInt + 2);

    double x0y0 = 0.0625 * (n01 + n02 + n03 + n04) + 0.1250
      * (n05 + n06 + n07 + n08) + 0.2500 * n09;

    double x1y0 = 0.0625 * (n07 + n12 + n08 + n14) + 0.1250
      * (n09 + n16 + n02 + n04) + 0.2500 * n06;

    double x0y1 = 0.0625 * (n05 + n06 + n23 + n24) + 0.1250
      * (n03 + n04 + n09 + n28) + 0.2500 * n08;

    double x1y1 = 0.0625 * (n09 + n16 + n28 + n34) + 0.1250
      * (n08 + n14 + n06 + n24) + 0.2500 * n04;

    double v1 = interpolate(x0y0, x1y0, xFrac);
    double v2 = interpolate(x0y1, x1y1, xFrac);

    double fin = interpolate(v1, v2, yFrac);

    return fin;
  }

  private double getNoise(int x, int y) {
    int n = x + y * 57;
    n = (n << 13) ^ n;
    int t = (n * (n * n * 15731 + 789221) + 1376312589) & 0x7fffffff;
    return 1.0 - (double) t * 0.931322574615478515625e-9;
  }

  private double interpolate(double x, double y, double a) {
    double negA = 1.0 - a;
    double negASqr = negA * negA;
    double fac1 = 3.0 * (negASqr) - 2.0 * (negASqr * negA);
    double aSqr = a * a;
    double fac2 = 3.0 * aSqr - 2.0 * (aSqr * a);

    return x * fac1 + y * fac2;
  }
}
