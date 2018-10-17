Ball b;
int d;
boolean gameOver;
int currentScore = 0;
/**********FPS***************/
PFont font;
/**********Border************/
Border border;
final int BORDER_X = 1;
final int BORDER_Y = 1;

/**********Ball*Zone*********/
BallZone bz;
int SCALE = 2;
/**********Tupples***********/
ArrayList<Tupple> tupples;
final int PADDING = 2;
final int TUPPLE_START_X = 14;
final int TUPPLE_START_Y = 10;

int tuppleLen = 32;
int rows = 4;
int cols = 18;
int tuppleCount = rows * cols;
/****************************/
//Line line;

int scoreOffset(int score){
  int offset = 55;
  if(score >= 10){
    offset = 60;
  }
  if(score >= 100){
    offset = 70;
  }
  if(score >= 1000){
    offset = 80;
  }
  if(score >= 10000){
    offset = 90;
  }
  if(score >= 1000000){
    offset = 100;
  }
  return offset;
}

void initTupples(){
  int offset = tuppleLen;
  int padding = PADDING;
  int x;
  int y = TUPPLE_START_Y;
  for(int i = 0; i < rows; i++){
    x = TUPPLE_START_X;
    for(int j = 0; j < cols; j++){
      tupples.add(new Tupple(x,y,tuppleLen));
      x += offset + padding;
    }
    y += offset + padding;
  }
}

void addTuppleRow(){
  int padding = PADDING;
  int offset  = tuppleLen;
  int x = TUPPLE_START_X;
  int y = TUPPLE_START_Y;
  for(Tupple tupple : tupples){
    tupple.y += tupple.len + padding;
  }
  for(int i = 0; i < cols; i++){
    tupples.add(new Tupple(x,y,tuppleLen));
    x += offset + padding;
  }
}

void setup(){
  size(640,480);
  font = createFont("Georgia",12);
  textFont(font);
  d = 10;
  b = new Ball(width/2,height - d * 2,d);
  bz = new BallZone(width/2,height, 2 * SCALE * (tuppleLen));
  border = new Border(BORDER_X,BORDER_Y,(width - BORDER_X * 5),(height - bz.d / 2) - 2);
  tupples = new ArrayList<Tupple>();
  gameOver = false;
  initTupples();
}

void draw(){
  background(51);
  
  if(gameOver){
    noLoop();
  }
  

  
  
  
  for(int i = tupples.size() - 1; i >= 0; i--){
     Tupple t = tupples.get(i);
     t.update();
     t.show();
     if(b.isCollide(t) || b.isCollideInner(t)){
        currentScore++;
        tupples.remove(i);
     }
  }
  
  border.show();
  b.update();
  b.show();
  bz.show();

  
  
  
  if(b.pos.y < 0 || b.pos.x < 0 || b.pos.x > width){
    addTuppleRow();
    for(Tupple t: tupples){
      if(t.isBallZone(bz)){
        gameOver = true;
        break;
      }
    }
    
    if(!gameOver){
      b.vel.x = random(-5,5);
      b.vel.y = random(-5,-10);

    }else{
      b.vel.x = 0;
      b.vel.y = 0;
    }
    
    b.pos.x = width/ 2;
    b.pos.y = height - d * 2;

    
    
  }
  
  text("FPS: " + (int)frameRate, TUPPLE_START_X, height - 20);
  text("Score: " + currentScore, width - scoreOffset(currentScore),height - 20);
}
