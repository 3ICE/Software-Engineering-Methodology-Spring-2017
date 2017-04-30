class Tanker extends Enemy {
  Tanker(PVector position) {
    super(1, position, loadImage("images/tanker_placeholder.png"));
    scoreValue = 30;
    firingSpeedCooldown=1000;
  }
}