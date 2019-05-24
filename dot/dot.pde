int a=0;
int scale = 25;

int total_dots_i;
int total_dots_j;
dots dots_[][];
dots dots_rotate[][];
boolean random = false;


void setup() {
  fullScreen();
  total_dots_i = width/scale;
  total_dots_j = height/scale;
  dots_ = new dots[total_dots_i][total_dots_j];
  dots_rotate = new dots[total_dots_i][total_dots_j];
  
  for (int i=0; i<total_dots_i; i++) {
    for (int j=0; j<total_dots_j; j++) {
      if(random){
        dots_[i][j] = new dots( (int) random(-width/2,width/2), (int) random(-height/2,width/2) );
        dots_rotate[i][j] = new dots( (int) random(-width/2,width/2), (int) random(-height/2,width/2) );
      }
      else{
        dots_[i][j] = new dots(i*scale-width/2, j*scale-height/2);
        dots_rotate[i][j] = new dots(i*scale-width/2, j*scale-height/2);
      }
    }
  }
  stroke(0);
  strokeWeight(10);
  //frameRate(5);
}

void draw() {
  clear();
  background(100);
  translate(width/2,height/2);
  display();
  a++;
}





class dots {
  int x;
  int y;
  dots(int x, int y) {
    this.x=x; 
    this.y=y;
  }
}

void display() {
  for (int i=0; i<total_dots_i; i++) {
    for (int j=0; j<total_dots_j; j++) {
      point(dots_[i][j].x, dots_[i][j].y);
      pushMatrix();
      rotate(radians(a));
      point(dots_rotate[i][j].x, dots_rotate[i][j].y);
      popMatrix();
      }
    }
}