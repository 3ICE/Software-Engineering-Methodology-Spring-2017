/* This class is used to display the story in the beginning of the game. */
class StoryDisplay extends GameObject {

  int startTime = 0;
  int currentLine = 0;
  int frameDuration = 3000;

  // Here's the story, we could also load it from a file
  String[] storyLine = {
     "In a small town next to a big river,",
     "Fighter jets had for years been peacefully coexisting with the surrounding nature.",
     "They had adapted to the life of fisher-jets: they survived by fishing stray fuel barrels from the river.",
     "However, recently, the fuel supply was not what it had been before.",
     "It seemed to have diminished greatly. This was naturally a cause of concern,",
     "the jets did not really have any other sources of fuel.",
     "They suspected it may be the evil organization of Environmentalists behind this all,",
     "trying to make the poor jets die of starvation!",
     "It was clear this could not continue like this.",
     "Someone had to go and revive the ever flowing stream of barrels before it was too late.",
     "The nearby airport, long deserted, had to be opened again.",
     "And thus, it began: many young and brave jets set on their quest to replenish the source of life.",
     "If only they could get far enough upstream, the answers would be found, and their families saved..."
  };

  int storyLength = 13;

  StoryDisplay(String personalizedStoryName) {
    storyLine[0] = "In a small town next to a big river, lived, " + personalizedStoryName + ".";
  }

  public void update(Meta meta){
    // First draw
    if(startTime == 0){
      startTime = millis();
    }

    int currentTime = millis();

    currentLine = (currentTime - startTime) / frameDuration;
    if(currentLine >= storyLength){
      meta.onStoryFinished();
    }
  }

  void draw(Meta meta){
    textSize(16);
    fill(0);
    textAlign(CENTER);
    text(storyLine[currentLine], width / 2 - 150, height / 2 - 50, 300, 100);
  }

}