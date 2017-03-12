import java.util.HashSet;

class Meta extends GameObject {
  InputManager inputManager;
  private String playerName;
  private boolean debugMode = true;

  PImage helicopterImage;
  PImage tempImage;
  PImage bridgeImage;
  PImage fuelImage;
  PImage jetImage;
  PImage tankerImage;

  Meta() {
    super();
    inputManager = new InputManager();
    gameObjects.add(inputManager);

    loadImages();

    if (debugMode) {
      playerName = "DEBUG";
      GameScene gameScene = new GameScene(this);
      gameObjects.add(gameScene);
    } else {
      NameScreen nameScreen = new NameScreen();
      gameObjects.add(nameScreen);
    }
  }

  private void loadImages(){
    helicopterImage = loadImage("images/helicopter_placeholder.png");
    tempImage = loadImage("images/placeholder_placeholder.png");
    bridgeImage = loadImage("images/bridge_placeholder.png");
    fuelImage = loadImage("images/fuel_placeholder.png");
    jetImage = loadImage("images/jet_placeholder.png");
    tankerImage = loadImage("images/tanker_placeholder.png");
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