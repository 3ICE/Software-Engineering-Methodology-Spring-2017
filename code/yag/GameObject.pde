class Gameobject
{
  PVector location;
  PVector velocity;
  PVector size;
  
  Gameobject()
  {
    velocity = new PVector(0,1);
  }
  
  void display()
  {
  }
  
  void update()
  {
    location.add(velocity);
  }
}