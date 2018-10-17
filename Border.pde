class Border{
  float x;
  float y;
  float w;
  float h;
  
  Border(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void update(){
  
  }
  
  void show(){
    noFill();
    stroke(255);
    rect(x,y,x + w, y + h);
  }

}
