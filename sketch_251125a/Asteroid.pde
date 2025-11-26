class Asteroid {
  float w;
  float n;
  float m;
  float xMove = 0;
  float yMove = 0;
  float t = 1;
  float tempMove;
  float centreX;
  float centreY;


  Asteroid() {
    w = random(150, 450);
    tempMove = random(0.5, 5);
  }

  void drawAster() {
    centreX = w - xMove;
    centreY = (m + yMove) - 100;
    fill(255);
    ellipse(centreX, centreY, 80, 80);
  }

  void moveAster() {
    n = noise(t);
    m = map(n, 0, 1, 0, 60);
    t += 0.01;
    xMove += 1;
    yMove += tempMove;
  }

  boolean offScreen () {
    if (centreX + 80 < width +20 && centreY - 80 > height + 20) {
      return true;
    } else {
      return false;
    }
  }

  boolean isHit() {
    if (mouseX > centreX - 40 && mouseX < centreX + 40 && mouseY > centreY - 40 && mouseY < centreY + 40 && mousePressed) {
      return true;
    } else {
      return false;
    }
  }


  void hitbox () {
    stroke(255);
    fill(0, 0, 0, 0);
    rectMode(CENTER);
    rect(centreX, centreY, 80, 80);
  }
}
