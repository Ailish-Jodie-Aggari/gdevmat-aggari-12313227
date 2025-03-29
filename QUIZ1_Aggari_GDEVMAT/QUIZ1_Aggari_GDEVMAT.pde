float amplitude = 25;
float frequency = 0.01;


void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}

void draw()
{
  background(0);
  
  drawCartisianPlane();
  drawYellowParabula();
  drawPurpleLinear();
  drawBlueSineWave();
  sineWaveManipulation();

}

void drawCartisianPlane()
{
  strokeWeight(2);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for(int i = -300; i <= 300; i +=10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
  
}

void drawYellowParabula()
{
  
  // f(x) = x^2 - 15x - 3

  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x, ((float)Math.pow(x, 2) - (x * 15) - 3), 2);
  } 
}

void drawPurpleLinear()
{
  
  // f(x) = (-5x) + 30

  color purple = color(128, 0, 128);
  fill(purple);
  noStroke();
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x, ((float)(x * -5) + 30), 5);
  } 
}

void drawBlueSineWave()
{
  // s(x) = amplitude * sin(2πfx + ϕ)
  // ϕ is phase
  
  color blue = color(0, 0, 255);
  fill(blue);
  stroke(blue);
  float phase = millis() * 0.01; // so it moves continuously

    for (float x = -300; x <= 300; x += 0.1f) 
    {
      circle(x, ( amplitude * (float)Math.sin((2 * PI * frequency * x) + phase) ), 3);
    }
}

void sineWaveManipulation()
{
    if (keyCode == UP) 
    {
      amplitude += 5;
    }
    if (keyCode == DOWN)
    {
      amplitude -= 5;
    }
    if (keyCode == RIGHT) 
    {
      frequency += 0.005;
    }
    if (keyCode == LEFT) 
    {
      frequency -= 0.005;
    } 
    
    amplitude = constrain(amplitude, 5, 50);
    frequency = constrain(frequency, 0.005, 0.03);
}
