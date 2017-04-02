import java.awt.event.KeyEvent;

class GameScene extends GameObject implements EventListener {
  Jet jet;
  FuelText fuelText;
  ScoreText scoreText;
  River river;
  int difficulty = 1;

  void onAdd() {
    river = new River(difficulty);
    jet = new Jet();
    fuelText = new FuelText();
    scoreText = new ScoreText();
    addChild(river);
    addChild(jet);
    addChild(fuelText);
    addChild(scoreText);

    meta.eventManager.addEventListener("bridgeDestroyed", this);
    meta.eventManager.addEventListener("jetDestroyed", this);
  }

  void onRemove() {
    meta.eventManager.removeEventListener("bridgeDestroyed", this);
    meta.eventManager.removeEventListener("jetDestroyed", this);
  }

  void onEvent(Event event) {
    switch (event.type) {
      case "bridgeDestroyed":
        onBridgeDestroyed();
        break;
      case "jetDestroyed":
        onJetDestroyed();
        break;
      default:
        break;
    }
  }

  void onBridgeDestroyed() {
    difficulty += 1;
  }

  void onJetDestroyed() {
    river.resetToDifficulty(difficulty);
    removeChild(jet);
    jet = new Jet();
    addChild(jet);
  }
}