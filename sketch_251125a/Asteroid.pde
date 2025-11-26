class Asteroid {
  float w;
  float n;
  float m;
  float xMove = 0;
  float yMove = 0;
  float t = 1;
  float tempMove;

  Asteroid() {
    w = random(150, 450);
    tempMove = random(0.5,5);
  }

  void drawAster() {
    fill(255);
    ellipse(w - xMove,(m + yMove) - 100, 80, 80);
  }
  void moveAster() {
    n = noise(t);
    m = map(n, 0, 1, 0, 60);
    t += 0.01;
    xMove += 1;
    yMove += tempMove;
    
  }
    
}
