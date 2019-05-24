int i, j;
int scale = 50;
int horizantal = 1920/scale;
int vertical = 1080/scale;
boolean time_is_flowing = false; 
Cell[][] index = new Cell[horizantal][vertical]; 
Cell[][] increaser;


public void setup() {
  fill(0);
  fullScreen();
  //translate(width/2, height/2);
  stroke(0);
  for (i=0; i<horizantal; i++) {
    for (j=0; j<vertical; j++) {
      new Cell(i, j);
    }
  }
}


public void draw() {
  count();
  if (time_is_flowing)  survival_of_the_fittest();
  display();
}


void mouseClicked() {
  if (mouseButton == LEFT) {
    index[mouseX/scale][mouseY/scale].condition = !index[mouseX/scale][mouseY/scale].condition;
  }
}

public void keyPressed() {
  if (key == ESC)  exit();
  else if (key == 's') time_is_flowing = !time_is_flowing;
}

//public void mouseWheel(MouseEvent event) {
//  int e = event.getCount();
//  int multi = 5;
//  if (scale != multi)  scale -= e*multi;
//  if (scale == 5) {
//    if (e < 0)  scale -= e*multi;
//  }
//  if (scale > 0) {
//    if (e > 0) {
//      increaser = index;
//      horizantal = 1920/scale;
//      vertical = 1080/scale;
//      index = new Cell[horizantal][vertical];


//      i=0;
//      j=0;
//      for (Cell[] row : increaser) {
//        for (Cell cell : row) {
//          index[i][j] = cell;
//          j++;
//        }
//        i++;
//      }
//      i=0;
//      j=0;
//      for (Cell[] row : index) {
//        for (Cell cell : row) {
//          if (cell == null) cell = new Cell(i, j);
//          j++;
//        }
//        i++;
//      }
//    }
//  }
//}