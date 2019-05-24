PImage pixy;
int scale = 10;
void setup() {
  selectInput("Select a file to process:", "fileSelected");
  fullScreen();
}

void draw() {
  if (pixy!=null)image(pixy, 0, 0);
}
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    Pixelize(selection);
  }
}

void Pixelize(File image) {
  pixy = loadImage(image.getAbsolutePath());
  pixy.loadPixels();

  int i, j;
  int x, y;
  int tr=0, tg=0, tb=0;
  int c;
  float r, g, b;
  int pix=pixy.width-pixy.width%scale, piy=pixy.height-pixy.height%scale;
  int pff = pixy.width;
  for (j=0; j<pff*piy; j+=pff*scale) {
    for (i=0; i<pix; i+=scale) {
      for (x=0; x<scale; x++) {
        for (y=0; y<scale*pff; y+=pff) {
          c = pixy.pixels[i+x+j+y];
          r=red(c);
          g=green(c);
          b=blue(c);
          tr+=r;
          tg+=g;
          tb+=b;
      
        }
      }
      r=tr/(scale*scale);
      g=tg/(scale*scale);
      b=tb/(scale*scale);
      tr=0;
      tg=0;
      tb=0;
      for (x=0; x<scale; x++) {
        for (y=0; y<scale*pff; y+=pff) {
          pixy.pixels[i+x+j+y] = color(r, g, b);
        }
      }
    }
  }
  pixy.updatePixels();
}