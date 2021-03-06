static float learningRate = 0.001;

static int sign(float n) {
  return n >= 0 ? 1 : -1;
}

class Perceptron {

  float[] weights;
  
  Perceptron(int n) {
    
    weights = new float[n];
    
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1, 1); 
    }
  }
  
  int guess(float[] inputs) {
    float sum = 0;
    
    for (int i = 0; i < weights.length; i++) {
      sum += inputs[i] * weights[i];
    }
    
    return sign(sum);
  }
  
  void train(float[] inputs, int target) {
    int guess = guess(inputs);
    int error = target - guess;
    
    for (int i = 0; i < weights.length; i++) {
      weights[i] += error * inputs[i] * learningRate; 
    }   
  }
  
  float guessY(float x) {
    return -(weights[2] / weights[1]) - (weights[0] / weights[1]) * x;
  }
}
