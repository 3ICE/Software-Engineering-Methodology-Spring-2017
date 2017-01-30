class Jet extends Gameobject
{
  PShape s;
  PVector acceleration; // set the value when pressing up key
  float topspeed; // maximum speed allowed
  float radius; // radius of the Jet
  
  // constructor
  Jet()
  {
    location = new PVector(width/2, height-radius);
    velocity = new PVector(0,0);
    //acceleration = new PVector(5,5);
    topspeed = 10;
    // create the shape of the Jet
    radius = 29;
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
  
  // show the jet in the background
  void display()
  {
    pushMatrix();
    translate(location.x, location.y);
    shape(s);
    popMatrix();
  }
  
  // change velocity by press keyboard up, down, left, right
  void accelerate()
  {
    velocity.y = -5;
  }
  
  void decelerate()
  {
    velocity.y = 5;
  }
  
  void moveLeft()
  {
    velocity.x = -3;
  }
  
  void moveRight()
  {
    velocity.x = 3;
  }

  void resetY()
  {
    velocity.y = 0;
  }
  
  void resetX()
  {
    velocity.x = 0;
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
  void destory()
  {
    // reset location of the Jet, later should be updated to destory
    location = new PVector(width/2, height/2);
  }
}