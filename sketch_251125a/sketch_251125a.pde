ArrayList<Asteroid> asteroids;
float asteroidSpawn = 0;

ArrayList<ExplosionSystem> systems;

Score score;
int s = 0;

void setup() {
  size (400, 400);
  asteroids = new ArrayList<Asteroid>();
  systems = new ArrayList<ExplosionSystem>();
  score = new Score();
}

void draw() {
  background(#0A1027);
  //-----------------[ASTEROIDS]-----------------------------------
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
      // println(a.offScreen());
      // }else {
      //println(a.offScreen());
    }

    if (a.isHit()) {
      s += 1;
    } else {
      s = 0;
    }

    score.display(s);

    if (a.isHit()) {
      asteroids.remove(i);
    }
  }

  //-------------------[EXPLOSION]------------------------------------

  for (ExplosionSystem es : systems) {
    //  ExplosionSystem es = systems.get(i);
    es.run();
    // es.addExplosion();
  }
}

void mousePressed() {
  systems.add(new ExplosionSystem(25, new PVector(mouseX, mouseY)));
}
