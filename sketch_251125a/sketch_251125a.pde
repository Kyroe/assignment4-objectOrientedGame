ArrayList<Asteroid> asteroids;
float asteroidSpawn = 0;

void setup() {
  size (400, 400);
  asteroids = new ArrayList<Asteroid>();
}

void draw() {
  background(#0A1027);

  asteroidSpawn += 1;
  if (asteroidSpawn == 20) {
    asteroids.add(new Asteroid());
    asteroidSpawn = 0;
  }

  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    a.drawAster();
    // a.hitbox();
    a.moveAster();

    if (a.offScreen()) {
      asteroids.remove(i);
    }

    if (a.isHit()) {
      asteroids.remove(i);
    }
    println(asteroids.size());
  }
}
