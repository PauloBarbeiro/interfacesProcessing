import ijeoma.motion.*;
import ijeoma.motion.tween.*;


PImage tex;

float rotx = 0;//PI/4;
float roty = 0;//PI/4;
float rotz = 0;

float depth= 0;//-200

Cubo cube;
Cubo cube2;

Parallel tp;


void setup() {
  size(640, 360, P3D);
  tex = loadImage("uv_dado.png");
  textureMode(NORMAL);
  fill(255);
  stroke(color(44,48,32));
  
  cube = new Cubo(new PVector(0,0,0), "uv_dado.png");
  cube2 = new Cubo(new PVector(40,0,0), "uv_dado.png");
  
  Motion.setup(this);
  
  tp = new Parallel();
  tp.add(new Tween("rotx1", this, "rotx", radians(0), 50))
    .add(new Tween("roty1", this, "roty", radians(0), 50))
    .add(new Tween("rotz1", this, "rotz", radians(0), 50));//.play();
  /*
  tp.add(new Tween("rotx4", this, "rotx", radians(90), 50))
    .add(new Tween("roty4", this, "roty", radians(360), 50))
    .add(new Tween("rotz4", this, "rotz", radians(720), 50));//.play();//*/
  
  tp.add(new Tween("rotx6", this, "rotx", radians(180), 50))
    .add(new Tween("roty6", this, "roty", radians(0), 50))
    .add(new Tween("rotz6", this, "rotz", radians(0), 50));//.play();
}

void draw() {
  
  background(0);
  
  noStroke();
  translate(width/2.0, height/2.0, depth);
  
  cube.render();
 
  cube2.render();
 
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
  tp.resume();
}

public void mouseDragged() {
  tp.seek((float) mouseX / width);
} 
