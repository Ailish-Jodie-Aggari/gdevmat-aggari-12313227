Walker[] circleFamily = new Walker[8];
PVector acceleration = new PVector(0.2, 0);

void setup()
{
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    
  for (int i = 0; i < 8; i++)
  {
    int posY = 2 * (Window.windowHeight / 8) * (i - (8 / 2));
    circleFamily[i] = new Walker();
    circleFamily[i].position = new PVector(Window.left / 1.5, -posY);
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
    fill(0);
    stroke(0);
    
    noStroke();
    
    for (int i = 0; i < 8; i++)
    {
      Walker circle = circleFamily[i];
      
      float mew = 0.1f; //coefficient of friction
      if (circle.position.x > 0 && circle.velocity.x > 0) {
          mew = 0.4f;
      }
      float normal = 1;
      float frictionMagnitude = mew * normal;
      
      PVector friction = circle.velocity.copy(); //copy copies current velocity of the walker
      friction.mult(-1);
      friction.normalize();
      friction.mult(frictionMagnitude);
      circle.applyForce(friction);
      
      circle.applyForce(acceleration);
      circle.update();
      circle.checkEdges();
      circle.render();
    }
    
}

void mousePressed()
  {
    if((mouseButton == LEFT) || (mouseButton == RIGHT))
    {
      for (int i = 0; i < 8; i++)
      {
        int posY = 2 * (Window.windowHeight / 8) * (i - (8 / 2));
        circleFamily[i].position = new PVector(Window.left / 1.5, -posY);
        circleFamily[i].velocity = new PVector();
        circleFamily[i].acceleration = new PVector();
        circleFamily[i].mass = i + 1;
        circleFamily[i].scale = circleFamily[i].mass * 15;
        
        float r = random(1, 255);
        float g = random(1, 255);
        float b = random(1, 255);
        circleFamily[i].setColor(r, g, b, 255);
      }
    }
  }
