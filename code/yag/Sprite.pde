class Sprite extends Entity
{
  PImage img;
  PVector size;

  Sprite(String collisionType, PVector position, PImage img)
  {
    super(collisionType, position);
    this.img = img;
    this.size = new PVector(img.width, img.height);
  }

  public PVector[] getCollisionMask()
  {
    PVector[] collisionMask = new PVector[4];
    collisionMask[0] = new PVector(position.x - size.x / 2, position.y - size.y / 2);
    collisionMask[1] = new PVector(position.x + size.x / 2, position.y - size.y / 2);
    collisionMask[2] = new PVector(position.x + size.x / 2, position.y + size.y / 2);
    collisionMask[3] = new PVector(position.x - size.x / 2, position.y + size.y / 2);
    return collisionMask;
  }

  void draw(Meta meta)
  {
    super.draw(meta);
    image(img, position.x - size.x / 2, position.y - size.y / 2);
  }
}