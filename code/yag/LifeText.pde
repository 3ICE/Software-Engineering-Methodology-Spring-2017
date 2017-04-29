class LifeText extends GameObject
{
  PFont f;
  PVector position;

  // constructor
  LifeText()
  {
    f = createFont("Arial", 16);
    position = new PVector(width-50, 40);
  }

  void draw()
  {
    super.draw();
    textFont(f);
    fill(0);
    textAlign(RIGHT);
    text("Lives:" + meta.gameScene.lives, position.x, position.y);
  }
}
