class RiverPartInfo {
  String type;
  int difficulty;
  ArrayList<PVector[]> shapes;
  ArrayList<RiverEntityInfo> entities;

  RiverPartInfo(int difficulty, ArrayList<PVector[]> shapes,
                ArrayList<RiverEntityInfo> entities) {
    super();

    this.difficulty = difficulty;
    this.shapes = shapes;
    this.entities = entities;
  }
}