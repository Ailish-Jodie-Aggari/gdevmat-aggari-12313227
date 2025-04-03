Mover blackHole = new Mover();
Mover[] groupOfMatter = new Mover[500];
int frameReset = 300;

void setup()
{
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    background(0);
    
    matterSpawner();    
}

void matterSpawner()
{
    float x, y, size, r, g, b;
    
    for (int i = 0; i < 500; i++) {
        x = random(Window.left, Window.right);
        y = random(Window.bottom, Window.top);
        size = random(5, 20);
        groupOfMatter[i] = new Mover(x, y, size);
        
        r = random(0, 255);
        g = random(0, 255);
        b = random(0, 255);
        groupOfMatter[i].setColor(r, g, b, 255);
    }
}

PVector mousePos() {
  float x = mouseX - Window.windowWidth / 2; 
  float y = -(mouseY - Window.windowHeight / 2); 
  return new PVector(x, y);
}

void draw()
{
    if (frameCount % frameReset == 0) {
        background(0);
        matterSpawner();
        //I decided not to remove this in case you would still like to see the code without the bonus
        blackHole.position.set(random(Window.left, Window.right), random(Window.bottom, Window.top));
    }
    
    background(0);
    noStroke();

    for (int i = 0; i < 500; i++)
    {
        Mover matter = groupOfMatter[i];
        PVector direction = PVector.sub(blackHole.position, matter.position);
        direction.normalize();
        direction.mult(5);
        matter.position.add(direction);
        
        matter.render();
    }
    
    PVector mouse = mousePos();
    PVector step = PVector.sub(mouse, blackHole.position);
    blackHole.position.add(step);
    blackHole.render();
}
