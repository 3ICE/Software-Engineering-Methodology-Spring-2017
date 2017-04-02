class ScoreDisplay extends GameObject{
  ScoreHandler scores;
  PVector position = new PVector(100, 100);
  PFont f;
  
  ScoreDisplay(ScoreHandler scoreHandler){
    f = createFont("Arial", 16);
    scores = scoreHandler;
  }
   void draw()
  {
    if(meta.inputManager.getState(KeyEvent.VK_Q)){
      super.draw();
      textFont(f);
      if(meta.gameScene.jet.fuel<500)
      {
        fill(255,0,0);
      }
      else{
        fill(0);
      }
      textAlign(RIGHT);
      text("Scores: \n" + scores.getScoreString(), position.x, position.y);
    }
  }
  
  
}