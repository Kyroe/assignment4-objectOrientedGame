class Asteroid {
  //declare variables 
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
    photo = loadImage("Asteroid.png");
  }

  void drawAster() {
    centreX = w - xMove; //use perlin noise to create random movements -> moves towards the bottom left
    centreY = (m + yMove) - 100; //use perlin noise to create random movements and move spawn above window -> moves towards the bottom left
    //    stroke(#A9B2CB);
    //   strokeWeight(2);
    //  fill(#4B607C);
    imageMode(CENTER);
    image(photo, centreX, centreY); //import asteroid asset
  }

  void moveAster() { //moves asteroids to perlin noise
    n = noise(t);
    m = map(n, 0, 1, 0, 60);
    t += 0.01;
    xMove += 1;
    yMove += tempMove;
  }

  boolean offScreen () { //to check if asteroids are past the bottom left of the window
    if (centreX + 80 < width +20 && centreY - 80 > height + 20) {
      return true;
    } else {
      return false;
    }
  }

  boolean isHit() { //check to see if asteroids have been clicked on 
    if (mouseX > centreX - 40 && mouseX < centreX + 40 && mouseY > centreY - 40 && mouseY < centreY + 40 && mousePressed) {
      return true;
    } else {
      return false;
    }
  }
}
