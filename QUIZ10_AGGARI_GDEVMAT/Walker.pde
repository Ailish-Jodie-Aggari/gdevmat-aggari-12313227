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
    this.acceleration.mult(0);
  }
  
  public void render()
  {
    fill(r, g, b, a);
    circle(position.x, position.y, scale);
  }

  public void checkEdges()
  {
    if(this.position.x > Window.right)
      {
        this.position.x = Window.right;
      }
      
    else if(this.position.x < Window.left)
      {
        this.position.x = Window.left;
      }
      
    if(this.position.y > Window.top)
      {
        this.position.y = Window.top;
      }
      
    else if(this.position.y < Window.bottom)
      {
        this.position.y = Window.bottom;
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
