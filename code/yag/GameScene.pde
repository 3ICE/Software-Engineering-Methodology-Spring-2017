import java.awt.event.KeyEvent;

class GameScene extends GameObject {
  Jet jet;
  Riverbank bank;
  Island island;

  int ENEMYCOUNT = 10;

  ArrayList<BaseEnemy> enemies = new ArrayList<BaseEnemy>();

  GameScene(Meta meta) {
    jet = new Jet();
    bank = new Riverbank(40,height*10);
    island = new Island();
    gameObjects.add(bank);
    gameObjects.add(island);
    
    for(int i = 0; i < ENEMYCOUNT; i++){
      BaseEnemy newEnemy = new BaseEnemy(meta);
      enemies.add(newEnemy);
      gameObjects.add(newEnemy);
    }
       
    gameObjects.add(jet);
    
  }

  void update(Meta meta) {
    super.update(meta);
    bank.detectCollision(jet);
  }
}