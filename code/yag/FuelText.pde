class FuelText extends GameObject
{
  PFont f;
  Jet j1;
  PVector position;

  // constructor
  FuelText(Jet j)
  {
    f = createFont("Arial", 16);
    j1 = j;
    position = new PVector(width-50, 20);
  }

  // show the jet in the background
  void draw(Meta meta)
  {
    super.draw(meta);
    textFont(f);
    if(j1.fuel<500)
    {
      fill(255,0,0);
    }
    else{
      fill(0);
    }
    textAlign(RIGHT);
    text("Fuel:"+j1.fuel, position.x, position.y);
  }
}