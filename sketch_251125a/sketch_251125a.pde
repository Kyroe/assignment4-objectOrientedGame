ArrayList<Asteroid> asteroids;

void setup() {
  size (400, 400);
  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < 10; i++) {
    asteroids.add(new Asteroid());
  }

}

void draw() {
  background(#0A1027);
  
 for (int i = 0; i < 5; i++) {

  Asteroid a = asteroids.get(i);
  a.moveAster();
  a.drawAster();

  }
}
