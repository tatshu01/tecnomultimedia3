class persona{
    
  
  void cabeza(){
    noStroke();
    fill(0);
    pushMatrix();
    translate(705, 230);
    shape(cabeza);  // cabeza
    popMatrix();
    shape(cuello); // cuello
    
  }
  
  void cuerpo(){
    noStroke();
    shape(cuerpo);   // cuerpo
  }
  
  void brazoIzquierdo(){
    noStroke();
    
    //brazo izquierdo
  pushMatrix();
  translate(600, 360);
  shape(mano1);  // mano
  popMatrix();
  pushMatrix();
  translate(680, 300);
  rotate(PI/3);
  shape(brazo);
  popMatrix();
  }
  
  void brazoDerecho(){
    noStroke();
    
    //brazo derecho
  pushMatrix();
  translate(800, 360);
  shape(mano2); // mano
  popMatrix();
  pushMatrix();
  translate(718, 322);
  rotate(PI/-3);
  shape(brazo);
  popMatrix();
  }
  
  void piernaDerecha(){
    noStroke();
    
    //pierna derecha
  pushMatrix();
  translate(780, 500);
  shape(pie1); // pie
  popMatrix();
  pushMatrix();
  translate(710, 430);
  rotate(PI/-5);
  shape(pierna);
  //rect(0, 0, 25, 90);
  popMatrix();
  }
  
  void piernaIzquierda(){
    noStroke();
    
    //pierna izquierda
  pushMatrix();
  translate(630, 500);
  shape(pie2); // pie
  popMatrix();
  pushMatrix();
  translate(680, 410);
  rotate(PI/5);
  shape(pierna);
  //rect(0, 0, 25, 90);
  popMatrix();
  }
}