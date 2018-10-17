class Ball{
  PVector pos;
  PVector vel;
  PVector acc;
  int d;
  int r;
  
  Ball(float x, float y, int d){
    this.pos = new PVector(x,y);
    this.vel = new PVector(0,-5);
    this.acc = new PVector(0,0);
    this.d = d;
    this.r = d / 2;
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
  }
  
  boolean isCollide(Tupple t){
    boolean collide = false;
    if(pos.y - r == t.y + t.len){
      if(pos.x + r >= t.x && pos.x + r <= t.x + t.len){
        collide = true;
      }
      if(pos.x - r >= t.x && pos.x - r <= t.x + t.len){
        collide = true;
      }
    }
    if(pos.y + r == t.y){
      if(pos.x + r >= t.x && pos.x + r <= t.x + t.len){
        collide = true;
      }
      if(pos.x - r >= t.x && pos.x - r <= t.x + t.len){
        collide = true;
      }
    }
    if(pos.x + r == t.x){
      if(pos.y + r >= t.y && pos.y + r <= t.y + t.len){
        collide = true;
      }
      if(pos.y - r >= t.y && pos.y - r <= t.y + t.len){
        collide = true;
      }
    }
    if(pos.x - r == t.x + t.len){
      if(pos.y + r >= t.y && pos.y + r <= t.y + t.len){
        collide = true;
      }
      if(pos.y - r >= t.y && pos.y - r <= t.y + t.len){
        collide = true;
      }
    }
    return collide;
  }
  
  boolean isCollideInner(Tupple t){
    boolean collide = false;
    if(pos.x + r >= t.x && pos.x + r <= t.x + t.len 
       && pos.y + r <= t.y + t.len && pos.y + r >= t.y){
      collide = true;
    }
    if(pos.x - r >= t.x && pos.x - r <= t.x + t.len 
       && pos.y - r <= t.y + t.len && pos.y - r >= t.y){
      collide = true;
    }
    return collide;
  }
  
  void show(){
    noStroke();
    fill(255);
    ellipse(pos.x,pos.y,d,d);
  }
  
}
