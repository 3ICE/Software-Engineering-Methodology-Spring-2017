import java.awt.event.KeyEvent;

class NameSubmitEvent extends Event {
  String name;
  NameSubmitEvent(String name) {
    super("nameSubmit");
    this.name = name;
  }
}

class NameScreen extends GameObject {
  private String name = "";

  void update() {
    super.update();

    if (meta.inputManager.getPressed(KeyEvent.VK_ENTER)) {
      meta.eventManager.dispatchEvent(new NameSubmitEvent(name));
    } else {
      if (meta.inputManager.getPressed(KeyEvent.VK_BACK_SPACE)) {
        if (name.length() > 0) {
          name = name.substring(0, name.length() - 1);
        }
      } else if (meta.inputManager.getPressed(KeyEvent.VK_DELETE)) {
        name = "";
      } else if (!meta.inputManager.getState(KeyEvent.VK_CONTROL) &&
                 !meta.inputManager.getState(KeyEvent.VK_ALT)) {
        name += meta.inputManager.getText();
      }
    }
  }

  void draw() {
    super.draw();

    textSize(16);
    fill(0);
    textAlign(CENTER);
    text("What's your name?", width / 2, height / 2);
    text(name, width / 2, height / 2 + 24);
  }
}