class HealthBar extends GameObject
{
  PVector position;

  // constructor, set the position of HP bar on the bottom
  HealthBar()
  {
    position = new PVector(width/2-50, height-20);
  }

  //3ICE: this is for debugging, hp should be tracked for real
  //(todo: remove 1 life, respawn player jet, etc.)
  void update() {
    if(meta.gameScene.jet.hp<=0)
    {
        meta.gameScene.jet.hp=100;
    }
  }
  
  // draw a very simple rectangle as HP bar
  void draw()
  {
    super.draw();
    rect(position.x, position.y,100,10);
    if(meta.gameScene.jet.hp<50)
    {
      fill(255,0,0);
    }
    else
    {
      fill(0,255,0);
    }
    rect(position.x, position.y,meta.gameScene.jet.hp,10);
  }
}