import java.awt.event.KeyEvent;

class GameScene extends GameObject {
  Jet jet;
  FuelText fuelText;
  ScoreText scoreText;

  GameScene(Meta meta) {
    super();
    River river = new River();
    jet = new Jet();
    fuelText = new FuelText(jet);
    scoreText = new ScoreText();
    gameObjects.add(river);
    gameObjects.add(jet);
    gameObjects.add(fuelText);
    gameObjects.add(scoreText);
  }

  void update(Meta meta) {
    super.update(meta);
  }
}