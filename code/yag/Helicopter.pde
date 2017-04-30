class Helicopter extends Enemy {
  Helicopter(PVector position) {
    super(3, position, loadImage("images/helicopter_placeholder.png"));
    scoreValue = 60;
    firingSpeedCooldown=600;
  }
}