class RiverPart extends GameObject {
  RiverPartInfo info;
  float y;
  float pwidth;
  float pheight;
  ArrayList<RiverCollider> colliders;
  ArrayList<Entity> entities;

  RiverPart(RiverPartInfo info, float y, float pwidth, float pheight) {
    super();

    this.y = y;

    entities = new ArrayList<Entity>();
    colliders = new ArrayList<RiverCollider>();

    for (PVector[] shape : info.shapes) {
      RiverCollider collider = new RiverCollider(shape, y, pwidth, pheight);
      gameObjects.add(collider);
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
        default:
          entity = new Entity(position);
          break;
      }
      entities.add(entity);
      gameObjects.add(entity);
    }
  }

  void update(Meta meta) {
    float speed = 1;
    y += speed;
    for (Entity entity : entities) {
      entity.velocity.y = speed;
    }
    super.update(meta);
  }
}