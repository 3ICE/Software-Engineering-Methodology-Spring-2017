class Entity extends GameObject
{
  PImage img;
  PVector position;
  PVector velocity;
  PVector acceleration;

  Entity(PVector position)
  {
    this("entity", position);
  }

  Entity(String collisionType, PVector position)
  {
    super(collisionType);
    this.position = position;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update()
  {
    super.update();
    velocity.add(acceleration);
    position.add(velocity);
  }
}