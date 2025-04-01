void setup() {
  size(1080, 720, P3D); // Set window size
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos() {
  float x = mouseX - Window.windowWidth / 2; 
  float y = -(mouseY - Window.windowHeight / 2); 
  return new PVector(x, y);
}

void draw()
{
  background(130);
  
  strokeWeight(5);
  stroke(255, 0, 0);
  
  PVector mouse = mousePos();
  
  mouse.normalize().mult(200);
  println(mouse.mag());
  strokeWeight(25);
  stroke(255, 0, 0, 180);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);

  strokeWeight(10);
  stroke(255);
  line(-mouse.x, -mouse.y,  mouse.x, mouse.y);
  
  
  mouse.normalize().mult(35);
  strokeWeight(12.5);
  stroke(0);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);


}
