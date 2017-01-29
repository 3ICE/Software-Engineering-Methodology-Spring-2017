class Jet
{
  PShape s;
  PVector location;
  PVector velocity;
  PVector acceleration; // set the value when pressing up key
  float topspeed;
  
  Jet()
  {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,-1);
    topspeed = 4;
    // create the shape of the Jet
    s = createShape();
    s.beginShape();
    s.fill(102);
    s.stroke(255);
    s.strokeWeight(2);
    s.vertex(0, -50);
    s.vertex(29, 40);
    s.vertex(0, 25);
    s.vertex(-29, 40);
    s.endShape(CLOSE);
  }
  
  void display()
  {
    pushMatrix();
    translate(location.x, location.y);
    shape(s);
    popMatrix();
  }
  
  void update()
  {
    location.add(velocity);
  }
  
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
  }
  
  
  void Shoot(){}
}