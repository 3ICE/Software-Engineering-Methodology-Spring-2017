class JetDestroyedEvent extends Event {
  JetDestroyedEvent() {
    super("jetDestroyed");
  }
}

class Jet extends Entity {
  String collisionType = "jet";
  PShape s;
  float topspeed; // maximum speed allowed
  int jwidth = 20;
  int jheight = 30;
  int fuel;
  float firingSpeedCooldown=180;
  int lastTime = 0;
  int delta = 0;
  // int lives;  the number of times you can die
  int hp; // the HP of the jet
  ParticleSystem shootParticles;
  ParticleSystem boomParticles;
  // constructor
  Jet() {
    super("jet", new PVector(width / 2, height - 60));
    //acceleration = new PVector(5,5);
    topspeed = 10;
    // create the shape of the Jet
    fuel = 2000;
    // slives = 3;
    hp = 100;
    s = createShape();
    s.beginShape();
    s.fill(102);
    s.stroke(255);
    s.strokeWeight(2);
    s.vertex(0, -jheight / 2);
    s.vertex(jwidth / 2, jheight / 2);
    s.vertex(0, jheight / 3);
    s.vertex(-jwidth / 2, jheight / 2);
    s.endShape(CLOSE);
    shootParticles = new ParticleSystem(new PVector(width/2, 50));
    boomParticles = new ParticleSystem(new PVector(width/2, 50));
    boomParticles.size = 12;
  }

  public PVector[] getCollisionMask()
  {
    PVector[] collisionMask = new PVector[3];
    collisionMask[0] = new PVector(position.x, position.y - jheight / 2);
    collisionMask[1] = new PVector(position.x + jwidth / 2, position.y + jheight / 2);
    collisionMask[2] = new PVector(position.x - jwidth / 2, position.y + jheight / 2);
    return collisionMask;
  }

  void update() {
    //3ICE: Removed collidesWith("enemy")||, see comment "ramming" in Enemy.pde
    if (collidesWith("collider"))
    {
      crash();
      return;
    }
    if (collidesWith("enemybullet"))
    {
      hp -= 3 * meta.gameScene.difficulty;
    }

    if (meta.inputManager.getState(KeyEvent.VK_LEFT)) {
      velocity.x = -3;
    } else if (meta.inputManager.getState(KeyEvent.VK_RIGHT)) {
      velocity.x = 3;
    } else {
      velocity.x = 0;
    }

    if (collidesWith("fuel"))
    {
      fuel += 3;
    }
    fuel--;
    if (fuel == 0) {
      crash();
      return;
    }

    //println("b"+delta);
    delta += millis() - lastTime;
    //println("a"+delta);
    if (delta > firingSpeedCooldown && meta.inputManager.getState(KeyEvent.VK_SPACE)) {
      shoot();
      shootParticles.addParticle(new PVector(position.x, position.y-20));
    }
    lastTime = millis();

    super.update();
  }

  // show the jet in the background
  void draw()
  {
    super.draw();

    pushMatrix();
    translate(position.x, position.y);
    shape(s);
    popMatrix();
    shootParticles.run();
    boomParticles.run();
  }

  void addParticles(PVector pos){
     for (int i = 0; i < 100; i++){
        boomParticles.addParticle(new PVector(pos.x, pos.y));
     }
  }

  // shoot a bullet
  void shoot()
  {
    //println("Pew");
    //for(GameObject go : meta.gameObjects){println(go);} //for(Bullet b : meta.bullets){println(b);}
    delta = 0; //3ICE: Reset cooldown
    addChild(new Bullet(new PVector(position.x, position.y-20), velocity));
  }

  // destroyed by enemies
  void crash()
  {
    meta.eventManager.dispatchEvent(new JetDestroyedEvent());
  }
}