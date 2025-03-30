class Walker
{
  float x;
  float y;
  
  void render()
  {
    circle (x, y, 30);
  }
  
  void randomWalker()
  {
    int rng = int(random(8));
    if (rng == 0)
    {
      y += 10;    
    }
    else if (rng == 1)
    {
      y -= 10;
    }
    else if (rng == 2)
    {
      x += 10;
    }
    else if (rng == 3)
    {
      x -=10;
    }
    else if (rng == 4)
    {
      x += 10;
      y += 10;
    }
    
    else if (rng == 5)
    {
      x += 10;
      y -= 10;
    }
    else if (rng == 6)
    {
      x -= 10;
      y -= 10;
    }
    else if (rng == 7)
    {
      x -= 10;
      y += 10;
    }
    
  }
  
  void randomWalkBiased()
  {
    float rng = random(2.0);
    if (rng < 0.2)
    {
      y += 10;    
    }
    else if (rng < 0.3)
    {
      y -= 10;
    }
    else if (rng < 0.2)
    {
      x += 10;
    }
    else if (rng < 0.3)
    {
      x -=10;
    }
    else if (rng < 0.1)
    {
      x += 10;
      y += 10;
    }
    
    else if (rng < 0.4)
    {
      x += 10;
      y -= 10;
    }
    else if (rng < 0.3)
    {
      x -= 10;
      y -= 10;
    }
    else if (rng < 0.2)
    {
      x -= 10;
      y += 10;
    }
  }
  
}
