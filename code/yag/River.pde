import java.util.Random;

class River extends GameObject {
  HashMap<Integer, ArrayList<RiverPartInfo>> infosByDifficulty;
  Random rnd;
  int currentDifficulty;
  int currentStage;
  RiverPart firstPart;
  RiverPart secondPart;
  float speed = 2;
  float acceleration = .1;
  PImage riverbank1;
  PImage riverbank2;
  PImage riverbank3;
  PImage riverbank4;
  PImage riverbank5;
  PImage island1;

  River(int difficulty) {
    super();

    riverbank1 = loadImage("images/riverbank_1.png");
    riverbank2 = loadImage("images/riverbank_2.png");
    riverbank3 = loadImage("images/riverbank_3.png");
    riverbank4 = loadImage("images/riverbank_4.png");
    riverbank5 = loadImage("images/riverbank_5.png");
    island1 = loadImage("images/island_1.png");

    rnd = new Random();

    RiverLoader loader = new RiverLoader();
    ArrayList<RiverPartInfo> infos = loader.load("river.json");
    infosByDifficulty = new HashMap<Integer, ArrayList<RiverPartInfo>>();

    for (RiverPartInfo info : infos) {
      if (!infosByDifficulty.containsKey(info.difficulty)) {
        infosByDifficulty.put(info.difficulty, new ArrayList<RiverPartInfo>());
      }
      infosByDifficulty.get(info.difficulty).add(info);
    }

    currentDifficulty = difficulty;
  }

  void onAdd() {
    init();
  }

  void init() {
    currentStage = 1;

    RiverPartInfo firstPartInfo;
    if (currentDifficulty == 1) {
      firstPartInfo = getRiverPartInfoForDifficulty(0, -1);
    } else {
      firstPartInfo = getRiverPartInfoForDifficulty(currentDifficulty, -1);
    }
    RiverPartInfo secondPartInfo = getRiverPartInfoForDifficulty(currentDifficulty, -1);

    firstPart = new RiverPart(this, firstPartInfo, 0, width, height);
    secondPart = new RiverPart(this, secondPartInfo, -height, width, height);

    addChild(firstPart);
    addChild(secondPart);
  }

  RiverPartInfo getRiverPartInfoForDifficulty(int difficulty, int tile) {
    while (!infosByDifficulty.containsKey(difficulty)) {
      difficulty--;
    }
    ArrayList<RiverPartInfo> infos = infosByDifficulty.get(difficulty);
    ArrayList<RiverPartInfo> selection;
    if (tile == -1) {
      selection = new ArrayList<RiverPartInfo>();
      for (RiverPartInfo info : infos) {
        if (info.tile != 2) {
          selection.add(info);
        }
      }
    } else {
      selection = new ArrayList<RiverPartInfo>();
      for (RiverPartInfo info : infos) {
        if (info.tile == tile) {
          selection.add(info);
        }
      }
    }
    return selection.get(rnd.nextInt(selection.size()));
  }

  void resetToDifficulty(int difficulty) {
    currentDifficulty = difficulty;
    removeChild(firstPart);
    removeChild(secondPart);
    init();
  }

  void update() {
    super.update();

    if (meta.inputManager.getState(KeyEvent.VK_UP)) {
      speed = min(10, speed + acceleration);
    } else if (meta.inputManager.getState(KeyEvent.VK_DOWN)) {
      speed = max(2, speed - acceleration);
    }

    if (firstPart.y > height) {
      float delta = firstPart.y - height;
      removeChild(firstPart);
      firstPart = secondPart;
      currentStage++;

      RiverPartInfo info;
      if (currentStage > 10) {
        currentStage = 0;
        currentDifficulty++;
        info = getRiverPartInfoForDifficulty(currentDifficulty, 2);
      } else {
        info = getRiverPartInfoForDifficulty(currentDifficulty, -1);
      }

      secondPart = new RiverPart(this, info, -height + delta, width, height);
      addChild(secondPart);
    }
  }
}