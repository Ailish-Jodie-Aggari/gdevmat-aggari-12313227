class Walker
{
  public float x;
  public float y;
  public float scale;
  public float r;
  public float g;
  public float b;
  public float a;
  public float tx = 0, ty = 10000, tScale = 10000, tColor = 10000;
  
  void render()
  {
    circle (x, y, scale);
  }
  
   void PerlinWalk()
 {
    r = map(noise(tColor), 0, 1, 0, 255);
    g = map(noise(tColor + 1), 0, 1, 0, 255);
    b = map(noise(tColor + 2), 0, 1, 0, 255);
    a = map(noise(tColor + 3), 0, 1, 0, 255);
    fill(r, g, b, a);
    noStroke();
    
    scale = map(noise(tScale), 0, 1, 5, 150);
    
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    tx += 0.01f;
    ty += 0.01f;
    tScale += 0.01f;
    tColor += 0.01f;
 }

}
