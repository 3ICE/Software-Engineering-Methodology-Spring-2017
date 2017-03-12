import java.util.concurrent.Callable;

Meta meta;

void setup() {
  size(640, 480, P2D); //We have to use a renderer
  meta = new Meta();
}

void draw() {
  background(120, 229, 229); // Set background to ugly teal, actually it is the river

  meta.update(meta);
  meta.afterUpdate(meta);
  meta.draw(meta);
}

void keyPressed() {
  meta.inputManager.setPressed(keyCode, key);
}

void keyReleased() {
  meta.inputManager.setReleased(keyCode);
}