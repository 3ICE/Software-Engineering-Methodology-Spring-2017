class GameObject
{
  String collisionType;
  ArrayList<GameObject> gameObjects;

  GameObject() {
    this("object");
  }

  GameObject(String collisionType) {
    this.collisionType = collisionType;
    gameObjects = new ArrayList<GameObject>();
  }

  public ArrayList<GameObject> getAllChildren() {
    ArrayList<GameObject> children = new ArrayList<GameObject>(gameObjects);
    for (GameObject object : gameObjects) {
      children.addAll(object.getAllChildren());
    }
    return children;
  }

  public PVector[] getCollisionMask() {
    return new PVector[0];
  }

  public boolean collidesWith(Meta meta, String otherType) {
    PVector[] collisionMask = getCollisionMask();
    for (GameObject other : meta.getAllChildren()) {
      if (other.collisionType == otherType) {
        PVector[] otherCollisionMask = other.getCollisionMask();
        if (Collision.polyPoly(collisionMask, otherCollisionMask)) {
          return true;
        }
      }
    }
    return false;
  }

  public void update(Meta meta) {
    for (GameObject gameObject : gameObjects) {
      gameObject.update(meta);
    }
  }

  public void afterUpdate(Meta meta) {
    for (GameObject gameObject : gameObjects) {
      gameObject.afterUpdate(meta);
    }
  }

  public void draw(Meta meta) {
    for (GameObject gameObject : gameObjects) {
      gameObject.draw(meta);
    }
  }

  public void debugDraw(Meta meta) {
    for (GameObject gameObject : gameObjects) {
      gameObject.debugDraw(meta);
    }

    PShape shape = createShape();
    shape.beginShape();
    shape.fill(color(255, 0, 0, 127));
    shape.stroke(color(255, 0, 0, 200));
    shape.strokeWeight(2);
    for (PVector vector : getCollisionMask()) {
      shape.vertex(vector.x, vector.y);
    }
    shape.endShape(CLOSE);
    shape(shape);
  }
}