import java.awt.event.KeyEvent;

class NameScreen extends GameObject {
  private String name = "";

  NameScreen() {}

  void update(Meta meta) {
    if (meta.getPressed(KeyEvent.VK_ENTER)) {
      meta.onNameSubmit(name);
    } else {
      if (meta.getPressed(KeyEvent.VK_BACK_SPACE)) {
        if (name.length() > 0) {
          name = name.substring(0, name.length() - 1);
        }
      } else if (meta.getPressed(KeyEvent.VK_DELETE)) {
        name = "";
      } else if (!meta.getState(KeyEvent.VK_CONTROL) &&
                 !meta.getState(KeyEvent.VK_ALT)) {
        name += meta.getText();
      }

      textSize(16);
      fill(0);
      textAlign(CENTER);
      text("What's your name?", width / 2, height / 2);
      text(name, width / 2, height / 2 + 24);
    }
  }
}