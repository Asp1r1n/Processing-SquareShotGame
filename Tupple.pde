class Tupple{
  float x;
  float y;
  int len;
  int size;
  
  Tupple(float x,float y, int len){
    constructor(x,y,len);
  }
  
  Tupple(float x, float y, int len, int size){
    constructor(x,y,len);
    this.size = size;
  }
  
  boolean isBallZone(BallZone z){
    return y + len == z.y - z.d / 2;
  }
  

  
  void update(){
    
  }
  
  void show(){
    fill(255);
    stroke(0);
    rect(x,y,len, len);
  }
  
  
  
  void constructor(float x, float y, int len){
    this.x = x;
    this.y = y;
    this.len = len;
  }
  
  String toString(){
    return "{x = " + x + " y = " + y + " len = " + len  + "}";
  }

}
