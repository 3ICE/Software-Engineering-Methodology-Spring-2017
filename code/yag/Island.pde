// random size (rectangle) island
class Island extends RiverObject
{

  Island()
  {
    size = new PVector(random(400),random(300));
    velocity = new PVector(0,1);
    location = new PVector(width/2-size.x/2,-size.y);
  }

  void draw(Meta meta)
  {
    super.draw(meta);
    fill(58,127,6);
    noStroke();
    rect(location.x,location.y,size.x,size.y,15);
  }

  void update(Meta meta)
  {
    super.update(meta);
    if(location.y>=height+size.y/2)
    {
      size = new PVector(random(400),random(300));
      location = new PVector(width/2-size.x/2,-size.y);
    }
  }

}