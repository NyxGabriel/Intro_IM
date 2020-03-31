int radius = 100;
int numPoints = 500;
void setup() {
  size(500, 500);
  smooth();
  CrazyCircles(radius, numPoints);
}
void CrazyCircles(int radius, int numPoints) {
  //x coordinate of translation
  for (int x =radius+25; x<width; x+=(2*radius+50))
  {
    //y coordinate of translation
    for (int y=radius+25; y<height; y+=(2*radius+50)) {
      println(x);
      pushMatrix();
      translate(x, y);
      linesInCircles(radius, numPoints);
      popMatrix();
    }
  }
}

void linesInCircles (int radius, int numPoints) {
  int xyCo[] = new int [numPoints*2];
  //Create coordinates for all the line beginnings and end on random
  for (int coo=0; coo<numPoints*2; coo++)
  {
    xyCo[coo]= int(random(0, TWO_PI));
  } 
  //draw the lines using the generated cooprdinates 
  for (int coo=0; coo<numPoints; coo+=2)
  {
    //if we are at the last element of the array dont draw 
    if (coo ==numPoints*2) {
      break;
    }
    line(radius*sin(xyCo[coo]), radius*cos(xyCo[coo]), -radius*sin(xyCo[coo+1]), radius*cos(xyCo[coo+1]));
  }
}
