Walker[] lilGuys = new Walker[100];

void setup()
{
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    
    spawnLilGuys();
}

void spawnLilGuys()
{
    for (int i = 0; i < lilGuys.length; i++) {
        float x = random(Window.left, Window.right);
        float y = random(Window.bottom, Window.top);
        lilGuys[i] = new Walker(x, y, random(5, 20));
    }
}

PVector mousePos() {
    float x = mouseX - Window.windowWidth; 
    float y = -(mouseY - Window.windowHeight); 
    return new PVector(x, y);
}

void draw() {    
    background(0);
    noStroke();
    PVector mouse = mousePos();
    
    for (int i = 0; i < 100; i++)
    {
        Walker lilGuysAroundTheMouse = lilGuys[i];
        PVector direction = PVector.sub(mouse, lilGuysAroundTheMouse.position).normalize().mult(0.2);        
        lilGuysAroundTheMouse.acceleration = direction;
        
        lilGuysAroundTheMouse.update();
        lilGuysAroundTheMouse.render();
    }
}
