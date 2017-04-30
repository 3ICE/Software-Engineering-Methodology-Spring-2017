class NewLifeEvent extends Event {
  NewLifeEvent() {
    super("newLife");
  }
}

class ScoreText extends GameObject
{
  PFont f;
  PVector position;
  int nextLifeAwardedAt = 10000;

  ScoreText()
  {
    f = createFont("Arial", 16);
    position = new PVector(50, 20);
  }

  void update() {
    if (meta.score >= (nextLifeAwardedAt))
    {
      nextLifeAwardedAt += 10000;
      addOnelife();
    }
  }

  void draw()
  {
    super.draw();
    textFont(f);
    fill(0);
    textAlign(LEFT);
    text("Score: " + meta.score, position.x, position.y);
  }

  void addOnelife()
  {
    meta.eventManager.dispatchEvent(new NewLifeEvent());
  }
}
