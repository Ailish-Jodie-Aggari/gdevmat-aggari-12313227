Walker[] circleFamily = new Walker[10];
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    
  for (int i = 0; i < 10; i++)
  {
    circleFamily[i] = new Walker();
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
    background(0);
    noStroke();
    
    for (int i = 0; i < 10; i++)
    {
      Walker circle = circleFamily[i];
           
      circle.applyForce(wind);
      circle.applyForce(gravity);
      circle.update();
      circle.checkEdges();
        
      circle.render();
    }
}
