class EnemyJet extends Enemy {
  EnemyJet(PVector position) {
    super(5, position, loadImage("images/jet_placeholder.png"));
    scoreValue = 100;
    firingSpeedCooldown=300;
  }
}