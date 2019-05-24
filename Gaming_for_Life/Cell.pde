

class Cell {
  int neighbours;
  int x, y;
  boolean condition = false;

  Cell(int i, int j) {
    x=i;
    y=j;
    index[i][j] = this;
    rect(i*scale, j*scale, scale, scale);
  }
}

void count() {

  for (Cell[] row : index) {
    for (Cell cell : row) {
      cell.neighbours=0;
    }
  }

  for (Cell[] row : index) {
    for (Cell cell : row) {
      if (cell.condition) { 
        for (i=-1; i<2; i++) {
          for (j=-1; j<2; j++) {
            try { 
              index[cell.x+i][cell.y+j].neighbours++;
            }
            catch(ArrayIndexOutOfBoundsException e) {
            }
          }
        }
        //it counts this too
        cell.neighbours--;
      }
    }
  }
}

void survival_of_the_fittest() {

  for (Cell[] row : index) {
    for (Cell cell : row) {
      if (cell.condition && cell.neighbours < 2) cell.condition = false;
      if (cell.condition && cell.neighbours > 3) cell.condition = false;
      if (cell.condition && (cell.neighbours == 2 || cell.neighbours == 3));//unchanced
      if (!cell.condition && cell.neighbours == 3) cell.condition = true;
    }
  }
}



void display() {
  clear();
  for (Cell[] row : index) {
    for (Cell cell : row) {
      if (cell.condition == true) {
        fill(255, 255, 0);
        rect(cell.x*scale, cell.y*scale, scale, scale);
      } else {
        fill(0);
        rect(cell.x*scale, cell.y*scale, scale, scale);
      }
    }
  }
}