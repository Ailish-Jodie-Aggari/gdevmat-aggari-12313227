Walker[] matterFamilyGathering = new Walker[30];

void setup() {
  size(1280, 720, P3D); // Set window size
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < 30; i++)
  {
    matterFamilyGathering[i] = new Walker();
    matterFamilyGathering[i].position.x = random(Window.left, Window.right);
    matterFamilyGathering[i].position.y = random(Window.bottom, Window.top);
    matterFamilyGathering[i].mass = random(1, 10);
    matterFamilyGathering[i].scale = matterFamilyGathering[i].mass * 15;

    float r, g, b, a;
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    a = random(50, 150);
    matterFamilyGathering[i].setColor(r, g, b, a);
  }
  
}

void draw()
{
  background(255);
  noStroke();
  
  for (int i = 0; i < 30; i++)
  {
    for (int j = 0; j < 30; j++)
    {
      if (i != j) {
        PVector force = matterFamilyGathering[j].calculateAttraction(matterFamilyGathering[i]);
        matterFamilyGathering[i].applyForce(force);
      }
    }
  }
  
  for (int i = 0; i < 30; i++)
  {    
    matterFamilyGathering[i].update();
    matterFamilyGathering[i].render();
  }
 
}
