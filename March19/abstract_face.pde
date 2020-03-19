void setup() {
  size(200, 200);
}
void draw() {
  //Eyes
  rect(81, 60, 5, 5, 3);
  rect(121, 61, 5, 5, 3);

  //nose
  line(97, 100, 103, 100);

  //mouth
  beginShape();
  vertex(87, 120);
  vertex(127, 120);
  vertex(99, 125);
  vertex(111, 122);
  endShape();

  //head
  //This is how stuff looks inside my head so I have put it outwards as well
  //the second component is lower so  that it is more purpulish 
  fill(int(random(0, 230)), int(random(0, 150)), int(random(0, 230)), 63);
  ellipse (120, 80, 66, 130);
}
