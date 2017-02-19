// The base for all enemies
class BaseEnemy extends RiverObject{

  
  BaseEnemy()
  {
    size = new PVector(100, 100);
    velocity = new PVector(0,1);
    location = new PVector(random(width), -random(height * 3) - size.y);
  }

  void draw(Meta meta)
  {
    super.draw(meta);
    fill(255,127,6);
    noStroke();
    rect(location.x,location.y,size.x,size.y,15);
  }

  void refresh(){
    location = new PVector(random(width), -random(height * 3) - size.y);
  }

  void update(Meta meta)
  {
    super.update(meta);
    if(location.y >= height + size.y/2)
    {
      refresh();
    }
  } 
  
}