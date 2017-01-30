// Are these really supposed to be global (*crying*)
char c;
String name = "";
boolean displayNameInput = true;
Jet j1;
Riverbank bank;
Island island;
StoryDisplay storyDisplay;

void setup() {
  size(640, 480, P2D); //We have to use a renderer
  j1 = new Jet();
  bank = new Riverbank(40,height*10);
  storyDisplay = new StoryDisplay();
  island = new Island();
  // DON'T Create the font
  //textFont(createFont("arial.ttf", 36));
}

void draw() {
  
  
  background(120,229,229); // Set background to ugly teal, actually it is the river
  // draw the bank
  bank.display();
  bank.update();
  bank.detectCollision(j1);
  // draw the Island
  island.update();
  island.display();
  // draw the Jet
  j1.update();
  j1.display();
  j1.checkEdges();
  if(displayNameInput){
    // Draw the letter to the center of the screen
    textSize(14);
    fill(255);
    text("Click on the program, then type your name", 50, 50);
    text("Current key: " + c, 50, 70);
    text("Your name is " + name.length() +  " characters long", 50, 90);
  }
  if(storyDisplay.visible){
    storyDisplay.update();
    storyDisplay.display();
  }
  textSize(36);
  text(name, 50, 120, 540, 300);
}

void keyTyped() {
  // The variable "key" always contains the value 
  // of the most recent key pressed.
  if(displayNameInput){
    if ((key >= 'A' && key <= 'z') ||(key >= '0' && key <= '9') || key == ' ') {
      c = key;
      name = name + key;
      // Write the letter to the console
      println(key);
    }
  }
}

void keyPressed(){
  if(key == ENTER || key == RETURN){
    // if the input was on, it's story time
    if(displayNameInput){
      storyDisplay.visible = true; 
    }
    displayNameInput = false;
  }
  
  if(keyCode == UP)
  {
    j1.accelerate();
  }
  else if(keyCode == DOWN)
  {
    j1.decelerate();
  }
  else if(keyCode == LEFT)
  {
    j1.moveLeft();
  }
  else if(keyCode == RIGHT)
  {
    j1.moveRight();
  }
}

void keyReleased() {
  if(keyCode == UP || keyCode == DOWN)
  {
    j1.resetY();
  }
  else if (keyCode == LEFT || keyCode == RIGHT)
  {
    j1.resetX();
  }
}