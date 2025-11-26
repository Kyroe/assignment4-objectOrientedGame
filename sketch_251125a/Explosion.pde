class Explosion {

  PVector location;
  PVector velocity;
  PVector acceleration;

  color g;
  color a;

  Explosion () {

    location = new PVector(mouseX, mouseY);
    velocity = new PVector (random(-10, 10), random(-10, 10));
    acceleration = new PVector (0, 0.5);

    
  }


  void drawExplo() {
    color g = 234;
    color a = 255;

    fill(250, g, 150, a);
    ellipse(location.x, location.y, 10, 10);

    g -= 5;
    a -= 10;
  }

  void moveExplo() {
    velocity.add(acceleration);
    location.add(velocity);
  }
  
}
