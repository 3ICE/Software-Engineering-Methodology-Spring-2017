// random size (rectangle) island
class Island extends Gameobject
{
  
  Island()
  {
    size = new PVector(random(400),random(300));
    velocity = new PVector(0,1);
    location = new PVector(width/2-size.x/2,-size.y);
  }
  
  void display()
  {
    fill(58,127,6);
    noStroke();
    rect(location.x,location.y,size.x,size.y,15);
  }
  
  void update()
  {
   super.update();
   if(location.y>=height+size.y/2)
   {
      size = new PVector(random(400),random(300));
      location = new PVector(width/2-size.x/2,-size.y);
   }
  }
  
}