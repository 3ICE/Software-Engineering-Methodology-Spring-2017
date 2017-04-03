class LiveText extends GameObject
{
  PFont f;
  PVector position;

  // constructor
  LiveText()
  {
    f = createFont("Arial", 16);
    position = new PVector(width-50, 40);
  }

  void draw()
  {
    super.draw();
    textFont(f);
    textAlign(RIGHT);
    text("Lives:" + meta.gameScene.lives, position.x, position.y);
  }
}
