import java.awt.event.KeyEvent;

class GameScene extends GameObject {
  Jet jet;
  Riverbank bank;
  Island island;

  GameScene() {
    jet = new Jet();
    bank = new Riverbank(40,height*10);
    island = new Island();
  }

  void update(Meta meta) {
    bank.update(meta);
    island.update(meta);
    jet.update(meta);

    bank.detectCollision(jet);
  }
}