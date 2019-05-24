int times = (int)random(2,30);
int i;
int u;
int p;
int scale= 1;
float R=255, G=100, B=0;
boolean Ri=true, Gi=true, Bi=true;
boolean drawingScreen = true;

void setup() {
  //fullScreen();
  size(1000,600);
  frame.setResizable(true);
  background(0);
  frameRate(20);
  strokeWeight(scale);
    noFill();
  //o = new colorPicker();
}

void draw() {
  p++;
  if(drawingScreen)  drawing_screen();
}






void keyPressed() {
  if (drawingScreen == true) {
    if (key == 'c'){clear();times = (int)random(2,30);lx= (int)random(-200, 200); ly= (int)random(-200, 200);}
    if (key == 's')save("save"+y);
  }
}