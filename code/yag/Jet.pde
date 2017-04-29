class JetDestroyedEvent extends Event {
  JetDestroyedEvent() {
    super("jetDestroyed");
  }
}

class Jet extends Entity {
  String collisionType = "jet";
  PShape s;
  float topspeed; // maximum speed allowed
  int radius;
  int fuel;
  float firingSpeedCooldown=180;
  int lastTime = 0;
  int delta = 0;
  // int lives;  the number of times you can die
  int hp; // the HP of the jet
  ParticleSystem shootParticles;
  // constructor
  Jet() {
    super("jet", new PVector(width / 2, height));
    //acceleration = new PVector(5,5);
    topspeed = 10;
    // create the shape of the Jet
    radius = 29;
    fuel = 2000;
    // slives = 3;
    hp = 100;
    s = createShape();
    s.beginShape();
    s.fill(102);
    s.stroke(255);
    s.strokeWeight(2);
    s.vertex(0, -50);
    s.vertex(radius, 40);
    s.vertex(0, 25);
    s.vertex(-radius, 40);
    s.endShape(CLOSE);
    shootParticles = new ParticleSystem(new PVector(width/2, 50));
  }

  public PVector[] getCollisionMask()
  {
    PVector[] collisionMask = new PVector[3];
    collisionMask[0] = new PVector(position.x, position.y - 50);
    collisionMask[1] = new PVector(position.x + radius, position.y + 40);
    collisionMask[2] = new PVector(position.x - radius, position.y + 40);
    return collisionMask;
  }

  void update() {
    if (collidesWith("enemy") || collidesWith("collider"))
    {
      crash();
      return;
    }

    if (meta.inputManager.getState(KeyEvent.VK_UP)) {
      velocity.y = -5;
    } else if (meta.inputManager.getState(KeyEvent.VK_DOWN)) {
      velocity.y = 5;
    } else {
      velocity.y = 0;
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