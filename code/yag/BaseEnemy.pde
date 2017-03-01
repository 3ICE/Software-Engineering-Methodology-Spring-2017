enum EnemyType{
  TANKER,
  HELICOPTER,
  FUELDEPOT,
  JET,
  BRIDGE
}

int ENEMYTYPES_SIZE = 5;

// The base for all enemies
// No inheritance for this for now for easier randomization
class BaseEnemy extends RiverObject{

  EnemyType type;
  PImage enemyPicture;
  
  BaseEnemy(Meta meta)
  {
    refresh(meta);
  }

  void draw(Meta meta)
  {
    super.draw(meta);
    image(enemyPicture, location.x, location.y);
  }

  void initTanker(Meta meta){
    velocity = new PVector(1,1);
    enemyPicture = meta.tempImage;
  }
  
  void initHelicopter(Meta meta){
    velocity = new PVector(3,1);
    enemyPicture = meta.helicopterImage;
  }
  
  void initJet(Meta meta){
    velocity = new PVector(5,1);
    enemyPicture = meta.tempImage;
  }
  
  void initFuelDepot(Meta meta){
    velocity = new PVector(0,1);
    enemyPicture = meta.tempImage;
  }
  
  void initBridge(Meta meta){
    velocity = new PVector(0,1);
    enemyPicture = meta.tempImage;
  }

  // We shall come out as a completely new person, uhh, jet.
  void refresh(Meta meta){
    // Beautifully randomize type...
    type = EnemyType.values()[((int)random(ENEMYTYPES_SIZE))];
    switch (type){
     case TANKER:
       initTanker(meta);
       break;
     case HELICOPTER:
       initHelicopter(meta);
       break;
     case FUELDEPOT:
       initFuelDepot(meta);
       break;  
     case JET:
       initJet(meta);
       break;
     case BRIDGE:
       initBridge(meta);
       break; 
      default:
       velocity = new PVector(0,1);
       enemyPicture = meta.tempImage;
       break;
    }
    
    size = new PVector(100, 100);
    location = new PVector(random(width), -random(height * 3) - size.y);
  }

  void update(Meta meta)
  {
    super.update(meta);

    if(location.y >= height + size.y/2)
    {
      refresh(meta);
    }
    // We are on the side: reverse x-velocity
    // (if we have none, it doesn't matter)
    if(location.x < 0 || location.x > width - size.x * 0.5f){
      velocity.x = -velocity.x;
    }
  } 
  
}