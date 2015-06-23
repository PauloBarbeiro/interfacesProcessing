class Cubo{
  PVector center;
  PImage texture;
  
  Cubo(PVector c, String tex){
    this.center = c.get();
    this.texture = loadImage(tex);
  }
  
  void render(){
    //noStroke();
    this.TexturedCube();
  }
  
  void TexturedCube() {
    pushMatrix();
    //translate(width/2.0, height/2.0, depth);
    translate(this.center.x, this.center.y, this.center.z);
    rotateX(rotx);
    rotateY(roty);
    rotateZ(rotz);
    scale(20);
    
    beginShape(QUADS);
    texture(this.texture);
  
    // Given one texture and six faces, we can easily set up the uv coordinates
    // such that four of the faces tile "perfectly" along either u or v, but the other
    // two faces cannot be so aligned.  This code tiles "along" u, "around" the X/Z faces
    // and fudges the Y faces - the Y faces are arbitrarily aligned such that a
    // rotation along the X axis will put the "top" of either texture at the "top"
    // of the screen, but is not otherwised aligned with the X/Z faces. (This
    // just affects what type of symmetry is required if you need seamless
    // tiling all the way around the cube)
    
    // +Z "front" face #1
    vertex(-1, -1,  1, 0.25, 0.25);
    vertex( 1, -1,  1, 0.5, 0.25);
    vertex( 1,  1,  1, 0.5, 0.5);
    vertex(-1,  1,  1, 0.25, 0.5);
  
    // -Z "back" face #6
    vertex( 1, -1, -1, 0.25, 0.75);
    vertex(-1, -1, -1, 0.5, 0.75);
    vertex(-1,  1, -1, 0.5, 1);
    vertex( 1,  1, -1, 0.25, 1);
  
    // +Y "bottom" face #4
    vertex(-1,  1,  1, 0.25, 0);
    vertex( 1,  1,  1, 0.5, 0);
    vertex( 1,  1, -1, 0.5, 0.25);
    vertex(-1,  1, -1, 0.25, 0.25);
  
    // -Y "top" face #3
    vertex(-1, -1, -1, 0.25, 0.5);
    vertex( 1, -1, -1, 0.5, 0.5);
    vertex( 1, -1,  1, 0.5, 0.75);
    vertex(-1, -1,  1, 0.25, 0.75);
  
    // +X "right" face #5
    vertex( 1, -1,  1, 0.5, 0.25);
    vertex( 1, -1, -1, 0.75, 0.25);
    vertex( 1,  1, -1, 0.75, 0.5);
    vertex( 1,  1,  1, 0.5, 0.5);
  
    // -X "left" face #2
    vertex( -1, -1, -1, 0, 0.25);
    vertex( -1, -1,  1, 0.25, 0.25);
    vertex( -1,  1,  1, 0.25, 0.5);
    vertex( -1,  1, -1, 0, 0.5);
  
    endShape();
    popMatrix();
  }

}
