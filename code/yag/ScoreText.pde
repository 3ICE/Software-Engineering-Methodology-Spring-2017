class NewLiveEvent extends Event {
  NewLiveEvent() {
    super("newLive");
  }
}

class ScoreText extends GameObject
{
  PFont f;
  PVector position;
  int tmp=0;

  ScoreText()
  {
    f = createFont("Arial", 16);
    position = new PVector(50, 20);
  }

  void update() {
    if (meta.score >= (tmp + 100))
    {
      tmp += 100;
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
    meta.eventManager.dispatchEvent(new NewLiveEvent());
  }
}
