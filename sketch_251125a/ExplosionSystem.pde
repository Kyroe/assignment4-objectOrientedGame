///From processing examples https://processing.org/examples/multipleparticlesystems.html

class ExplosionSystem {

  ArrayList<Explosion> explosions;
  PVector origin;

  ExplosionSystem(int num, PVector v) {
    explosions = new ArrayList<Explosion>();
    origin = v.copy();
    for (int i = 0; i < num; i++) {
      explosions.add(new Explosion(origin));
    }
  }
  
  void run() {
    for (int i = explosions.size() - 1; i >= 0; i--) {
      Explosion e = explosions.get(i);
      e.moveExplo();
      e.drawExplo();
      if (e.isDead()) {
        explosions.remove(i);
      }
    }
  }
  
  void addExplosion() {
   
    Explosion e = new Explosion(origin);
    explosions.add(e);
    
  }
}
