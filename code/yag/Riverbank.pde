class Riverbank extends RiverObject
{

  Riverbank(float w,float h)
  {
    super();
    size = new PVector(w,h);
    this.location = new PVector(0,height-h);
  }

  void update(Meta meta) {
    super.update(meta);
    display();
  }

  void display()
  {
    fill(0,255,0);
    noStroke();
    rect(0,location.y,size.x,size.y);
    rect(width-size.x,location.y,size.x,size.y);
  }

  void detectCollision(Jet jet)
  {
    if ((jet.location.x + jet.radius >= (width-size.x)) || (jet.location.x - jet.radius <= size.x))
    {
      jet.destroy();
    }
  }
}