
int R[] = {255, 0, 0};
int W[] = {255, 255, 255};
int Y[] = {255, 255, 0};
int G[] = {0, 255, 0};
int B[] = {0, 0, 255};
int O[] = {255, 150, 0};
int cube = 3;
int scale = 50;
int white[][][] = new int[cube][cube][3];
int orange[][][] = new int[cube][cube][3];
int green[][][] = new int[cube][cube][3];
int red[][][] = new int[cube][cube][3];
int blue[][][] = new int[cube][cube][3];
int yellow[][][] = new int[cube][cube][3];

boolean threeD = false;

int Cube[][][][] = new int[6][cube][cube][3];

boolean isrotating_x = false;
float x=0;
boolean isrotating_z = false;
float z=0;
boolean isrotating_c = false;
float c=0;


public void setup() {
  //fullScreen(P3D);
  size(800,500);  
  strokeWeight(10);
  start();
}


public void draw() {
  //rotateX(x);
  //rotateY(c);
  //rotateZ(z);
  //translate(0, 0, 30);
  if (isrotating_x) {
    x+=0.01f;
  }
  if (isrotating_z) {
    z+=0.01f;
  }
  if (isrotating_c) {
    c+=0.01f;
  }
  display();
}
public void keyPressed() {
  Move(key);
}

public void Move(char pressed) {

  switch(pressed) {
  case 'w':  
    Move_w(); 
    break;    
  case 'W':  
    Move_W(); 
    break;
  case 'o':  
    Move_o(); 
    break;
  case 'O':  
    Move_O(); 
    break;
  case 'g':  
    Move_g(); 
    break;
  case 'G':  
    Move_G(); 
    break;
  case 'r':  
    Move_r(); 
    break;  
  case 'R':  
    Move_R(); 
    break;
  case 'b':  
    Move_b(); 
    break;
  case 'B':  
    Move_B(); 
    break;
  case 'y':  
    Move_y(); 
    break;
  case 'Y':  
    Move_Y(); 
    break;
  case ' ':  
    start() ; 
    break;
  case 'x':  
    isrotating_x = !isrotating_x; 
    break;
  case 'z':  
    isrotating_z = !isrotating_z; 
    break;
  case 'c':  
    isrotating_c = !isrotating_c; 
    break;
  case 's':  
    solve(); 
    break;
  }
}


public void display() {
  clear();
  int current=0;
  if (threeD) {
    //0
    pushMatrix();
    translate(width/2, height/2, 0);
    pushMatrix();
      rotateX(radians(90));
      translate(-scale*cube/2, -scale*cube/2, scale*cube/2);
      for (int i=0; i<cube; i++) {
        for (int j=0; j<cube; j++) {
          fill(Cube[current][i][j][0], Cube[current][i][j][1], Cube[current][i][j][2]);
          rect(scale*j, scale*i, scale, scale);
        }
      }
    popMatrix();
    current++;
    //1
    pushMatrix();
      translate(-scale*cube/2, -scale*cube/2, scale*cube/2);
      for (int i=0; i<cube; i++) {
        for (int j=0; j<cube; j++) {
          fill(Cube[current][i][j][0], Cube[current][i][j][1], Cube[current][i][j][2]);
          rect(scale*j, scale*i, scale, scale);
        }
      }
    popMatrix();
    current++;
    //2
    pushMatrix();
      rotateY(radians(90));
      rotateZ(radians(90));
      translate(-scale*cube/2, -scale*cube/2, scale*cube/2);
      for (int i=0; i<cube; i++) {
        for (int j=0; j<cube; j++) {
          fill(Cube[current][i][j][0], Cube[current][i][j][1], Cube[current][i][j][2]);
          rect(scale*j, scale*i, scale, scale);
        }
      }
    popMatrix();
    current++;
    //3
    pushMatrix();
      rotateX(radians(180));
      translate(-scale*cube/2,-scale*cube/2,scale*cube/2);
      for (int i=0; i<cube; i++) {
        for (int j=0; j<cube; j++) {
          fill(Cube[current][i][j][0], Cube[current][i][j][1], Cube[current][i][j][2]);
          rect(scale*j, scale*i, scale, scale);
        }
      }
    popMatrix();
    current++;
    //4
    pushMatrix();
      rotateY(radians(-90));
      rotateZ(radians(-90));
      translate(-scale*cube/2, -scale*cube/2,scale*cube/2);
      for (int i=0; i<cube; i++) {
        for (int j=0; j<cube; j++) {
          fill(Cube[current][i][j][0], Cube[current][i][j][1], Cube[current][i][j][2]);
          rect(scale*j, scale*i, scale, scale);
        }
      }
    popMatrix();

    current++;
    //5 
    pushMatrix();
      rotateZ(radians(180));
      rotateX(radians(90));
      translate(-scale*cube/2, -scale*cube/2,scale*cube/2);
      for (int i=0; i<cube; i++) {
        for (int j=0; j<cube; j++) {
          fill(Cube[current][i][j][0], Cube[current][i][j][1], Cube[current][i][j][2]);
          rect(scale*j, scale*i, scale, scale);
        }
      }
    popMatrix();
    popMatrix();
    current=0;
  } else {
    //0
    translate(width/2-scale*cube/2, height/2-scale*cube/2);
    for (int i=0; i<cube; i++) {
      for (int j=0; j<cube; j++) {
        fill(Cube[current][i][j][0], Cube[current][i][j][1], Cube[current][i][j][2]);
        rect(scale*j, scale*i, scale, scale);
      }
    }
    current++;
    //1
    translate(0, scale*cube);
    for (int i=0; i<cube; i++) {
      for (int j=0; j<cube; j++) {
        fill(Cube[current][i][j][0], Cube[current][i][j][1], Cube[current][i][j][2]);
        rect(scale*j, scale*i, scale, scale);
      }
    }

    current++;
    //2
    translate(scale*cube, -scale*cube);
    for (int i=0; i<cube; i++) {
      for (int j=0; j<cube; j++) {
        fill(Cube[current][i][j][0], Cube[current][i][j][1], Cube[current][i][j][2]);
        rect(scale*j, scale*i, scale, scale);
      }
    }

    current++;
    //3
    translate(-scale*cube, -scale*cube);
    for (int i=0; i<cube; i++) {
      for (int j=0; j<cube; j++) {
        fill(Cube[current][i][j][0], Cube[current][i][j][1], Cube[current][i][j][2]);
        rect(scale*j, scale*i, scale, scale);
      }
    }

    current++;
    //4
    translate(-scale*cube, scale*cube);
    for (int i=0; i<cube; i++) {
      for (int j=0; j<cube; j++) {
        fill(Cube[current][i][j][0], Cube[current][i][j][1], Cube[current][i][j][2]);
        rect(scale*j, scale*i, scale, scale);
      }
    }

    current++;
    //5
    translate(scale*cube*3, 0);
    for (int i=0; i<cube; i++) {
      for (int j=0; j<cube; j++) {
        fill(Cube[current][i][j][0], Cube[current][i][j][1], Cube[current][i][j][2]);
        rect(scale*j, scale*i, scale, scale);
      }
    }
    current=0;
  }
}
public void start() {
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        white[i][j][k] = W[k];
      }
    }
  }

  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        orange[i][j][k] = O[k];
      }
    }
  }
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        green[i][j][k] = G[k];
      }
    }
  }
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        red[i][j][k] = R[k];
      }
    }
  }
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        blue[i][j][k] = B[k];
      }
    }
  }
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        yellow[i][j][k] = Y[k];
      }
    }
  }
  Cube[0]=white;
  Cube[1]=orange;
  Cube[2]=green;
  Cube[3]=red;
  Cube[4]=blue;
  Cube[5]=yellow;
}

public void Move_w() {
  int temp_front[][][] = new int[cube][cube][3];
  int temp_side[][] = new int[cube][3];
  //having backup for front
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        temp_front[i][j][k] = Cube[0][i][j][k];
      }
    }
  }

  //front face
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        Cube[0][j][cube-1-i][k] = temp_front[i][j][k];
      }
    }
  }

  //having backup for side 1-0
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      temp_side[i][k] = Cube[1][0][i][k];
    }
  }

  //1-0 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[1][0][i][k] = Cube[2][cube-1-i][0][k];
    }
  }

  //2-0 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[2][cube-1-i][0][k] = Cube[3][cube-1][cube-1-i][k];
    }
  }

  //3-0 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[3][cube-1][cube-1-i][k] = Cube[4][i][cube-1][k];
    }
  }

  //4-0 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[4][i][cube-1][k] = temp_side[i][k];
    }
  }
}

public void Move_W() {
  int temp_front[][][] = new int[cube][cube][3];
  int temp_side[][] = new int[cube][3];
  //having backup for front
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        temp_front[i][j][k] = Cube[0][i][j][k];
      }
    }
  }

  //front face
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        Cube[0][cube-1-j][i][k] = temp_front[i][j][k];
      }
    }
  }

  //having backup for side 1-0
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      temp_side[i][k] = Cube[1][0][i][k];
    }
  }

  //1-0 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[1][0][cube-1-i][k] = Cube[4][cube-1-i][cube-1][k];
    }
  }

  //4-0 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[4][cube-1-i][cube-1][k] = Cube[3][cube-1][i][k];
    }
  }

  //3-0 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[3][cube-1][i][k] = Cube[2][i][0][k];
    }
  }

  //2-0 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[2][i][0][k] = temp_side[cube-1-i][k];
    }
  }
}

public void Move_o() {
  int temp_front[][][] = new int[cube][cube][3];
  int temp_side[][] = new int[cube][3];
  //having backup for front
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        temp_front[i][j][k] = Cube[1][i][j][k];
      }
    }
  }

  //front face
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        Cube[1][j][cube-1-i][k] = temp_front[i][j][k];
      }
    }
  }

  //having backup for side 0-1
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      temp_side[i][k] = Cube[0][cube-1][i][k];
    }
  }


  //0-1 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[0][cube-1][cube-1-i][k] = Cube[4][cube-1][cube-1-i][k];
    }
  }

  //4-1 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[4][cube-1][cube-1-i][k] = Cube[5][cube-1][cube-1-i][k];
    }
  }

  //5-1 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[5][cube-1][cube-1-i][k] = Cube[2][cube-1][cube-1-i][k];
    }
  }

  //2-1 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[2][cube-1][cube-1-i][k] = temp_side[cube-1-i][k];
    }
  }
}

public void Move_O() {
  int temp_front[][][] = new int[cube][cube][3];
  int temp_side[][] = new int[cube][3];
  //having backup for front
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        temp_front[i][j][k] = Cube[1][i][j][k];
      }
    }
  }

  //front face
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        Cube[1][cube-1-j][i][k] = temp_front[i][j][k];
      }
    }
  }

  //having backup for side 0-1
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      temp_side[i][k] = Cube[0][cube-1][i][k];
    }
  }

  //0-1 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[0][cube-1][i][k] = Cube[2][cube-1][i][k];
    }
  }

  //2-1 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[2][cube-1][i][k] = Cube[5][cube-1][i][k];
    }
  }


  //5-1 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[5][cube-1][i][k] = Cube[4][cube-1][i][k];
    }
  }

  //4-1 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[4][cube-1][i][k] = temp_side[i][k];
    }
  }
}

public void Move_g() {
  int temp_front[][][] = new int[cube][cube][3];
  int temp_side[][] = new int[cube][3];
  //having backup for front
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        temp_front[i][j][k] = Cube[2][i][j][k];
      }
    }
  }

  //front face
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        Cube[2][j][cube-1-i][k] = temp_front[i][j][k];
      }
    }
  }

  //having backup for side 0-2
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      temp_side[i][k] = Cube[0][i][cube-1][k];
    }
  }

  //0-2 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[0][i][cube-1][k] = Cube[1][i][cube-1][k];
    }
  }

  //1-2 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[1][i][cube-1][k] = Cube[5][cube-1-i][0][k];
    }
  }

  //5-2 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[5][cube-1-i][0][k] = Cube[3][i][cube-1][k];
    }
  }

  //3-2 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[3][i][cube-1][k] = temp_side[i][k];
    }
  }
}

public void Move_G() {
  int temp_front[][][] = new int[cube][cube][3];
  int temp_side[][] = new int[cube][3];
  //having backup for front
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        temp_front[i][j][k] = Cube[2][i][j][k];
      }
    }
  }

  //front face
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        Cube[2][cube-1-j][i][k] = temp_front[i][j][k];
      }
    }
  }

  //having backup for side 0-2
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      temp_side[i][k] = Cube[0][i][cube-1][k];
    }
  }

  //0-2 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[0][cube-1-i][cube-1][k] = Cube[3][cube-1-i][cube-1][k];
    }
  }

  //3-2 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[3][cube-1-i][cube-1][k] = Cube[5][i][0][k];
    }
  }

  //5-2 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[5][i][0][k] = Cube[1][cube-1-i][cube-1][k];
    }
  }

  //1-2 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[1][cube-1-i][cube-1][k] = temp_side[cube-1-i][k];
    }
  }
}
public void Move_r() {
  int temp_front[][][] = new int[cube][cube][3];
  int temp_side[][] = new int[cube][3];
  //having backup for front
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        temp_front[i][j][k] = Cube[3][i][j][k];
      }
    }
  }

  //front face
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        Cube[3][j][cube-1-i][k] = temp_front[i][j][k];
      }
    }
  }

  //having backup for side 0-3
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      temp_side[i][k] = Cube[0][0][i][k];
    }
  }

  //0-3 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[0][0][i][k] = Cube[2][0][i][k];
    }
  }

  //2-3 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[2][0][i][k] = Cube[5][0][i][k];
    }
  }

  //5-3 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[5][0][i][k] = Cube[4][0][i][k];
    }
  }

  //4-3 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[4][0][i][k] = temp_side[i][k];
    }
  }
}
public void Move_R() {
  int temp_front[][][] = new int[cube][cube][3];
  int temp_side[][] = new int[cube][3];
  //having backup for front
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        temp_front[i][j][k] = Cube[3][i][j][k];
      }
    }
  }

  //front face
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        Cube[3][cube-1-j][i][k] = temp_front[i][j][k];
      }
    }
  }

  //having backup for side 0-3
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      temp_side[i][k] = Cube[0][0][i][k];
    }
  }

  //0-3 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[0][0][cube-1-i][k] = Cube[4][0][cube-1-i][k];
    }
  }

  //4-3 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[4][0][cube-1-i][k] = Cube[5][0][cube-1-i][k];
    }
  }

  //5-3 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[5][0][cube-1-i][k] = Cube[2][0][cube-1-i][k];
    }
  }

  //3-2 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[2][0][cube-1-i][k] = temp_side[cube-1-i][k];
    }
  }
}
public void Move_b() {
  int temp_front[][][] = new int[cube][cube][3];
  int temp_side[][] = new int[cube][3];
  //having backup for front
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        temp_front[i][j][k] = Cube[4][i][j][k];
      }
    }
  }

  //front face
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        Cube[4][j][cube-1-i][k] = temp_front[i][j][k];
      }
    }
  }

  //having backup for side 0-4
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      temp_side[i][k] = Cube[0][i][0][k];
    }
  }

  //0-4 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[0][cube-1-i][0][k] = Cube[3][cube-1-i][0][k];
    }
  }

  //3-4 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[3][cube-1-i][0][k] = Cube[5][i][cube-1][k];
    }
  }

  //5-4 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[5][cube-1-i][cube-1][k] = Cube[1][i][0][k];
    }
  }

  //1-4 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[1][cube-1-i][0][k] = temp_side[cube-1-i][k];
    }
  }
}
public void Move_B() {
  int temp_front[][][] = new int[cube][cube][3];
  int temp_side[][] = new int[cube][3];
  //having backup for front
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        temp_front[i][j][k] = Cube[4][i][j][k];
      }
    }
  }

  //front face
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        Cube[4][cube-1-j][i][k] = temp_front[i][j][k];
      }
    }
  }

  //having backup for side 0-4
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      temp_side[i][k] = Cube[0][i][0][k];
    }
  }

  //0-4 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[0][i][0][k] = Cube[1][i][0][k];
    }
  }

  //1-4 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[1][i][0][k] = Cube[5][cube-1-i][cube-1][k];
    }
  }

  //5-4 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[5][cube-1-i][cube-1][k] = Cube[3][i][0][k];
    }
  }

  //3-4 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[3][i][0][k] = temp_side[i][k];
    }
  }
}
public void Move_y() {
  int temp_front[][][] = new int[cube][cube][3];
  int temp_side[][] = new int[cube][3];
  //having backup for front
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        temp_front[i][j][k] = Cube[5][i][j][k];
      }
    }
  }

  //front face
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        Cube[5][j][cube-1-i][k] = temp_front[i][j][k];
      }
    }
  }

  //having backup for side 2-5
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      temp_side[i][k] = Cube[2][i][cube-1][k];
    }
  }

  //2-5 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[2][i][cube-1][k] = Cube[1][cube-1][cube-1-i][k];
    }
  }

  //1-5 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[1][cube-1][cube-1-i][k] = Cube[4][cube-1-i][0][k];
    }
  }

  //4-5 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[4][cube-1-i][0][k] = Cube[3][0][i][k];
    }
  }

  //3-5 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[3][0][i][k] = temp_side[i][k];
    }
  }
}
public void Move_Y() {
  int temp_front[][][] = new int[cube][cube][3];
  int temp_side[][] = new int[cube][3];
  //having backup for front
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        temp_front[i][j][k] = Cube[5][i][j][k];
      }
    }
  }

  //front face
  for (int i=0; i<cube; i++) {
    for (int j=0; j<cube; j++) {
      for (int k=0; k<3; k++) {
        Cube[5][cube-1-j][i][k] = temp_front[i][j][k];
      }
    }
  }

  //having backup for side 2-5
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      temp_side[i][k] = Cube[2][i][cube-1][k];
    }
  }

  //2-5 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[2][cube-1-i][cube-1][k] = Cube[3][0][cube-1-i][k];
    }
  }

  //3-5 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[3][0][cube-1-i][k] = Cube[4][i][0][k];
    }
  }

  //4-5 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[4][i][0][k] = Cube[1][cube-1][i][k];
    }
  }

  //1-5 side
  for (int i=0; i<cube; i++) {
    for (int k=0; k<3; k++) {
      Cube[1][cube-1][i][k] = temp_side[cube-1-i][k];
    }
  }
}  



int renk[] = new int[3];
int Buffer[][] = new int[2][3];

String getColor(int sticker[]){
  String buffer = "";
  if(sticker[0] == W[0] && sticker[1] == W[1] && sticker[2] == W[2] ){
    buffer = "w";
  }
  else if(sticker[0] == O[0] && sticker[1] == O[1] && sticker[2] == O[2] ){
    buffer = "o";
  }
  else if(sticker[0] == G[0] && sticker[1] == G[1] && sticker[2] == G[2] ){
    buffer = "g";
  }
  else if(sticker[0] == R[0] && sticker[1] == R[1] && sticker[2] == R[2] ){
    buffer = "r";
  }
  else if(sticker[0] == B[0] && sticker[1] == B[1] && sticker[2] == B[2] ){
    buffer = "b";
  }
  else if(sticker[0] == Y[0] && sticker[1] == Y[1] && sticker[2] == Y[2] ){
    buffer = "y";
  }
  return buffer;
} 

void getBuffer(){
  for(int k=0;k<3;k++){
    Buffer[0][k] = white[1][2][k];
    Buffer[1][k] = green[1][0][k];
  }
}
String edge_setup;
void edges(){
  //get edge_setup_moves
  switch(buffer){
    case "wr": 
      edge_setup = "rrDll";
    case "wg":
      edge_setup = "";
    case "wo": 
      edge_setup = "rrdll";
    case "wb": 
      edge_setup = "";
    case "wr": 
      edge_setup = "rrDll";
    case "wr": 
      edge_setup = "rrDll";
    case "wr": 
      edge_setup = "rrDll";
    case "wr": 
      edge_setup = "rrDll";
    case "wr": 
      edge_setup = "rrDll";
    case "wr": 
      edge_setup = "rrDll";

}
public void solve(){
  String buffer;
  buffer = getColor(Buffer[0]) + getColor(Buffer[1]);
  edges();
    
  }
  
}