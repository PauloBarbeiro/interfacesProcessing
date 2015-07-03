class Cubo{
  PVector center;
  PImage texture;
  int posx = 0;
  int posy = 0;
  
  Cubo(PVector c, String tex, int x, int y){
    this.center = c.get();
    this.texture = loadImage(tex);
    this.posx = x;
    this.posy = y;
    println("x: "+ abs((this.posx-col)) );
  }
  
  void setTexture(PImage tex){
    this.texture = tex;
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
    //println("row: "+rowunit);
    //println("col: "+colunit);
    vertex(-1, -1,  1, this.posx * colunit     , this.posy * rowunit    ); //A
    vertex( 1, -1,  1, (this.posx+1) * colunit , this.posy * rowunit    ); //B
    vertex( 1,  1,  1, (this.posx+1) * colunit , (this.posy+1) * rowunit); //D
    vertex(-1,  1,  1, this.posx * colunit     , (this.posy+1) * rowunit); //C
    
    /*
    vertex(-1, -1,  1, this.posx * 0.25     , this.posy * 0.25    ); //A
    vertex( 1, -1,  1, (this.posx+1) * 0.25 , this.posy * 0.25    ); //B
    vertex( 1,  1,  1, (this.posx+1) * 0.25 , (this.posy+1) * 0.25); //D
    vertex(-1,  1,  1, this.posx * 0.25     , (this.posy+1) * 0.25); //C
    //*/
    /*
    vertex(-1, -1,  1, 0.25, 0.25);
    vertex( 1, -1,  1, 0.5, 0.25);
    vertex( 1,  1,  1, 0.5, 0.5);
    vertex(-1,  1,  1, 0.25, 0.5);
  //*/
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
    //abs((this.posx-col))
    println(col+" : "+row+" =>  "+(1.0/col)*2 +" ,"+ (1.0/(row*2))*2);
    vertex( -1, -1, -1, (1.0/col)*2 , (1.0/(row*2))*2 );//0.66 : 0.83  ::  1/3 *2     -  1/6 *2
    vertex( -1, -1,  1, (1.0/col) *col    , 0.83 );// 1 : 0.83  :: 1/3 *3  -  1/6 *5
    vertex( -1,  1,  1, 1    , 1    );//
    vertex( -1,  1, -1, 0.66 , 1    );//*/
    
    /*
    vertex( -1, -1, -1, 0  , 0.5);//A
    vertex( -1, -1,  1, 1  , 0.5);//B
    vertex( -1,  1,  1, 1  , 1);//C
    vertex( -1,  1, -1, 0  , 1);//D */
  
    /*
    vertex(-1, -1,  1, this.posx * colunit     , this.posy * rowunit    ); //A
    vertex( 1, -1,  1, (this.posx+1) * colunit , this.posy * rowunit    ); //B
    vertex( 1,  1,  1, (this.posx+1) * colunit , (this.posy+1) * rowunit); //C
    vertex(-1,  1,  1, this.posx * colunit     , (this.posy+1) * rowunit); //D */
  
    endShape();
    popMatrix();
  }

}
