import java.util.HashSet;

class Meta extends GameObject implements EventListener {
  InputManager inputManager;
  ScoreHandler scoreHandler;
  EventManager eventManager;
  private String playerName;
  private boolean debugMode = true;
  int score = 0;

  private NameScreen nameScreen;
  private StoryDisplay storyDisplay;
  public GameScene gameScene;

  void onAdd() {
    eventManager = new EventManager();
    inputManager = new InputManager();
    scoreHandler = new ScoreHandler();

    scoreHandler.loadScores("scores.csv");
    addChild(eventManager);
    addChild(inputManager);

    if (debugMode) {
      playerName = "DEBUG";
      gameScene = new GameScene();
      addChild(gameScene);
    } else {
      nameScreen = new NameScreen();
      addChild(nameScreen);
      eventManager.addEventListener("nameSubmit", this);
    }
  }

  public boolean isDebugMode() {
    return debugMode;
  }

  public void onEvent(Event event) {
    switch (event.type) {
      case "nameSubmit":
        onNameSubmit((NameSubmitEvent)event);
        break;
      case "storyFinished":
        onStoryFinished();
        break;
      default:
        break;
    }
  }

  public void onNameSubmit(NameSubmitEvent event) {
    playerName = event.name;
    removeChild(nameScreen);
    storyDisplay = new StoryDisplay(playerName);
    addChild(storyDisplay);
    eventManager.removeEventListener("nameSubmit", this);
    eventManager.addEventListener("storyFinished", this);
  }

  public void onStoryFinished() {
    removeChild(storyDisplay);
    gameScene = new GameScene();
    addChild(gameScene);
  }

  // Returns the player name.
  public String getPlayerName() {
    return playerName;
  }
}