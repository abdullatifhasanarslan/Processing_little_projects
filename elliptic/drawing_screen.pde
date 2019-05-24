int lx= (int)random(-200, 200), ly= (int)random(-200, 200);
int x, y;
int cx, cy;
int differ=20;
int differc = 30;
float distance;


void drawing_screen() {
  if (R>255||R<0)Ri = !Ri;
  if (G>255||G<0)Gi = !Gi;
  if (B>255||B<0)Bi = !Bi;
  if (Ri)R+=0.2;
  else R-=0.2;
  if (Gi)G+=0.7;
  else G-=0.7;
  if (Bi)B+=0.11;
  else B-=0.11;
  stroke(R, G, B);
  translate(width/2, height/2);

  x = lx + (int)random(-differ, differ);
  y = ly + (int)random(-differ, differ);

  cx = x + (int)random(-differc, differc);
  cy = y + (int)random(-differc, differc);

  for (i=0; i<times; i++) {
    beginShape();
    vertex(lx, ly);
    quadraticVertex(cx, cy, x, y);
    endShape();
    rotate((2*PI)/times);
  }
  lx=x;
  ly=y;
  distance = sqrt(pow(x, 2)+pow(y, 2));
  if (distance >= 100) {
    differ = (int)(distance*0.1) ;
    differc = (int)(distance*0.1);
  }
}