class RiverPartInfo {
  String type;
  int tile;
  int difficulty;
  ArrayList<PVector[]> shapes;
  ArrayList<RiverEntityInfo> entities;

  RiverPartInfo(int tile, int difficulty, ArrayList<PVector[]> shapes,
                ArrayList<RiverEntityInfo> entities) {
    super();

    this.tile = tile;
    this.difficulty = difficulty;
    this.shapes = shapes;
    this.entities = entities;
  }
}