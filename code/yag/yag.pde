// Are these really supposed to be global (*crying*)
char c;
String name = "";
boolean displayNameInput = true;
Jet j1;
Riverbank rightBank;
StoryDisplay storyDisplay;

void setup() {
  size(640, 480, P2D); //We have to use a renderer
  j1 = new Jet();
  rightBank = new Riverbank(40,height);
  storyDisplay = new StoryDisplay();
  // DON'T Create the font
  //textFont(createFont("arial.ttf", 36));
}

void draw() {
  
  
  background(120,229,229); // Set background to ugly teal
  rightBank.display();
  rightBank.detectCollision(j1);
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
    j1.speedUp();
  }
  else if(keyCode == DOWN)
  {
    j1.slowDown();
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
  if(keyCode == UP)
  {
    j1.slowDown();
  }
  else if(keyCode == DOWN)
  {
    j1.speedUp();
  }
  else if (keyCode == LEFT || keyCode == RIGHT)
  {
    j1.reset();
  }
}