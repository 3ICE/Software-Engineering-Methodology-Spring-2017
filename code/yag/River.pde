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

  River(int difficulty) {
    super();

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
      firstPartInfo = getRiverPartInfoForDifficulty(0);
    } else {
      firstPartInfo = getRiverPartInfoForDifficulty(currentDifficulty);
    }
    RiverPartInfo secondPartInfo = getRiverPartInfoForDifficulty(currentDifficulty);

    firstPart = new RiverPart(this, firstPartInfo, 0, width, height);
    secondPart = new RiverPart(this, secondPartInfo, -height, width, height);

    addChild(firstPart);
    addChild(secondPart);
  }

  RiverPartInfo getRiverPartInfoForDifficulty(int difficulty) {
    while (!infosByDifficulty.containsKey(difficulty)) {
      difficulty--;
    }
    ArrayList<RiverPartInfo> infos = infosByDifficulty.get(difficulty);
    return infos.get(rnd.nextInt(infos.size()));
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
        info = getRiverPartInfoForDifficulty(-1);
      } else {
        info = getRiverPartInfoForDifficulty(currentDifficulty);
      }

      secondPart = new RiverPart(this, info, -height + delta, width, height);
      addChild(secondPart);
    }
  }
}