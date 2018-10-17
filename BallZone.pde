class BallZone{
  float x;
  float y;
  int d;
  
  BallZone(float x, float y, int d){
    this.x = x;
    this.y = y;
    this.d = d;
  }
  
  void show(){
    stroke(255);
    noFill();
    ellipse(x,y,d,d);
  }

}
