class Enemy extends Sprite {
  Enemy(float speed, PVector position, PImage img) {
    super("enemy", position, img);
    velocity.x = speed;
  }

  public void update(Meta meta) {
    super.update(meta);

    if (collidesWith(meta, "collider")) {
      velocity.x = -velocity.x;
    }
  }
}