import java.util.Random;

class River extends GameObject {
  ArrayList<RiverPartInfo> infos;
  Random rnd;

  River() {
    super();

    rnd = new Random();

    RiverLoader loader = new RiverLoader();
    infos = loader.load("river.json");

    RiverPart firstPart = new RiverPart(infos.get(0), 0, width, height);
    RiverPart secondPart = new RiverPart(infos.get(1 + rnd.nextInt(2)), -height, width, height);

    gameObjects.add(firstPart);
    gameObjects.add(secondPart);
  }

  void update(Meta meta) {
    super.update(meta);

    RiverPart firstPart = (RiverPart)gameObjects.get(0);
    if (firstPart.y > height) {
      float delta = firstPart.y - height;
      gameObjects.remove(0);
      RiverPart secondPart = new RiverPart(infos.get(1 + rnd.nextInt(2)), -height + delta, width, height);
      gameObjects.add(secondPart);
    }
  }
}