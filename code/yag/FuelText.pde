class FuelText extends GameObject
{
  PFont f;
  PVector position;

  // constructor
  FuelText()
  {
    f = createFont("Arial", 16);
    position = new PVector(width-50, 20);
  }

  void draw()
  {
    super.draw();
    textFont(f);
    if(meta.gameScene.jet.fuel<500)
    {
      fill(255,0,0);
    }
    else{
      fill(0);
    }
    textAlign(RIGHT);
    text("Fuel:" + meta.gameScene.jet.fuel, position.x, position.y);
  }
}