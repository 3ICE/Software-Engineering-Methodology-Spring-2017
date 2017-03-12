class Bridge extends Enemy {
  Bridge(PVector position) {
    super(0, position, loadImage("images/bridge_placeholder.png"));
    scoreValue = 100;
  }
}