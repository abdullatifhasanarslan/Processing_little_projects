int lower = 540, higher = 1080;
int r_o = 1080/2;
//int r_o = (int)random(lower,higher);
int r_i = (int)random(0, r_o);//(int)random(50,diameter_outside);
int i_d = (int)random(0, r_i);//(int)random(10,diameter_outside0);
int angle1 = 0, angle2 = 0;
int d1 = (int)random(1, 30), d2 = (int)random(1, 40);
int x = x1(0), y = y1(0);
int recorderx = x1(0), recordery = y1(0);
int time = 1;
float R=255, G=100, B=0;
boolean Ri=true, Gi=true, Bi=true;
int u=0;
boolean gona_save=false;
boolean last=false;

public void setup() {
  fullScreen();
  //size(800,800);
  background(0);
  stroke(255);
  fill(255);
  //frameRstate(24);
  
  println(x, y);
  strokeWeight(3);
}


public void draw() {
  u++;
    //if (R>255||R<0)Ri = !Ri;
    //if (G>255||G<0)Gi = !Gi;
    //if (B>255||B<0)Bi = !Bi;
    //if (Ri)R+=0.2;
    //else R-=0.2;
    //if (Gi)G+=0.7;
    //else G-=0.7;
    //if (Bi)B+=0.11;
    //else B-=0.11;
    //stroke(R, G, B);


  translate(width/2, height/2);
  line(x, y, x1(time), y1(time));
  if(last){
    last = !last;
    clear();}
  x = x1(time);
  y = y1(time);
  time++;

  if (x == recorderx && y == recordery) {
    line(x, y, x1(time), y1(time));
    if (gona_save) {
      save(r_i+"_"+i_d+"_"+d1+"_"+d2);
      gona_save = !gona_save;
    }
    last = true;
    r_i = (int)random(0, r_o);
    i_d = (int)random(0, r_i);
    d1 = (int)random(1, 100); 
    d2 = (int)random(1, 100);
    recorderx = x1(0);
    recordery = y1(0);
    x = x1(0); 
    y = y1(0);
    time = 1;
    stroke(random(0, 255), random(0, 255), random(0, 255));
  }
}

int x1(int t) {
  return (int)(cos(radians(t*d1))*(r_o-r_i) + cos(radians(t*d2))*(i_d));
}

int y1(int t) {
  return (int)(sin(radians(t*d1))*(r_o-r_i) + sin(radians(t*d2))*(i_d));
}  
void keyPressed() {


  if (key == 's')gona_save=true;
}