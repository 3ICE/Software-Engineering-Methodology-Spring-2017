class Enemy extends Sprite implements EventListener {
  int scoreValue = 1;
  Enemy(float speed, PVector position, PImage img) {
    super("enemy", position, img);
    velocity.x = speed;
  }

  void onAdd() {
    //3ICE: Handle difficulty if spawned before bridge kill
    meta.eventManager.addEventListener("bridgeDestroyed", this);

    //3ICE: or after bridge kill
    velocity.x *= 1.0 + (meta.gameScene.difficulty/100.0); //3ICE: More negative = more faster
  }

  void onRemove() {
    meta.eventManager.removeEventListener("bridgeDestroyed", this);
  }

  void onEvent(Event event) {
    if (event.type == "bridgeDestroyed") {
      //3ICE: Handle difficulty if spawned before bridge kill
      velocity.x *= 1.0 + (meta.gameScene.difficulty/10.0);
    }
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
    //3ICE: How about spawning some fireworks / explosion? :)
    //3ICE: And something like: floatingFext("+ " + scoreValue)
  }
}