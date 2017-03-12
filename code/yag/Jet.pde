class Jet extends Entity {
  String collisionType = "jet";
  PShape s;
  float topspeed; // maximum speed allowed
  int radius;
  int fuel;

  // constructor
  Jet() {
    super("jet", new PVector(width / 2, height));
    //acceleration = new PVector(5,5);
    topspeed = 10;
    // create the shape of the Jet
    radius = 29;
    fuel = 2000;
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
  }

  public PVector[] getCollisionMask()
  {
    PVector[] collisionMask = new PVector[3];
    collisionMask[0] = new PVector(position.x, position.y - 50);
    collisionMask[1] = new PVector(position.x + radius, position.y + 40);
    collisionMask[2] = new PVector(position.x - radius, position.y + 40);
    return collisionMask;
  }

  void update(Meta meta) {
    if (collidesWith(meta, "enemy") || collidesWith(meta, "collider"))
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

    if (collidesWith(meta, "fuel"))
    {
      fuel += 3;
    }
    fuel--;
    if (fuel == 0) {
      crash();
      return;
    }

    super.update(meta);
  }

  // show the jet in the background
  void draw(Meta meta)
  {
    super.draw(meta);

    pushMatrix();
    translate(position.x, position.y);
    shape(s);
    popMatrix();
  }

  // shoot a bullet
  void Shoot(){}

  // destoried by enermies
  void crash()
  {
    // reset position of the Jet, later should be updated to destory
    fuel = 2000;
    position = new PVector(width/2, height/2);
  }
}