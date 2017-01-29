class Riverbank
{
  //float x;
  //float y;
  float w; // width of the bank
  float h; // height of the bank
  
  Riverbank(float w,float h)
  {
    //this.x = x;
    //this.y = y;
    this.w = w;
    this.h = h;
  }
  
  // 
  void display()
  {
    fill(0,255,0);
    noStroke();
    rect(width-w,0,w,h);
    rect(0,0,w,h);
  }
  
  // should randomly change the width of the bank during the game? how to do it!!!!
  void update()
  {
    
  }
  
  // 
  void detectCollision(Jet jet)
  {
    if ((jet.location.x + jet.radius >= (width-w)) || (jet.location.x - jet.radius <= (w)))
    {
      jet.destory();
    }
    
  }
}