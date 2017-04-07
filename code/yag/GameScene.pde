import java.awt.event.KeyEvent;

class OutOfLivesEvent extends Event {
  OutOfLivesEvent() {
    super("outOfLives");
  }
}

class GameScene extends GameObject implements EventListener {
  Jet jet;
  FuelText fuelText;
  LifeText lifeText;
  ScoreText scoreText;
  ScoreDisplay scoreDisplay;
  GameOverText gameOverText;
  River river;
  int difficulty = 1;

  int lives = 3; // Temp for scores!

  void onAdd() {
    river = new River(difficulty);
    jet = new Jet();
    fuelText = new FuelText();
    lifeText = new LifeText();
    scoreText = new ScoreText();
    gameOverText= new GameOverText();
    scoreDisplay = new ScoreDisplay(meta.scoreHandler);
    addChild(river);
    addChild(jet);
    addChild(fuelText);
    addChild(lifeText);
    addChild(scoreText);
    addChild(scoreDisplay);
    meta.eventManager.addEventListener("bridgeDestroyed", this);
    meta.eventManager.addEventListener("jetDestroyed", this);
    meta.eventManager.addEventListener("newLife", this);
    meta.eventManager.addEventListener("outOfLives", this);
  }

  void onRemove() {
    meta.eventManager.removeEventListener("bridgeDestroyed", this);
    meta.eventManager.removeEventListener("jetDestroyed", this);
    meta.eventManager.removeEventListener("newLife", this);
    meta.eventManager.removeEventListener("outOfLives", this);
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
        onNewLife();
        break;
      case "outOfLives":
        println("game over");
        //addChild(gameOverText);
        //meta.scoreHandler.addScore(meta.playerName, meta.score);
        //meta.scoreHandler.saveScores("scores.csv");
        break;
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
    removeChild(jet);
    if(lives == 0){ // More temp, apologies for spaghetti
      //meta.eventManager.dispatchEvent(new OutOfLivesEvent());
      addChild(gameOverText);
      meta.scoreHandler.addScore(meta.playerName, meta.score);
      meta.scoreHandler.saveScores("scores.csv");
    }
    else
    {
      river.resetToDifficulty(difficulty);
      jet = new Jet();
      addChild(jet);
    }
  }

}
