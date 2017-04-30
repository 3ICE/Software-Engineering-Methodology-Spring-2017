class RiverPart extends GameObject {
  RiverPartInfo info;
  float y;
  float pwidth;
  float pheight;
  ArrayList<RiverCollider> colliders;
  ArrayList<Entity> entities;
  River river;

  PImage img;

  RiverPart(River river, RiverPartInfo info, float y, float pwidth, float pheight) {
    super();
    img = loadImage("images/riverbank_1.png");

    this.river = river;
    this.y = y;

    entities = new ArrayList<Entity>();
    colliders = new ArrayList<RiverCollider>();

    for (PVector[] shape : info.shapes) {
      RiverCollider collider = new RiverCollider(shape, y, pwidth, pheight);
      colliders.add(collider);
      entities.add(collider);
    }

    for (RiverEntityInfo entityInfo : info.entities) {
      float entityX = entityInfo.position.x * pwidth;
      float entityY = y + entityInfo.position.y * pheight;
      PVector position = new PVector(entityX, entityY);
      Entity entity;
      switch (entityInfo.type) {
        case "fuel":
          entity = new Fuel(position);
          break;
        case "tanker":
          entity = new Tanker(position);
          break;
        case "helicopter":
          entity = new Helicopter(position);
          break;
        case "bridge":
          entity = new Bridge(position);
          break;
        case "jet":
          entity = new EnemyJet(position);
          break;
        default:
          entity = new Entity(position);
          break;
      }
      entities.add(entity);
    }
  }

  void onAdd() {
    for (Entity entity : entities) {
      addChild(entity);
    }
  }

  void update() {
    y += river.speed;
    for (Entity entity : entities) {
      entity.velocity.y = river.speed;
    }
    super.update();
  }

  void draw()
  {
    super.draw(); //<>//
    image(img, 0, floor(y));
    pushMatrix();
    scale(-1.0, 1.0);
    image(img,-width, floor(y));
    popMatrix();
  }
}