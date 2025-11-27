class Score {


  int score = 0;

  Score () {
    rectMode(CENTER);
  }

  void display(int tempScore) {
    score = score + tempScore;
    fill(250, 150, 150);
    text(score, 350, 350);
  }

  boolean win() {
    if (score >= 100) {
      return true;
    } else {
      return false;
    }
  }
}
