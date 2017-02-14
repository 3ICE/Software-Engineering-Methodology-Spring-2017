import java.util.HashSet;

class Meta extends GameObject {
  InputManager inputManager;
  private String playerName;

  Meta() {
    super();
    inputManager = new InputManager();
    gameObjects.add(inputManager);
    NameScreen nameScreen = new NameScreen();
    gameObjects.add(nameScreen);
  }

  public void onNameSubmit(String name) {
    playerName = name;
    gameObjects.remove(1);
    StoryDisplay storyDisplay = new StoryDisplay();
    gameObjects.add(storyDisplay);
  }

  public void onStoryFinished() {
    gameObjects.remove(1);
    GameScene gameScene = new GameScene();
    gameObjects.add(gameScene);
  }

  // Returns the player name.
  public String getPlayerName() {
    return playerName;
  }
}