class Walker
{
  //public PVector tPosition = new PVector(0,10000);
  public PVector position = new PVector();
  public PVector speed = new PVector(5, 8);
  public float scale, r, g, b, a;
  public float tScale = 10000, tColor = 10000;
  
  void render()
  {
    circle (position.x, position.y, scale);
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
    
    /*I'm not so sure if the perlinWalk will still remain as the main movement of the circle so I just turn them to comments for now.
    position.x = map(noise(tPosition.x), 0, 1, Window.left, Window.right);
    position.y = map(noise(tPosition.y), 0, 1, Window.bottom, Window.top);
    tPosition.x += 0.01f;
    tPosition.y += 0.01f;*/
    
    moveAndBounce();
    
    tScale += 0.01f;
    tColor += 0.01f;
 }
 
 void moveAndBounce()
 {
 //flush the screen with white background
    background(255);
  
  //add speed to current position
    position.add(speed);
  
  //conditions for bouncing
  if((position.x > Window.right) || (position.x < Window.left))
  {
    speed.x *= -1;
  }
  if((position.y > Window.top) || (position.y < Window.bottom))
  {
    speed.y *= -1;
  }
 }

}
