long times =10;

int i;
int y;
int scale= 1;
int[][] kayit = new int[1000][2];
float R=255, G=100, B=0;
boolean Ri=true, Gi=true, Bi=true;
PImage image;
boolean image_not_shown = true;
boolean drawingScreen = true;
//colorPicker o;

void setup() {
  fullScreen();
  background(0);
  strokeWeight(scale);
  cursor(CROSS);
  //o = new colorPicker();
}

void draw() {
  //if(drawingScreen)  
  drawing_screen();
  //else               setting_screen();
}






void keyPressed() {
  if (drawingScreen == true) {
    if (key == 'c')clear();
    if (key == 's')save("save"+y);
    if (key == 'o')selectInput("Choose an image", "fileSelected");
    if (key == 't')drawingScreen = !drawingScreen;
  }
}

void fileSelected(File selection) {
  if (drawingScreen == true) {
    if (selection != null) {
      image=loadImage(selection.getAbsolutePath());
      image_not_shown = true;
    }
  }
}
