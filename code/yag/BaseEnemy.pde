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
  int r;
  int g;
  int b;
  
  BaseEnemy()
  {
    refresh();
  }

  void draw(Meta meta)
  {
    super.draw(meta);
    fill(255,127,6);
    noStroke();
    rect(location.x,location.y,size.x,size.y,15);
  }

  void initTanker(){
    velocity = new PVector(1,1);
  }
  
  void initHelicopter(){
    velocity = new PVector(3,1);
  }
  
  void initJet(){
    velocity = new PVector(5,1);
  }
  
  void initFuelDepot(){
    velocity = new PVector(0,1);
  }
  
  void initBridge(){
    velocity = new PVector(0,1);
  }

  // We shall come out as a completely new person, uhh, jet.
  void refresh(){
    // Beautifully randomize type...
    type = EnemyType.values()[((int)random(ENEMYTYPES_SIZE))];
    switch (type){
     case TANKER:
       initTanker();
       break;
     case HELICOPTER:
       initHelicopter();
       break;
     case FUELDEPOT:
       initFuelDepot();
       break;  
     case JET:
       initJet();
       break;
     case BRIDGE:
       initBridge();
       break; 
      default:
       velocity = new PVector(0,1);
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
      refresh();
    }
    // We are on the side: reverse x-velocity
    // (if we have none, it doesn't matter)
    if(location.x < 0 || location.x > width - size.x * 0.5f){
      velocity.x = -velocity.x;
    }
  } 
  
}