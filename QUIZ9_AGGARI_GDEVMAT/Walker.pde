public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration   = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  public float mass = 1;
  public float r = 255, g = 255, b = 255, a = 255;
  
  public Walker()
  {
    
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.acceleration.mult(0); //resets acceleration every frame
  }
  
  public void render()
  {
    fill(r, g, b, a);
    circle(position.x, position.y, scale);
  }

  public void checkEdges()
  {
    if((position.x > Window.right) || (position.x < Window.left))
    {
    velocity.x *= -1;
    }
    if((position.y > Window.top) || (position.y < Window.bottom))
    {
    velocity.y *= -1;
    }
  }
  
  public void setColor(float r, float g, float b, float a)
   {
      this.r = r;
      this.g = g;
      this.b = b;
      this.a = a;
   }
}
