class GameOverText extends GameObject
{
  PFont f;
  PVector position;

  // constructor
  GameOverText()
  {
    f = createFont("Arial", 64);
    position = new PVector(width/2, height/2);
  }

  void draw()
  {
    super.draw();
    textFont(f);
    textAlign(CENTER);
    text("GAME OVER", position.x, position.y);
  }
}