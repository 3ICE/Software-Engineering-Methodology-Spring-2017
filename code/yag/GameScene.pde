import java.awt.event.KeyEvent;

class GameScene extends GameObject {
  Jet jet;
  Riverbank bank;
  Island island;

  GameScene() {
    jet = new Jet();
    bank = new Riverbank(40,height*10);
    island = new Island();
    gameObjects.add(bank);
    gameObjects.add(island);
    gameObjects.add(jet);
  }

  void update(Meta meta) {
    super.update(meta);

    bank.detectCollision(jet);
  }
}