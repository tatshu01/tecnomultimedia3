// el sistema de particulas

class ParticleSystem {
  // Es solo una ArrayList de objetos de partículas
  ArrayList<Particle> particles;

  // El PShape para agrupar todas las partículas PShape
  PShape particleShape;

  ParticleSystem(int n) {
    particles = new ArrayList<Particle>();
    // El PShape es un grupo
    particleShape = createShape(GROUP);

    // hacer todas las particulas
    for (int i = 0; i < n; i++) {
      Particle p = new Particle();
      particles.add(p);
      // El PShape de cada partícula se agrega al sistema PShape
      particleShape.addChild(p.getShape());
    }
  }

  void update() {
    for (Particle p : particles) {
      p.update();
    }
  }

  void setEmitter(float x, float y) {
    for (Particle p : particles) {
      // Cada partícula renace en la ubicación del emisor.
      if (p.isDead()) {
        p.rebirth(x, y);
      }
    }
  }

  void display() {
    shape(particleShape);
  }
}
