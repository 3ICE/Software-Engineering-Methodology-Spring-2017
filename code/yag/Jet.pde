class Jet extends RiverObject
{
  PShape s;
  PVector acceleration; // set the value when pressing up key
  float topspeed; // maximum speed allowed
  float radius; // radius of the Jet
  int fuel;
  
  // constructor
  Jet()
  {
    location = new PVector(width/2, height-radius);
    velocity = new PVector(0,0);
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

  void update(Meta meta) {
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
    
    fuel--;
    super.update(meta);

    checkEdges();
  }

  // show the jet in the background
  void draw(Meta meta)
  {
    super.draw(meta);
    
    pushMatrix();
    translate(location.x, location.y);
    shape(s);
    popMatrix();
  }

  // check collisions with borders
  void checkEdges()
  {
    if(location.y-radius <= 0)
    {
      location.y = radius;
    }
    if(location.y+radius>=height)
    {
      location.y = height-radius;
    }
  }

  // shoot a bullet
  void Shoot(){}

  // destoried by enermies
  void destroy()
  {
    // reset location of the Jet, later should be updated to destory
    location = new PVector(width/2, height/2);
  }
}