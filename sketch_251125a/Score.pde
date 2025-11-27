class Score {


  int score = 0;

  Score () {
    rectMode(CENTER);
  }

  void display(int tempScore) { //score tracker variable passes through
    score = score + tempScore;
    textSize(25);
    fill(250, 150, 150);
    text(score, 350, 350);
  }

  boolean win() {
    if (score >= 100) { //check if score fits the win criteria
      return true;
    } else {
      return false;
    }
  }
}
