class Jet
{
  PShape s;
  PVector location;
  PVector velocity;
  PVector acceleration; // set the value when pressing up key
  float topspeed; // maximum speed allowed
  float radius; // radius of the Jet
  
  // constructor
  Jet()
  {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,-1);
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
  void speedUp()
  {
    velocity.y *= 5;
  }
  
  void slowDown()
  {
    velocity.y *= 0.2;
  }
  
  void moveLeft()
  {
    velocity.x = -3;
  }
  
  void moveRight()
  {
    velocity.x = 3;
  }
  
  void reset()
  {
    velocity.x = 0;
  }
  
  // update the location of the jet
  void update()
  {
    location.add(velocity);
  }
  
  // check collisions
  void checkEdges()
  {
    if(location.y<0)
    {
      location.y = height;
    }
    if(location.y>height)
    {
      location.y = 0;
    }
    if(location.x > width)
    {
      location.x = width;
    }
    if(location.x < 0)
    {
      location.x = 0;
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