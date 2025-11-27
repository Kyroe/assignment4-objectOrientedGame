class Star {
  //draw stars at random locations and "distances" in the background
  PVector location;
  PVector velocity;
  float a;
  
  Star () {
    
    location = new PVector(random(0, width), random(0, height));
   // velocity = new PVector(0.1 - (, -0.1);
    a = random(50, 255);
  }
  
  void drawStar() {
    
    fill(234,229, 187, a);
    ellipse(location.x, location.y , 7,7);
  }
  

}
