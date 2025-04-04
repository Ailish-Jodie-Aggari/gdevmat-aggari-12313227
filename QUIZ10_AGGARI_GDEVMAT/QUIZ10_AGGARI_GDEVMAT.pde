Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker myWalker = new Walker();
Walker[] circleFamily = new Walker[10];
PVector wind = new PVector(0.15, 0);

void setup() {
  size(1280, 720, P3D); // Set window size
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < 10; i++)
  {
    int posX = 2 * (Window.windowHeight / 10 + 20) * (i - (10 / 2));
    circleFamily[i] = new Walker();
    circleFamily[i].position = new PVector(posX, Window.top);
    circleFamily[i].mass = i + 1;
    circleFamily[i].scale = circleFamily[i].mass * 15;

    float r, g, b;
    r = random(1, 255);
    g = random(1, 255);
    b = random(1, 255);
    circleFamily[i].setColor(r, g, b, 255);
  }
}

void draw()
{
  background(255);
  
  ocean.render();
  
  for (Walker circle : circleFamily)
  {
  
    circle.render();
    circle.update();
    
    PVector gravity = new PVector(0, -0.25 * circle.mass);
    circle.applyForce(gravity); //Apply gravity to our walker
    
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = circle.velocity.copy();
    circle.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude)); //applying friction to Walker
    circle.checkEdges();
    
    if(circle.position.y <= Window.bottom)
    {
      circle.position.y = Window.bottom;
      circle.velocity.y *= -1;
    }
    
    if(!ocean.isCollidingWith(circle))
    {
      circle.applyForce(wind);
    }
    
    else if(ocean.isCollidingWith(circle))
    {
      PVector dragForce = ocean.calculateDragForce(circle);
      circle.applyForce(dragForce);
    }
  
  }
}

void mousePressed()
{
  if((mouseButton == LEFT) || (mouseButton == RIGHT))
  {
    for (int i = 0; i < 10; i++)
    {
      int posX = 2 * (Window.windowHeight / 10 + 20) * (i - (10 / 2));
      circleFamily[i] = new Walker();
      circleFamily[i].position = new PVector(posX, Window.top);
      circleFamily[i].mass = i + 1;
      circleFamily[i].scale = circleFamily[i].mass * 15;
  
      float r, g, b;
      r = random(1, 255);
      g = random(1, 255);
      b = random(1, 255);
      circleFamily[i].setColor(r, g, b, 255);
    }
  }
}
