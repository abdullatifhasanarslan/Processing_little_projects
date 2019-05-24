void drawing_screen() {
  if (image!=null && image_not_shown) {
    image(image, 0, 0);
    image_not_shown = !image_not_shown;
  }
  y++;
  if (R>255||R<0)Ri = !Ri;
  if (G>255||G<0)Gi = !Gi;
  if (B>255||B<0)Bi = !Bi;
  if (mousePressed) {
    if (Ri)R+=0.2;
    else R-=0.2;
    if (Gi)G+=0.7;
    else G-=0.7;
    if (Bi)B+=0.11;
    else B-=0.11;
    stroke(R, G, B);
    translate(width/2, height/2);
    int x = mouseX-width/2, px = pmouseX-width/2;  
    int y = mouseY-height/2, py = pmouseY-width/2;
    for (i=0; i<times; i++) {
      line(x, y, px, py+420);
      rotate((2*PI)/times);
    }
  }
}