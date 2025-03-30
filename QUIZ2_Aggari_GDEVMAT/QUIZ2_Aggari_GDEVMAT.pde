void setup()
{
  size(1280, 720, P3D); //Set window size
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}
Walker myWalker = new Walker();  //Creates an instance of our walker class here in sketch
Walker myWalkerTwo = new Walker();

void draw()
{
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(50, 100);
  fill(r, g, b, a);
  
  //I added strokes so I can see which one's which
  
  noStroke();
  myWalker.randomWalker();
  myWalker.render();
  
  stroke(0, 0, 0);
  myWalkerTwo.randomWalkBiased();
  myWalkerTwo.render();
  
}
