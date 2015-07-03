import ijeoma.motion.*;
import ijeoma.motion.tween.*;


PImage tex;
PImage sepia;
PImage roxa;

PImage[] images;
int current_img = 0;

float rotx = 0;//PI/4;
float roty = 0;//PI/4;
float rotz = 0;
float t_y = 0;//10
float t_x = 0;//40
float depth= -50;//-200

//Cubo cube;
//Cubo cube2;
Cubo[] cubos;
Cubo[] cubos2;
int col = 3;//16 4
int row = 3;//6 4
int numCubos = ((col*row)*2)-col;
float colunit = 1.0/col;
float rowunit = 1.0/(row*2);

Parallel tp;

PFont font;

//camera
float xoff = 0.0;


void setup() {
  
  size(1024, 680, P3D);
  
  //lights
  pointLight(51, 102, 126, 35, 40, 36);
  
  tex = loadImage("praca_dupla.jpg");
  sepia = loadImage("praca_sepia.jpg");
  roxa = loadImage("praca_roxa.jpg");
  
  images = new PImage[3];
  images[0] = tex;
  images[1] = sepia;
  images[2] = roxa;
  
  textureMode(NORMAL);
  fill(255);
  stroke(color(44,48,32));
  
  //cube = new Cubo(new PVector(0,0,0), "uv_dado.png");
  //cube2 = new Cubo(new PVector(40,0,0), "uv_dado.png");
  cubos = new Cubo[numCubos];
  //PVector p = new PVector(0, 0, 0);
  //cubos[0] = new Cubo(p, "praca_dupla.jpg", 0, 0);
  
  int last = 0;
  for(int i=0; i<col ; i++){
    for(int j=0; j<row ; j++){
      println("----------------------");
      if( i==0 ){
        println("x: "+i*40+"   y: "+(j+1)*40+"   z : 0 :: UV x:"+i+" y:"+j);
        PVector p = new PVector(i*40, j*40, 0);
        cubos[last] = new Cubo(p, "praca_dupla.jpg", i, j);
        last++;
      }
      else{
        println("x: "+i*40+"   y: "+(j)*40+"   z : 0 :: UV x:"+i+" y:"+j);
        println("x: 0  y: "+j*40+"   z : "+i*-40+" :: UV x:"+j+" y:"+i);
        PVector p = new PVector(i*40, j*40, 0);
        cubos[last] = new Cubo(p, "praca_dupla.jpg", i, j);
        last++;
        //p = new PVector(160, 160, 60);
        //p = new PVector(0, i*40, (j+1)*-40);
        p = new PVector(0, j*40, i*-40);
        cubos[last] = new Cubo(p, "praca_dupla.jpg", j, i);
        last++;
      }
      
    }
  }//*/
  
  /*
  cubos2 = new Cubo[(col)*(row-1)];
  last = 0;
  for(int i=0; i<col ; i++){
    for(int j=0; j<row-1 ; j++){
      PVector p = new PVector(0, i*40, (j+1)*-40);
      cubos2[last] = new Cubo(p, "praca_dupla.jpg", i, j+1);
      last++;
    }
  }//*/
  
  /*
  cubos2 = new Cubo[(col)*(row-1)];
  last = 0;
  for(int i=0; i<col ; i++){
    for(int j=0; j<row-1 ; j++){
      //println("----------------------");
      //println("x:0    y: "+i*40+"   z: "+(j+1)*-40);
      PVector p = new PVector(0, i*40, (j+1)*-40);
      cubos2[last] = new Cubo(p, "praca_dupla.jpg", i, j+1);
      last++;
    }
  }//*/
  
  
  
  //font
  font = loadFont("Ubuntu-Medium-40.vlw");
  textFont(font, 20);
  
    
  Motion.setup(this);
  
  tp = new Parallel();
  tp.add(new Tween("rotx1", this, "rotx", radians(360), 50));
    //.add(new Tween("roty1", this, "roty", radians(0), 50))
    //.add(new Tween("rotz1", this, "rotz", radians(0), 50));//.play();
    
  //camera
  noiseSeed(0);
}

void draw() {
  
  background(200);
  
  
  
  noStroke();
  //translate(width/2.0, height/2.0, depth);
  //translate(40, 30, depth);
  translate(t_x, t_y, depth);
  
  //cube.render();
  //cube2.render();
  for(int i=0 ; i<numCubos ; i++){
    cubos[i].render();
  }
  
  /*
  for(int i=0 ; i<cubos2.length ; i++){
    cubos2[i].render();
  }//*/
 
  xoff = xoff + .01;
  //camera(-340, noise(xoff) * -220, 340,   80, 120, depth,   0, 1, 0);
  camera(-140, noise(xoff) * -120, 140,   80, 120, depth,   0, 1, 0);
  
  
  text("Praças Históricas de São Paulo", 0, height-350);
}

/*
void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
  
}//*/

public void keyPressed() {
  
  for(int i=0 ; i<cubos.length ; i++){
    cubos[i].setTexture(images[current_img]);
  }
  
  tp.play();
  
  current_img++;
  if( current_img>=images.length ){
    current_img = 0;
  }
  
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
