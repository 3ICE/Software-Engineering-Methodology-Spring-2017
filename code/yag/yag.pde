import java.util.concurrent.Callable;

Meta meta;

void setup() {
  size(640, 480, P2D); //We have to use a renderer
  meta = new Meta();
  meta._onAdd(meta, new GameObject());
  meta.onAdd();
}

void draw() {
  background(120, 229, 229); // Set background to ugly teal, actually it is the river

  meta.update();
  meta.afterUpdate();
  meta.draw();
  if (meta.isDebugMode()) {
    meta.debugDraw();
  }
}

void keyPressed() {
  meta.inputManager.setPressed(keyCode, key);
}

void keyReleased() {
  meta.inputManager.setReleased(keyCode);
}