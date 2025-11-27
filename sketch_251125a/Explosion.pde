class Explosion {
//creates an "explosion" whenever, the player clicks
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan; //from proccessing examples https://processing.org/examples/multipleparticlesystems.html

  color g;

  Explosion (PVector tempV) { //initialize PVectors and other variables

    location = tempV.copy(); //variable from ExplosionSystem passes through here
    velocity = new PVector (random(-10, 10), random(-10, 10));
    acceleration = new PVector (0, 0.5);
    lifespan = 255;
    g = 234;
  }


  void drawExplo() { //draws the individual particles
    noStroke();
    fill(250, g, 150, lifespan); //from proccessing examples https://processing.org/examples/multipleparticlesystems.html
    ellipse(location.x, location.y, 10, 10);

    g -= 5; //changes the hue of the particle to look like a real explosion
    //controls the time the paricles spend on the screen 
    lifespan -= 15; //from proccessing examples https://processing.org/examples/multipleparticlesystems.html
  }

  void moveExplo() { 
    velocity.add(acceleration);
    location.add(velocity);
  }
//checks for lifespan
  boolean isDead() { //from proccessing examples https://processing.org/examples/multipleparticlesystems.html
    return (lifespan < 0); //from proccessing examples https://processing.org/examples/multipleparticlesystems.html
  }
}
