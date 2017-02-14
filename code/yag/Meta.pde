import java.util.HashSet;

class Meta {
  private HashSet<Integer> state = new HashSet<Integer>();
  private HashSet<Integer> pressed = new HashSet<Integer>();
  private ArrayList<Character> chars = new ArrayList<Character>();
  ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
  private String playerName;

  Meta() {
    NameScreen nameScreen = new NameScreen();
    gameObjects.add(nameScreen);
  }

  public void onNameSubmit(String name) {
    playerName = name;
    gameObjects.clear();
    StoryDisplay storyDisplay = new StoryDisplay();
    gameObjects.add(storyDisplay);
  }

  public void onStoryFinished() {
    gameObjects.clear();
    GameScene gameScene = new GameScene();
    gameObjects.add(gameScene);
  }

  // Returns the player name.
  public String getPlayerName() {
    return playerName;
  }

  // Returns whether a key is being pressed.
  public boolean getState(int keyCode) {
    return state.contains(keyCode);
  }

  // Returns whether a key has been pressed during the last frame.
  public boolean getPressed(int keyCode) {
    return pressed.contains(keyCode);
  }

  // Returns the text that has been typed during the last frame.
  public String getText() {
    String text = "";
    for (char c : chars) {
      // Filter out invalid characters.
      if ((int) c != 65535) {
        text += c;
      }
    }
    return text;
  }

  // Sets a key as pressed during the last frame.
  public void setPressed(int keyCode, char key) {
    state.add(keyCode);
    pressed.add(keyCode);
    chars.add(key);
  }

  // Releases a key from being pressed.
  public void setReleased(int keyCode) {
    state.remove(new Integer(keyCode));
  }

  public void update() {
    for (GameObject gameObject : gameObjects) {
      gameObject.update(this);
    }

    // Clears the last frame buffer.
    pressed.clear();
    chars.clear();
  }
}