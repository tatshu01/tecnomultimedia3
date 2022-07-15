// Una partícula individual

class Particle {

  // Velocidad
  PVector center;
  PVector velocity;
  // La vida útil está ligada a alfa
  float lifespan;

  // Objeto del sistema de partículas
  PShape part;
  // el tamaño de particula 
  float partSize;

  // una sola fuerza
  PVector gravity = new PVector(0, 0.1);

  Particle() {    
    partSize = random(10, 60);
    // La partícula es un quad texturizado.
    part = createShape();
    part.beginShape(QUAD);
    part.noStroke();
    part.texture(sprite);
    part.normal(0, 0, 1);
    
    part.vertex(-partSize/2, -partSize/2, 0, 0);
    part.vertex(+partSize/2, -partSize/2, sprite.width, 0);
    part.vertex(+partSize/2, +partSize/2, sprite.width, sprite.height);
    part.vertex(-partSize/2, +partSize/2, 0, sprite.height);
    
    part.endShape();

    // Inicializar vector central
    center = new PVector(); 
    
    // Establecer la ubicación inicial de la partícula
    rebirth(width/2, height/2);
  }

  PShape getShape() {
    return part;
  }

  void rebirth(float x, float y) {
    float a = random(TWO_PI);
    float speed = random(0.5, 4);
    // Una velocidad con ángulo y magnitud aleatorios
    velocity = PVector.fromAngle(a);
    velocity.mult(speed);
    // Establecer vida útil
    lifespan = 255;
    // Establecer ubicación usando traducir
    part.resetMatrix();
    part.translate(x, y); 
    
    // Actualizar vector central
    center.set(x, y, 0);
  }

  // ¿Está fuera de la pantalla o su vida útil ha terminado?
  boolean isDead() {
    if (center.x > width  || center.x < 0 || 
        center.y > height || center.y < 0 || lifespan < 0) {
      return true;
    } 
    else {
      return false;
    }
  }

  void update() {
    // disminuir la vida
    lifespan = lifespan - 1;
    // aplicar gravedad
    velocity.add(gravity);
    part.setTint(color(255, lifespan));
    //Mueve la partícula según su velocidad.
    part.translate(velocity.x, velocity.y);
    // y también actualizar el centro
    center.add(velocity);
  }
}
