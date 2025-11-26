class Explosion {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan; //from proccessing examples https://processing.org/examples/multipleparticlesystems.html

  color g;

  Explosion () {

    location = new PVector(mouseX, mouseY);
    velocity = new PVector (random(-10, 10), random(-10, 10));
    acceleration = new PVector (0, 0.5);
    lifespan = 100;
    g = 234;
  }


  void drawExplo() {

    noStroke();
    fill(250, g, 150, lifespan); //from proccessing examples https://processing.org/examples/multipleparticlesystems.html
    ellipse(location.x, location.y, 10, 10);

    g -= 5;
    lifespan -= 10; //from proccessing examples https://processing.org/examples/multipleparticlesystems.html
  }

  void moveExplo() {
    velocity.add(acceleration);
    location.add(velocity);
  }

  boolean isDead() { //from proccessing examples https://processing.org/examples/multipleparticlesystems.html
    return (lifespan < 0); //from proccessing examples https://processing.org/examples/multipleparticlesystems.html
  }
}
