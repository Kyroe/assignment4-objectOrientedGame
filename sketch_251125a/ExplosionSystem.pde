///From processing examples https://processing.org/examples/multipleparticlesystems.html
//object to organize the Explosion objects 
class ExplosionSystem {

  ArrayList<Explosion> explosions;
  PVector origin; 

  ExplosionSystem(int num, PVector v) {
    explosions = new ArrayList<Explosion>();
    origin = v.copy();
    for (int i = 0; i < num; i++) { //creates "num" amount of explosion objects 
      explosions.add(new Explosion(origin));
    }
  }
  
  void run() {
    for (int i = explosions.size() - 1; i >= 0; i--) { //runs through the arraylist backwards
      Explosion e = explosions.get(i);
      e.moveExplo();
      e.drawExplo();
      if (e.isDead()) { //when lifespan is < 0 then remove object
        explosions.remove(i);
      }
    }
  }
}
