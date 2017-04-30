class EnemyBullet extends Sprite {
  int energy;

  EnemyBullet(PVector position, PVector speed) {
    // create the shape of the EnemyBullet
    super("enemybullet", position, loadImage("images/enemy_bullet_placeholder.png"));
    //Time to live, more than a second
    energy = 60;
    //3ICE: EnemyBullet does not stray left/right
    velocity.x = speed.x / 12;
    //3ICE: Initial velocity
    velocity.y = speed.y + 3;
  }

  void update() {
    //3ICE: Accelerate ever so slightly, since it's a rocket propelled bullet
    velocity.y += .05;
    //3ICE: But lose kinetic energy as it travels through air resistance
    energy--;
    if (energy == 0) {
      //println("EnemyBullet ran out of energy.");
      removeSelf();
    } else if (collidesWith("jet")){
      meta.gameScene.jet.hp -= 3 * meta.gameScene.difficulty;
      removeSelf();
    }

    super.update();
  }

  void draw()
  {
    super.draw();

    pushMatrix();
    translate(position.x, position.y);
    popMatrix();
  }
}