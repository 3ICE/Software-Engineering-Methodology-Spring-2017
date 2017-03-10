import java.awt.event.KeyEvent;

class GameScene extends GameObject {
  Jet jet;
  Riverbank bank;
  Island island;
  FuelText fuelText;

  int ENEMYCOUNT = 10;

  ArrayList<BaseEnemy> enemies = new ArrayList<BaseEnemy>();

  GameScene(Meta meta) {
    jet = new Jet();
    bank = new Riverbank(40,height*10);
    island = new Island();
    fuelText = new FuelText(jet);
    gameObjects.add(bank);
    gameObjects.add(island);
    gameObjects.add(fuelText);
    
    for(int i = 0; i < ENEMYCOUNT; i++){
      BaseEnemy newEnemy = new BaseEnemy(meta,jet);
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