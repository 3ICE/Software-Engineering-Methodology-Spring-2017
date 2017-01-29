/* This class is used to display the story in the beginning of the game. */
class StoryDisplay{
  
  // This should only be visible after the name has been input and before the whole
  // story has been displayed
  boolean visible = false;
  
  int startTime = 0;
  int currentLine = 0;
  int frameDuration = 3000;
  
  // Here's the story, we could also load it from a file
  String[] storyLine = {
     "In a small town next to a big river,",
     "fighter jets had for years been living peacefully in coexistence with the surrounding nature.",
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
  
  StoryDisplay(){
      
  }
  
  void update(){
    // First draw
    if(startTime == 0){
      startTime = millis();
    }
    
    int currentTime = millis();
    
    currentLine = (currentTime - startTime) / frameDuration;
    if(currentLine >= storyLength){
       visible = false; 
    }
  }
  
  void display(){
    if(visible){
      textSize(14);
      fill(255); // updated by Mengyang, otherwise overrided by other color
      text(storyLine[currentLine], 50, 50, 300, 100);
    }
  }
  
}