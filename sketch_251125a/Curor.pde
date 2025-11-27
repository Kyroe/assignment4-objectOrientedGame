class Cursor {
  //replaces the cursor
  Cursor(){
  }
 
  void drawCursor(){
    noCursor();
    noFill();
    stroke(#F00202);
    strokeWeight(3);
    ellipse(mouseX, mouseY, 35,35);
    line(mouseX, mouseY +25, mouseX, mouseY +9);
    line(mouseX, mouseY -25, mouseX, mouseY -9);
    line(mouseX - 25, mouseY, mouseX - 9, mouseY);
    line(mouseX + 25, mouseY, mouseX + 9, mouseY);
  }
}
