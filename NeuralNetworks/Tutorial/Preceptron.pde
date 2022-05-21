static int sign(float x) {
  return x < 0 ? -1 : 1; 
}

class Preceptron {

  float[] weights = new float[2];
  float learningRate = 0.1f;
  
  Preceptron() {
  
    for (int i = 0; i < weights.length; i++) {
       weights[i] = random(-1,1);
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
}
