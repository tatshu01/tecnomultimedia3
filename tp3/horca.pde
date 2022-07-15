class horca{
  
  void soga(){ 
    //horca

  pushMatrix();
  translate(530, 80);
  rotate(PI/3);
  shape(madera5); 
  popMatrix();
  
  pushMatrix();
  translate(410, 585);
  rotate(PI/5);
  shape(madera6); 
  popMatrix();
  
  pushMatrix();
  translate(412, 590);
  rotate(PI/-5);
  shape(madera6); 
  popMatrix();
  
  shape(madera1); // base
  shape(madera2); // mastil
  shape(madera3); // arriba
  shape(madera4); // soga

  }
}