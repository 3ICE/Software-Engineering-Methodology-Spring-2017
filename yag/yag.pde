char c;
String name = "";

void setup() {
  size(640, 480);
  // DON'T Create the font
  //textFont(createFont("arial.ttf", 36));
}

void draw() {
  background(0); // Set background to black

  // Draw the letter to the center of the screen
  textSize(14);
  text("Click on the program, then type your name", 50, 50);
  text("Current key: " + c, 50, 70);
  text("Your name is " + name.length() +  " characters long", 50, 90);
  
  textSize(36);
  text(name, 50, 120, 540, 300);
}

void keyTyped() {
  // The variable "key" always contains the value 
  // of the most recent key pressed.
  if ((key >= 'A' && key <= 'z') ||(key >= '0' && key <= '9') || key == ' ') {
    c = key;
    name = name + key;
    // Write the letter to the console
    println(key);
  }
}