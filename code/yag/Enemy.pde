class Enemy extends Sprite {
  int scoreValue = 1;
  Enemy(float speed, PVector position, PImage img) {
    super("enemy", position, img);
    velocity.x = speed;
  }

  public void update() {
    super.update();

    if (collidesWith("bullet"))
    {
      meta.score += scoreValue;
      onDestroy();
      removeSelf();
    }

    if (collidesWith("collider")) {
      velocity.x = -velocity.x;
    }
  }

  public void onDestroy() {
  }
}