class RiverCollider extends Entity {
  String collisionType = "collider";
  PVector[] shape;
  float rwidth;
  float rheight;

  RiverCollider(PVector[] shape, float y, float rwidth, float rheight) {
    super("collider", new PVector(0, y));

    this.shape = shape;
    this.rwidth = rwidth;
    this.rheight = rheight;
  }

  public PVector[] getCollisionMask() {
    PVector[] mask = new PVector[this.shape.length];
    for (int i = 0; i < this.shape.length; i++) {
      PVector vector = this.shape[i];
      mask[i] = new PVector(vector.x * this.rwidth, position.y + vector.y * this.rheight);
    }
    return mask;
  }
}