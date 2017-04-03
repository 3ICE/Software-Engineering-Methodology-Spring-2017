import java.awt.event.KeyEvent;

class GameScene extends GameObject implements EventListener {
  Jet jet;
  FuelText fuelText;
  LiveText liveText;
  ScoreText scoreText;
  ScoreDisplay scoreDisplay;
  River river;
  int difficulty = 1;

  int lives = 3; // Temp for scores!

  void onAdd() {
    river = new River(difficulty);
    jet = new Jet();
    fuelText = new FuelText();
    liveText = new LiveText();
    scoreText = new ScoreText();
    scoreDisplay = new ScoreDisplay(meta.scoreHandler);
    addChild(river);
    addChild(jet);
    addChild(fuelText);
    addChild(liveText);
    addChild(scoreText);
    addChild(scoreDisplay);
    meta.eventManager.addEventListener("bridgeDestroyed", this);
    meta.eventManager.addEventListener("jetDestroyed", this);
    meta.eventManager.addEventListener("newLife", this);
  }

  void onRemove() {
    meta.eventManager.removeEventListener("bridgeDestroyed", this);
    meta.eventManager.removeEventListener("jetDestroyed", this);
    meta.eventManager.removeEventListener("newLife", this);
  }

  void onEvent(Event event) {
    switch (event.type) {
      case "bridgeDestroyed":
        onBridgeDestroyed();
        break;
      case "jetDestroyed":
        onJetDestroyed();
        break;
      case "newLife":
        println("newLife comes");
        onNewLife();
        break;
      case "outOfLives":
        meta.scoreHandler.addScore(meta.playerName, meta.score);
        meta.scoreHandler.saveScores("scores.csv");
      default:
        break;
    }
  }

  void onBridgeDestroyed() {
    difficulty += 1;
  }

  void onNewLife()
  {
    lives+=1;
  }

  void onJetDestroyed() {
    lives--;
    if(lives == 0){ // More temp, apologies for spaghetti
      lives = 3;
      meta.scoreHandler.addScore(meta.playerName, meta.score);
      meta.scoreHandler.saveScores("scores.csv");
      meta.score = 0;
      difficulty = 1;
    }
    river.resetToDifficulty(difficulty);
    removeChild(jet);
    jet = new Jet();
    addChild(jet);


  }
}
