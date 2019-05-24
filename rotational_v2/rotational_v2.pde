int lower = 540, higher = 1080;
float r_outer = (int)random(1, 540);  //radius of outer circle
float r_inner = (int)random(1, r_outer);  //radius of inner circle
float inner_distance = (int)random(1, r_inner);  //distance of dot from edge of inner circle
float d1 = 1;              //angular velocity of inner circle
float d2 = r_outer/r_inner; //angular velocity of drawing dot
int x, y;   //coordinates of point
int recorderx, recordery;  //to check at the end of shape
int time = 1;
int time_increase_rate=1;
boolean gona_save=false;
boolean last=false;
boolean show_circles=false;
IntList all_x, all_y;
float R, G, B;

public void setup() { 
  //fullScreen();
  size(800, 800);
  background(0);
  R=random(0, 255);
  G=random(0, 255);
  B=random(0, 255);
  stroke(R, G, B);
  noFill();
  ellipseMode(RADIUS);  //For some reason circle(int,int,int) doesn't work. I will use ellipse instead
  //frameRstate(24);
  all_x= new IntList();
  all_y= new IntList();
  x = x1(0); 
  y = y1(0);
  recorderx = x;
  recordery = y;
  println(x, y);
  strokeWeight(3);
}


public void draw() {
  translate(width/2, height/2);
  for (int i=0; i<time_increase_rate; i++) {
    x = x1(time+i);
    y = y1(time+i);
    if (x == recorderx && y == recordery) {
      //redraw without circles
      background(0);
      for (int j=1; j<=time; j++) {
        line(all_x.get(j-1), all_y.get(j-1), all_x.get(j), all_y.get(j));
      }
      if (gona_save) {
        save(r_inner+"_"+inner_distance);
        gona_save = !gona_save;
      }
      last = true;
      all_x.clear();
      all_y.clear();
      r_outer = random(1, 500);
      r_inner = random(1, r_outer);
      inner_distance = random(1, r_inner);
      d1 = 1;
      d2 = r_outer/r_inner;
      x = x1(0); 
      y = y1(0);
      recorderx = x;
      recordery = y;
      time = 1;
      R=random(0, 255);
      G=random(0, 255);
      B=random(0, 255);
      stroke(R, G, B);
      return;
    }
  }
  if (show_circles) {
    background(0);
    //draws both circles which causes these shapes
    stroke(150, 0, 0);
    ellipse(0, 0, r_outer, r_outer); 
    ellipse((int)(cos(radians(time*d1))*(r_outer-r_inner)), -(int)(sin(radians(time))*(r_outer-r_inner)), r_inner, r_inner);
    line((int)(cos(radians(time*d1))*(r_outer-r_inner)), -(int)(sin(radians(time))*(r_outer-r_inner)), all_x.get(time), all_y.get(time));
    //draws shape from start
    stroke(R, G, B);
    for (int i=1; i<=time; i++) {
      line(all_x.get(i-1), all_y.get(i-1), all_x.get(i), all_y.get(i));
    }
  } else {
    line(all_x.get(time-1), all_y.get(time-1), all_x.get(time), all_y.get(time));
  }
  time+=time_increase_rate;
  if (last) {
    last = !last;
    clear();
  }
}

int x1(int t) {
  int new_x = (int)(cos(radians(t*d1))*(r_outer-r_inner) + cos(radians(t*d2))*(inner_distance));
  all_x.append(new_x);
  return new_x;
}

int y1(int t) {
  int new_y = (int)(-sin(radians(t*d1))*(r_outer-r_inner) - sin(radians(t*d2))*(inner_distance));
  all_y.append(new_y);
  return new_y;
}
void save() {
}
void restart() {
}
void keyPressed() {
  if (key == 's') {
    gona_save=true;
  } else if (key == '+') {
    time_increase_rate+=1;
  } else if (key == '-') {
    if (time_increase_rate!=1) {
      time_increase_rate-=1;
    }
  } else if (key == 'r') {
    background(0);
    last = true;
    all_x.clear();
    all_y.clear();
    r_outer = random(1, 540);
    r_inner = random(1, r_outer);
    inner_distance = random(1, r_inner);
    d1 = 1;
    d2 = r_outer/r_inner;
    x = x1(0); 
    y = y1(0);
    recorderx = x;
    recordery = y;
    time = 1;
    R=random(0, 255);
    G=random(0, 255);
    B=random(0, 255);
    stroke(R, G, B);
  } else if (key == ' ') {
    show_circles=true;
  }
  if (key=='b') {
    background(0);
    stroke(R, G, B);
    for (int i=1; i<time; i++) {
      line(all_x.get(i-1), all_y.get(i-1), all_x.get(i), all_y.get(i));
    }
    show_circles=false;
  }
}
