import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class yag extends PApplet {

char c;
String name = "";

Jet j1;

public void setup() {
  
  j1 = new Jet();
  // DON'T Create the font
  //textFont(createFont("arial.ttf", 36));
}

public void draw() {
  background(120,229,229); // Set background to black
  j1.display();
  // Draw the letter to the center of the screen
  textSize(14);
  text("Click on the program, then type your name", 50, 50);
  text("Current key: " + c, 50, 70);
  text("Your name is " + name.length() +  " characters long", 50, 90);

  textSize(36);
  text(name, 50, 120, 540, 300);
}

public void keyTyped() {
  // The variable "key" always contains the value
  // of the most recent key pressed.
  if ((key >= 'A' && key <= 'z') ||(key >= '0' && key <= '9') || key == ' ') {
    c = key;
    name = name + key;
    // Write the letter to the console
    println(key);
  }
}
class Jet
{
  PShape s;
  float x,y;
  Jet()
  {
    x = 320;
    y = 420;
    s = createShape();
    s.beginShape();
    // You can set fill and stroke
    s.fill(102);
    s.stroke(255);
    s.strokeWeight(2);
    // Here, we are hardcoding a series of vertices
    s.vertex(0, -50);
    //s.vertex(14, -20);
    //s.vertex(47, -15);
    //s.vertex(23, 7);
    s.vertex(29, 40);
    s.vertex(0, 25);
    s.vertex(-29, 40);
    //s.vertex(-23, 7);
    //s.vertex(-47, -15);
    //s.vertex(-14, -20);
    s.endShape(CLOSE);
  }
  public void display()
  {
    pushMatrix();
    translate(x,y);
    shape(s);
    popMatrix();
  }
  public void Shoot(){}
}
  public void settings() {  size(640, 480, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "yag" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
