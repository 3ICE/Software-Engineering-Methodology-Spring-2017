import java.util.HashSet;

class InputManager extends GameObject {
  private HashSet<Integer> state;
  private HashSet<Integer> pressed;
  private ArrayList<Character> chars;

  InputManager() {
    super();

    state = new HashSet<Integer>();
    pressed = new HashSet<Integer>();
    chars = new ArrayList<Character>();
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

  public void afterUpdate(Meta meta) {
    super.afterUpdate(meta);
    
    // Clears the last frame buffer.
    pressed.clear();
    chars.clear();
  }
}