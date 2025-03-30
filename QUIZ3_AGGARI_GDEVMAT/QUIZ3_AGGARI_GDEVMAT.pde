int frameReset = 300;

void setup() {
  size(1280, 720, P3D); // Set window size
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw() {
  if (frameCount % frameReset == 0) {
    screenFlusher();
  }
  
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(10, 100);
  fill(r, g, b, a);
  noStroke();
  
  float gaussian = randomGaussian();
  float standardDeviation = 100;
  float mean = 0;
  
  float x = standardDeviation * gaussian + mean;
  int y = int(random(720));
  
  float scaleGaussian = randomGaussian();
  float scaleStandardDeviation = 80;
  float scaleMean = 3;
  
  float scale = scaleStandardDeviation * scaleGaussian + scaleMean;
  
  circle(x, y, scale);
}

void screenFlusher() {
  background(0);
}
