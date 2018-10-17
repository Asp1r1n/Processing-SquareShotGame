class Line{
  PVector pos;
  PVector vel;
  PVector acc;
  int     len;
  
  public Line(float x,float y,int len){
    this.pos = new PVector(x,y);
    this.vel = new PVector(0,0);
    this.acc = new PVector(0,0);
    this.len = len;
  }
  
  void update(){
     pos = new PVector(mouseX,mouseY);
  
  }
  
  void show(){
    
    stroke(255);
    line(width/2,height - d * 2,pos.x, pos.y);
  }

}
