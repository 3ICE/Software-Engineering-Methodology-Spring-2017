class RiverObject extends GameObject
{
  PVector location;
  PVector velocity;
  PVector size;

  RiverObject()
  {
    velocity = new PVector(0,1);
  }

  void update(Meta meta)
  {
    location.add(velocity);
  }
}