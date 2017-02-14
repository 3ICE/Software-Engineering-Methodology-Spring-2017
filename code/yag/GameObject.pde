class GameObject
{
  ArrayList<GameObject> gameObjects;

  GameObject() {
    gameObjects = new ArrayList<GameObject>();
  }

  void update(Meta meta) {
    for (GameObject gameObject : gameObjects) {
      gameObject.update(meta);
    }
  }

  void afterUpdate(Meta meta) {
    for (GameObject gameObject : gameObjects) {
      gameObject.afterUpdate(meta);
    }
  }

  void draw(Meta meta) {
    for (GameObject gameObject : gameObjects) {
      gameObject.draw(meta);
    }
  }
}