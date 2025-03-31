void setup()
{
  size(1280, 720, P3D); //Set window size
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(255);
  
}

Walker perlinWalker = new Walker();

void draw()
{
  perlinWalker.PerlinWalk();
  perlinWalker.render();
}
