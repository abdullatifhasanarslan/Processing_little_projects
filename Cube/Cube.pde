
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

float eyeX = 0;
float eyeY = 500;
float eyeZ = -100;
float m = 0;

public void setup() {
  fullScreen();
  m = width/2;
  strokeWeight(0);
  start();
}


public void draw() {
  float centerX = mouseX-m;
  float centerY = mouseY-m;
  float a = sin(radians((90/m)*(width-mouseX)));
  float b = cos(radians((90/m)*(width-mouseX)));
  PVector vector = new PVector(b,a);
  PVector center = new PVector(centerX,centerY);
  vector.normalize();
  if(keyPressed){
    switch (key){
    case '8':eyeZ+=vector.y;eyeX-=vector.x;break;
    case '5':eyeZ-=vector.y;eyeX+=vector.x;break;
    case '4':eyeZ+=vector.x;eyeX+=vector.y;;break;
    case '6':eyeZ-=vector.x;eyeX-=vector.y;;break;
    case UP:eyeY++;break;
    case DOWN:eyeY--;break;}}
  camera(eyeX,eyeY,eyeZ, eyeX-center.x,eyeY+center.y,1, 0,1,0);

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
  /*case 's':  
    solve(); 
    break;*/
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



String solution;
Node tree[];
Node minimum;
int level = 0;
int backup[][][][] = new int[6][cube][cube][3];


 
public void solve(){
  
  for(int side=0;side<6;side++){
    for(int i=0;i<cube;i++){
      for(int j=0;j<cube;j++){
        for(int k=0;k<3;k++){
          backup[side][i][j][k] = Cube[side][i][j][k];
        }
      }
    }
  }

  branch = 0;
  max_branch=1;
  tree = new Node[1];
  
  boolean not_found = true;
  Node head = new Node();
  head.path = "..";
  minimum = head;
  while(not_found){
    if(minimum.Heuristic == 0) {not_found = false; break;}
    minimum.extend();
    get_least();
  }
  Cube = backup;
  solution = minimum.path;
  println(solution);
  //for(int i=0;i<solution.length()-2;i++) {Move(solution.charAt(i+2));}
}

public void get_least(){
  int min = cube*cube*6;
  for(int i=0;i<branch;i++){
    if(tree[i].Heuristic < min   &&   !tree[i].extended){
      min = tree[i].Heuristic;
      minimum = tree[i];
    } 
  }
}