class Bullet extends Sprite {
  int energy;
  boolean killBullet = false;

  Bullet(PVector position, PVector kinetic) {
    // create the shape of the Bullet
    super("bullet", position, loadImage("images/bullet_placeholder.png"));
    //Time to live, about half a second
    energy = 30;
    //3ICE: Bullet strays left/right based on jet movement as it was firing
    velocity.x = kinetic.x;
    //3ICE: Initial velocity is jet velocity + 3
    velocity.y = kinetic.y - 3;
  }

  void update() {
    //3ICE: Accelerate slightly, since it's a rocket propelled bullet
    velocity.y -= .5;
    //3ICE: But lose kinetic energy as it travels through air resistance
    energy--;
    if (energy == 0) {
      //println("Bullet ran out of energy.");
      removeSelf();
    } else if (collidesWith("enemy") || collidesWith("bank")) {
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