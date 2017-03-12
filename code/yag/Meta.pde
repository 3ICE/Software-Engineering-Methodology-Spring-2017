import java.util.HashSet;

class Meta extends GameObject {
  InputManager inputManager;
  private String playerName;
  private boolean debugMode = true;

  public GameScene gameScene;

  Meta() {
    super();
    inputManager = new InputManager();
    gameObjects.add(inputManager);

    if (debugMode) {
      playerName = "DEBUG";
      gameScene = new GameScene(this);
      gameObjects.add(gameScene);
    } else {
      NameScreen nameScreen = new NameScreen();
      gameObjects.add(nameScreen);
    }
  }

  public boolean isDebugMode() {
    return debugMode;
  }

  public void onNameSubmit(String name) {
    playerName = name;
    gameObjects.remove(1);
    StoryDisplay storyDisplay = new StoryDisplay(playerName);
    gameObjects.add(storyDisplay);
  }

  public void onStoryFinished() {
    gameObjects.remove(1);
    GameScene gameScene = new GameScene(this);
    gameObjects.add(gameScene);
  }

  // Returns the player name.
  public String getPlayerName() {
    return playerName;
  }
}