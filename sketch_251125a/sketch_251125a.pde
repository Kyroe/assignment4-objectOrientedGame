ArrayList<Asteroid> asteroids;
float asteroidSpawn = 0;

Star[] stars = new Star[25];

ArrayList<ExplosionSystem> systems;

Score score;
int s = 0;

Cursor cursors;

void setup() {
  size (400, 400);
  asteroids = new ArrayList<Asteroid>();
  systems = new ArrayList<ExplosionSystem>();
  score = new Score();
  cursors = new Cursor();
  
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(#0A1027);
  
  noStroke();
  
  for (int i = 0; i < stars.length; i++) {
    stars[i].drawStar();

  }
  
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

  if (score.win()) {
    fill(#62E385);
    rectMode(CORNERS);
    rect(0, 0, 400, 400);
    fill(255);
    textSize(25);
    text("You Win! press space to restart", width/2 - 150, height/2);
  }

  if (score.win() && keyPressed) {
    score.score = 0;
  }
  
  cursors.drawCursor();
  
}

void mousePressed() {
  systems.add(new ExplosionSystem(25, new PVector(mouseX, mouseY)));
}
