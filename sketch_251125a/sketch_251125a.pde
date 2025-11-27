//-----------------------------[DECALARE GLOBAL VARIABLES AND INITIALIZE OBJECTS & ARRAYS/ARRAYSLISTS]----------------------------------------
ArrayList<Asteroid> asteroids;
float asteroidSpawn = 0;

Star[] stars = new Star[25];

ArrayList<ExplosionSystem> systems;

Score score;
int s = 0; //score tracker variable 

Cursor cursors;

PImage photo;

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
//------------------[STARS]--------------------------  
//draw an array of stars in the background
  for (int i = 0; i < stars.length; i++) {
    stars[i].drawStar();

  }
  
//-----------------[ASTEROIDS]-----------------------------------


  asteroidSpawn += 1;
  if (asteroidSpawn == 20) { //spawn in new asteroid every 20 frames
    asteroids.add(new Asteroid());
    asteroidSpawn = 0; //resets spawm timer
  }

  for (int i = asteroids.size() - 1; i >= 0; i--) { //call asteroid from arraylist and draw/move
    Asteroid a = asteroids.get(i);
    a.drawAster();
    // a.hitbox();
    a.moveAster();

    if (a.offScreen()) { 
      asteroids.remove(i);//if boolean is true, remove asteroid object
      // println(a.offScreen());
      // }else {
      //println(a.offScreen());
    }

    if (a.isHit()) {  // if asteroid is clicked on, increase score tracker variable
      s += 1;
    } else {
      s = 0; // reset variable to 0 so it doesn't continue counting forever
    }

    score.display(s); //scare tracker passes through and gets added to score

    if (a.isHit()) {
      asteroids.remove(i); //remove asteroid object if clicked on
    }
  }

  //-------------------[EXPLOSION]------------------------------------

  for (ExplosionSystem es : systems) { //creates esplosion effects
    //  ExplosionSystem es = systems.get(i);
    es.run();

  }

//---------------[SCORE/WIN SCREEN]--------------------------------------

  if (score.win()) { 
    fill(#62E385);
    rectMode(CORNERS);
    rect(0, 0, 400, 400);
    fill(255);
    textSize(25);
    text("You Win! press space to restart", width/2 - 150, height/2);
  }

  if (score.win() && keyPressed) {
    score.score = 0; //resets score when player restarts
  }
  
  cursors.drawCursor();//replaces cursor
  
}

void mousePressed() { //creates new contructor for every mouse click
  systems.add(new ExplosionSystem(35, new PVector(mouseX, mouseY)));
}
