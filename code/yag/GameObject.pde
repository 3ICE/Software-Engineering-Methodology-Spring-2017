class GameObject
{
  String collisionType;
  GameObject parent;
  Meta meta;
  ArrayList<GameObject> gameObjects;
  boolean removeScheduled = false;

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

  public boolean collidesWith(String otherType) {
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

  public void update() {
    for (GameObject gameObject : gameObjects) {
      gameObject.update();
    }
  }

  public void afterUpdate() {
    ArrayList<GameObject> toRemove = new ArrayList<GameObject>();
    for (GameObject gameObject : gameObjects) {
      gameObject.afterUpdate();
    }
    for (GameObject gameObject : gameObjects) {
      if (gameObject.removeScheduled) {
        toRemove.add(gameObject);
      }
    }
    for (GameObject gameObject : toRemove) {
      removeChild(gameObject);
    }
  }

  public void draw() {
    for (GameObject gameObject : gameObjects) {
      gameObject.draw();
    }
  }

  public void debugDraw() {
    for (GameObject gameObject : gameObjects) {
      gameObject.debugDraw();
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

  void _onAdd(Meta meta, GameObject parent) {
    this.parent = parent;
    this.meta = meta;
  }

  void onAdd() {
  }

  void onRemove() {
  }

  void addChild(GameObject child) {
    child._onAdd(meta, this);
    child.onAdd();
    gameObjects.add(child);
  }

  void removeChild(GameObject child) {
    child.onRemove();
    gameObjects.remove(child);
  }

  void removeSelf() {
    removeScheduled = true;
  }
}