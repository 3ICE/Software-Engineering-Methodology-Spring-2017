class FuelText extends RiverObject
{
  PFont f;
  Jet j1;
  // constructor
  FuelText(Jet j)
  {
    f = createFont("Arial", 16);
    j1 = j;
    velocity = new PVector(0,0);
    location = new PVector(width-50,20);
  }
  
  //
  void update(Meta meta) {
    super.update(meta);
  }

  // show the jet in the background
  void draw(Meta meta)
  {
    super.draw(meta);
    textFont(f);
    if(j1.fuel<1000)
    {
      fill(255,0,0);
    }
    else{
      fill(0);
    }
    textAlign(RIGHT);
    text("Fuel:"+j1.fuel, location.x, location.y);
  }
  
}