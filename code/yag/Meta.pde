import java.util.HashSet;

class Meta extends GameObject {
  InputManager inputManager;
  private String playerName;

  PImage helicopterImage;
  PImage tempImage;
  
  Meta() {
    super();
    inputManager = new InputManager();
    gameObjects.add(inputManager);
    NameScreen nameScreen = new NameScreen();
    gameObjects.add(nameScreen);
  }

  public void loadImages(){
    helicopterImage = loadImage("images/helicopter_placeholder.png");
    tempImage = loadImage("images/placeholder_placeholder.png");
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