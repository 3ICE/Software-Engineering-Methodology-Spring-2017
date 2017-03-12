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

  void update(Meta meta) {
    //3ICE: Accelerate slightly, since it's a rocket propelled bullet
    velocity.y -= .5;
    //3ICE: But lose kinetic energy as it travels through air resistance
    energy--;
    if (energy == 0) {
      //println("Bullet ran out of energy.");
      fall();
    }
    super.update(meta);
  }

  void afterUpdate(Meta meta)
  {
    //3ICE: Delay 1self destruct by 1 frame so the object the bullet hit has time to detect it as well, and destroy itself.
    if(killBullet)
    {
      fall();
    }
    if (collidesWith(meta, "enemy") || collidesWith(meta, "collider"))
    {
      //println("Bullet hit something.");
      //fall(); //3ICE: Race condition BAD! Queue for destruction instead:
      killBullet = true;
    }
    super.afterUpdate(meta);
  }
  
  void draw(Meta meta)
  {
    super.draw(meta);

    pushMatrix();
    translate(position.x, position.y);
    popMatrix();
  }

  void fall()
  {
    //3ICE: Take it out of the game area right away.
    position.x=9999;
    position.y=9999;
    velocity.y=0;
    //3ICE: Delete it next frame:
    meta.gameObjects.remove(this); //After I moved to CopyOnWriteArrayList, this line stops throwing...
    //ConcurrentModificationException errors. :) But who knows what complications that introduced for us.
  }
}