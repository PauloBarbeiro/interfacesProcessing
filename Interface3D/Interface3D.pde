import ijeoma.motion.*;
import ijeoma.motion.tween.*;


PImage tex;

float rotx = 0;//PI/4;
float roty = 0;//PI/4;
float rotz = 0;

float depth= 0;//-200

//Cubo cube;
//Cubo cube2;
Cubo[] cubos;
int col = 4;//16 4
int row = 4;//6 4
int numCubos = col*row;

//Texture


Parallel tp;


void setup() {
  size(640, 360, P3D);
  tex = loadImage("praca.jpg");
  textureMode(NORMAL);
  fill(255);
  stroke(color(44,48,32));
  
  //cube = new Cubo(new PVector(0,0,0), "uv_dado.png");
  //cube2 = new Cubo(new PVector(40,0,0), "uv_dado.png");
  cubos = new Cubo[numCubos];
  int last = 0;
  for(int i=0; i<col ; i++){
    for(int j=0; j<row ; j++){
      PVector p = new PVector(i*40, j*40, 0);
      cubos[last] = new Cubo(p, "praca.jpg", i, j);
      last++;
    }
  }
  
  
  
  /*
  for(int i=0 ; i<numCubos ; i++){
    println("cria cubo "+i+" ------------------");
    int posx = 0;
    int posy = 0;
    //há quebra de linha?
    if(i%col == 0 && i!=0){
      println("nova linha");
    }
    
    //calcular posição
    PVector p = new PVector(i*40, 0,0);   
    //criar vetor
    
    //instanciar cubo
    cubos[i] = new Cubo(p, "uv_dado.png");
  }//*/
  
  Motion.setup(this);
  
  tp = new Parallel();
  tp.add(new Tween("rotx1", this, "rotx", radians(540), 50));
    //.add(new Tween("roty1", this, "roty", radians(0), 50))
    //.add(new Tween("rotz1", this, "rotz", radians(0), 50));//.play();
}

void draw() {
  
  background(0);
  
  noStroke();
  //translate(width/2.0, height/2.0, depth);
  translate(40, 30, depth);
  
  //cube.render();
  //cube2.render();
  for(int i=0 ; i<numCubos ; i++){
    cubos[i].render();
  }
 
  //camera(map(mouseX, 0, width, -100, 100), map(mouseY, 0, height, -150, 150), 140,   0, 0, 0,   0, 1, 0);
}

/*
void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
  
}//*/

public void keyPressed() {
  
  
  tp.play();
}

public void mousePressed() {
  tp.pause();
}

public void mouseReleased() {
  //tp.getTween("rotx1").resume();
  tp.resume();
}

public void mouseDragged() {
  tp.seek((float) mouseX / width);
} 
