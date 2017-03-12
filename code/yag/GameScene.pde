import java.awt.event.KeyEvent;

class GameScene extends GameObject {
  Jet jet;
  FuelText fuelText;

  GameScene(Meta meta) {
    super();
    River river = new River();
    jet = new Jet();
    fuelText = new FuelText(jet);
    gameObjects.add(fuelText);
    gameObjects.add(river);
    gameObjects.add(jet);
  }

  void update(Meta meta) {
    super.update(meta);
  }
}