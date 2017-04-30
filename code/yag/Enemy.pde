class Enemy extends Sprite implements EventListener {
  int scoreValue = 30;
  float firingSpeedCooldown=120;
  int lastTime = 0;
  //3ICE: Maybe defer shooting while we're still off-screen:
  int delta = -1000;

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

    //3ICE: Ramming
    if (collidesWith("jet")){
      meta.gameScene.jet.hp -= 6 * meta.gameScene.difficulty;
      meta.score += scoreValue * 10; //3ICE: Way more points for ramming!
      onDestroy();
      removeSelf();
    }
    delta += millis() - lastTime;
    if (delta > firingSpeedCooldown) {
      shoot();
      //shootParticles.addParticle(new PVector(position.x, position.y + 50));
    }
    lastTime = millis();
  }

  // shoot a bullet
  void shoot(){
    delta = 0; //3ICE: Reset cooldown

    //3ICE: Maybe defer shooting while we're still off-screen:
    if (position.y < -50) {
      return;
    }

    //3ICE: Spawns just on the outside the enemy sprite, closer to us than them
    addChild(new EnemyBullet(new PVector(position.x, position.y + 50), velocity));
    //3ICE: That +50 should be something like `  getSprite().getHeight() / 2  `
  }

  public void onDestroy() {
    // Access jet, bad, bad me.
    meta.gameScene.jet.addParticles(position);
    //3ICE: Hack job aside, spawning some beautiful fireworks / explosion :)

    //3ICE: And now how about something like: floatingFext("+ " + scoreValue)
  }
}