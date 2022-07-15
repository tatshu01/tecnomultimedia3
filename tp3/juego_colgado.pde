//FLORENCIA MORAN LEGAJO 91344/4





persona p = new persona();
horca h = new horca();

int random;

PImage bg;
PImage ganar;
PImage perder;

// Objeto del sistema de partículas
ParticleSystem ps;
// A PImage for particle's texture
PImage sprite;  

float acierto = 0;
int error = 0;
int oportunidad;
int tiempo;
int CondicionTiempo = 0;

boolean inicio;
boolean gameOver;
boolean gameWin;
boolean juegoIniciado;
boolean palabraEscogida;

ArrayList<String> letrasIncorrectas = new ArrayList<String>();
String letra;
String palabra;
String palabraCorrecta = "";
StringBuffer mostrarPalabra;

PShape madera1;
PShape madera2;
PShape madera3;
PShape madera4;
PShape madera5;
PShape madera6;
PShape mano1;
PShape mano2;
PShape pie1;
PShape pie2;
PShape cabeza;
PShape cuello;
PShape cuerpo;
PShape brazo;
PShape pierna;

PImage surfaceMadera;
PImage surfacePerson1;
PImage surfacePerson2;
PImage surfacePerson3;
PImage surfacePerson4;
PImage surfacePerson5;
PImage surfacePerson6;
PImage surfacePerson7;
PImage surfacePerson8;
char clicked;

void setup(){ 
  size(1600, 1000, P3D);
    
  // carga la imagen
  sprite = loadImage("sangre.png");
  ps = new ParticleSystem(100);
   
  tiempo = 0;
  oportunidad = 6;
  
  noFill();
  noStroke();
  
  gameOver = false;
  inicio = false;
  juegoIniciado = true;
  palabraEscogida = false;
  palabraCorrecta = "";
  letrasIncorrectas = new ArrayList<String>();
  
  p = new persona();
  h = new horca();
  
  if (madera1 == null){
  surfaceMadera = loadImage("mercurio.jpg");
  surfacePerson1 = loadImage("color.png");
  surfacePerson2 = loadImage("color2.png");
  surfacePerson3 = loadImage("color3.png");
  surfacePerson4 = loadImage("cabeza.png");
  surfacePerson5 = loadImage("color4.png");
  surfacePerson6 = loadImage("cuerpo.png");
  surfacePerson7 = loadImage("brazo.png");
  surfacePerson8 = loadImage("pierna.png");
  bg = loadImage("bg.jpg");
  ganar = loadImage("ganar.jpg");
  perder = loadImage("perder.jpg");
  
 
  
  madera1 = createShape(RECT, 355, 630, 120, 20);
  madera1.setTexture(surfaceMadera);
  
  madera2 = createShape(RECT, 400, 80, 30, 550);
  madera2.setTexture(surfaceMadera);
  
  madera3 = createShape(RECT, 400, 80, 400, 20);
  madera3.setTexture(surfaceMadera);
  
  madera4 = createShape(RECT, 700, 80, 5, 100);
  madera4.setTexture(surfaceMadera);

  madera5 = createShape(RECT, 0, 0, 20, 140);
  madera5.setTexture(surfaceMadera);
  
  madera6 = createShape(RECT, 0, 0, 10, 60);
  madera6.setTexture(surfaceMadera);
  
  mano1 = createShape(SPHERE, 20);
  mano1.setTexture(surfacePerson1);
  
  mano2 = createShape(SPHERE, 20);
  mano2.setTexture(surfacePerson1);
  
  pie1 = createShape(SPHERE, 20);
  pie1.setTexture(surfacePerson2);
  
  pie2 = createShape(SPHERE, 20);
  pie2.setTexture(surfacePerson3);
  
  cabeza = createShape(SPHERE, 50);
  cabeza.setTexture(surfacePerson4);
  
  cuello = createShape(RECT, 697, 275, 15, 30);
  cuello.setTexture(surfacePerson5);
  
  cuerpo = createShape(RECT, 680, 300, 50, 130);
  cuerpo.setTexture(surfacePerson6);
  
  brazo = createShape(RECT, 0, 0, 25, 90);
  brazo.setTexture(surfacePerson7);
  
  pierna = createShape(RECT, 0, 0, 25, 90);
  pierna.setTexture(surfacePerson8);
  }
  
  ElegirPalabra();
}

//Escoger la dificultad del juego
void chooseDifficulty() {

  if ( key == 'F' || key == 'f') {
    CondicionTiempo = 3000;
    inicio = true;
    letra = "";
  }
  else if ( key == 'M' || key == 'm' ) {
    CondicionTiempo = 2000;
    inicio = true;
    letra = "";
  }
  else if ( key == 'D' || key == 'd' ) {
    CondicionTiempo = 1000;
    inicio = true;
    letra = "";
  }
  else {
  }
}

void draw(){
 
 
  background(bg);
  if (inicio == false && juegoIniciado == true) {
   
    textSize(80);
    textAlign(CENTER);
    fill(0);
    text("Bienvenido a el juego!", width / 2, 70);
    textSize(80);
    text("Porfavor escoja dificultad de nivel! ", width / 2, 180);                           
    fill( 0, 100, 225);
    text("[F]acil",  width / 2, 300);
    fill(100, 225, 0);
    text("[M]edia",  width / 2, 400);
    fill(225, 0, 100);
    text("[D]ificil",  width / 2, 500);
    chooseDifficulty();
      
    
  }
  if (gameOver == true && juegoIniciado == false && gameWin == false) {
    perdiste();
  }
  if (gameOver == true && juegoIniciado == false && gameWin == true) {
    ganar();
  }
  if (inicio == true && gameOver == false && juegoIniciado == true) {

  tiempo++;
  background(bg);
  pushMatrix();
  translate(400, 0);
  h.soga();
  matar();
  popMatrix();
  
  //textos
  textAlign(CENTER);
  textSize(50);
  text("Aciertos: "+ round(acierto), 400, 200);
  text("Errores: "+ error, 400, 300);
  text("Oportunidades: "+ oportunidad, 400, 400);
  text("Tiempo: "+ tiempo, 1400, 70);
  //text(palabra, 1000, 600);
  pushMatrix();
  translate(50,0);
  for (int i = 0 ; i < letrasIncorrectas.size() ; i++) {
    fill(255,0,0);
      text(letrasIncorrectas.get(i), 160*(i), 800);
    }
  for (int i = 0 ; i < palabra.length() ; i++) {
    fill(0);
      text( mostrarPalabra.charAt(i), 160*(i), 900);
    } 
    popMatrix();
    pushMatrix();
    stroke(0);
    translate(50,600);
    presentacionPalabra();
    popMatrix();
    
    if (logica() == true) {
      rightLetter();
    }

    if (logica() == false) {
      Incorrecto(letra);
    }   
      if (tiempo == CondicionTiempo) {
      gameOver = true;
      juegoIniciado = false;
      inicio = false;
      gameWin = false;
    }
    if (condicionGanar() == true) {
      inicio = false;
      gameWin = true;
      gameOver = true;
      juegoIniciado = false;
    }
    if (oportunidad == 0) {
      gameOver = true;
      gameWin = false;
      juegoIniciado = false;
    }
    pushMatrix();  
  // Tasa de fotogramas de visualización
  fill(0);
  textSize(16);
  text("Frame rate: " + int(frameRate),80,20); 
  popMatrix();
  }
      
}
//elige una palabra del arreglo
void ElegirPalabra() {
  int random = (int)(Math.random() * (arregloPalabras.length));
  palabra = arregloPalabras[random];
  for (int i = 0 ; i < palabra.length() ; i++) {
    palabraCorrecta+= ".";
  }
  mostrarPalabra = new StringBuffer(palabraCorrecta);
}
void matar(){
  if (oportunidad == 5) {
    p.cabeza();
    popMatrix();
    ps.update();
    ps.display();
    ps.setEmitter(1100,height / 2);
    pushMatrix();
  }
  if (oportunidad == 4) {
    p.cabeza();
    p.cuerpo();
    popMatrix();
    ps.update();
    ps.display();
    ps.setEmitter(1100,height / 2);
    pushMatrix();
  }
  if (oportunidad == 3) {
    p.cabeza();
    p.cuerpo();
    p.brazoIzquierdo();
    popMatrix();
    ps.update();
    ps.display();
    ps.setEmitter(1100,height / 2);
    pushMatrix();
  }
  if (oportunidad == 2) {
    p.cabeza();
    p.cuerpo();
    p.brazoIzquierdo();
    p.brazoDerecho();
    popMatrix();
    ps.update();
    ps.display();
    ps.setEmitter(1100,height / 2);
    pushMatrix();
  }
  if (oportunidad == 1) {
    p.cabeza();
    p.cuerpo();
    p.brazoIzquierdo();
    p.brazoDerecho();
    p.piernaDerecha();
    popMatrix();
    ps.update();
    ps.display();
    ps.setEmitter(1100,height / 2);
    pushMatrix();
  }
  if (oportunidad == 0) {
    p.cabeza();
    p.cuerpo();
    p.brazoIzquierdo();
    p.brazoDerecho();
    p.piernaDerecha();
    p.piernaIzquierda();
    popMatrix();
    ps.update();
    ps.display();
    ps.setEmitter(1100,height / 2);
    pushMatrix();
  }
}

//reescribe keyPressed() usando el metodo inputLogic
void keyPressed() {
  inputLogic();
}

// guarda la tecla.
void inputLogic() {

  if (Character.isLetter(key) == true) {
    clicked = key;
    letra = Character.toString(key);
    letra = letra.toLowerCase();
  }
}

//determina si la letra es parte de la palabra.
boolean logica() {
  if ( palabra.contains(letra) == true) {
    return true;
  }
  return false;
}

//procedimiento para saber si la letra es correcta.
void rightLetter() {
  for (int k = 0 ; k < palabra.length() ; k++) {
    if ( key == palabra.charAt(k)) {
      mostrarPalabra.setCharAt( k, clicked);
      acierto = acierto + 0.5 ;
    }
  }
  key = ' ';
}

//condicion para ganar.
boolean condicionGanar() {
  for (int i = 0 ; i < mostrarPalabra.length() ; i++) {
    if ( mostrarPalabra.charAt(i) == '.') {
      return false;
    }
  }
  return true;
}

//mensaje perdedor.
void perdiste() {

  background(perder);
  textSize(80);
  fill(255);
  text("LASTIMA PERDISTE! ", width / 2, 100);
  text("LA PALABRA ERA: ", width / 2, 200);
  fill( 255, 0, 0 );
  text(palabra, width / 2, 300);
  fill(255);
  text("Tu tiempo fue: " + "" + tiempo, width / 2, 400);
  text("Tus puntos son: " + "" + acierto, width / 2, 500);
  text("Quieres volver a jugar? ", width / 2, 600 );
  text("[S]i? or [N]o? ", width / 2, 700);
  if ( key == 's' || key == 'S') {
    setup();
  } if( key == 'n' || key == 'N') {
    exit();
  }
}

//mensaje para el ganador
void ganar() {
 
  background(ganar);
  textSize(80);
  fill(0);
  text("FELICIDADES! ", width / 2, 100);
  text("LOGRASTE GANAR QUE CHIDO SOS ", width / 2, 200);
  fill( 255, 0, 0 );
  text(palabra, width / 2, 300);
  fill(0);
  text("Tu tiempo fue: " + "" + tiempo, width / 2, 400);
  text("Tus puntos son: " + "" + acierto, width / 2, 500);
  text("Quieres volver a jugar? ", width / 2, 600 );
  text("[S]i? or [N]o? ", width / 2, 700);
  if ( key == 's' || key == 'S') {
    setup();
  } if( key == 'n' || key == 'N') {
    exit();
  }
}
//Metodo para cuando el jugador puso algo incorrecto.
void Incorrecto(String s) {
  for (String str: letrasIncorrectas) {
    if (str.equals(letra)) {
      return;
    }
  }
  letrasIncorrectas.add(s);
  oportunidad--;
  error++;
}
//linea creada para representar la cantidad de letras
void presentacionPalabra() {
  for (int i = 0; i < palabra.length() ; i++) {
     int x = 160*(i);    
    line(x, 300, x +110, 300); 
  }
}
//por razones obvias esto esta abajo
String[] arregloPalabras={"cervesa","bar","caballo","chino","desierto","serpiente", "indio", "pelicula", "pistola", "vaquero", "arco", "oro", "perro", "calor"}; 
