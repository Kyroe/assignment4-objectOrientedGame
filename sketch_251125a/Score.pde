class Score {

  int score = 0;

  Score () {

 
  }

  void display(int tempScore) {
score = score + tempScore;
fill(250, 150, 150);
    text(score, 350, 350);
  }
}
