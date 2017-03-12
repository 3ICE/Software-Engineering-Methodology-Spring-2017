class ScoreText extends GameObject
{
  PFont f;
  PVector position;

  ScoreText()
  {
    f = createFont("Arial", 16);
    position = new PVector(50, 20);
  }

  void draw(Meta meta)
  {
    super.draw(meta);
    textFont(f);
    fill(0);
    textAlign(LEFT);
    text("Score: " + meta.score, position.x, position.y);
  }
}