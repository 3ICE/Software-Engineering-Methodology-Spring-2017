class Enemy extends Sprite {
  Enemy(float speed, PVector position, PImage img) {
    super("enemy", position, img);
    velocity.x = speed;
  }

  public void update(Meta meta) {
    super.update(meta);

    if (collidesWith(meta, "bullet"))
    {
      println("Boom!");
      position.x = 9999;
      position.y = 9999;
      velocity.y = 0;
      meta.gameObjects.remove(this);
    }

    if (collidesWith(meta, "collider")) {
      velocity.x = -velocity.x;
    }
  }
}