import controlP5.*;
//create new font object
PFont font;
//create GUI object
ControlP5 con;

//Initalize Sliders
int Spread_Probability = 200;
int Spread_Radius = 200;
int Social_Distance = 200;

//Size of the 'city' simulation square
int start_wCity = 400;
int end_wCity = 750;
int start_hCity = 125;
int end_hCity = 475;

//the probability of getting sick in a radius
int probRadius;
float probability;

//Social Distancing Radius
int distaRadi;

//number of people
int numPeople=10;

//Array of people
Person[] People;

//Number of Sick people to start with
int Sick = 2;


void setup() {
  size(800, 600);
  //create ControlP5 object
  con = new ControlP5(this);
  //add sliders to it 
  con.addSlider("Spread_Probability").setPosition(60, 200).setSize(250, 25).setRange(0, 100).setValue(60);
  con.addSlider("Spread_Radius").setPosition(60, 250).setSize(250, 25).setRange(1, 50).setValue(10);
  con.addSlider("Social_Distance").setPosition(60, 300).setSize(250, 25).setRange(1, 50).setValue(1);

  //Set up the title
  Title();

  //Initalize the People in an array
  People = new Person[numPeople];
  for (int i = 0; i<numPeople; i++) {
    People[i] = new Person();
  }

  //Start with # of Sick people
  for (int s=0; s<Sick; s++) {
    People[s].sick = true;
  }
}

void draw() {
  smooth();
  
  //slow down
  frameRate(10);
  background(0);
  
  
  //set the values to the slider values
  probability = Spread_Probability;
  probRadius = Spread_Radius;
  distaRadi = Social_Distance;
  
  //if (keyPressed){
    
  
  
  //Create and move people around loop, and check their neighbours 
  for (int i = 0; i<numPeople; i++) {
    People[i].Move();
    People[i].display();
    //check for neighbours loop
    for (int o = 0; o<numPeople; o++) {
      //skip self
      if (o==i) {
        o++;
      }
      //on last element exit loop, otherwise array goes out of bounds
      if (o==numPeople) {
        break;
      }
      People[i].CheckNeib(People[o].sick, People[o].xpos, People[o].ypos);
    }
  }
  
  
  //End Simulation if all people are sick
  if (Sick == numPeople) {
    EndScreen();
  }
  
  
  //call the rest of the image.
  Title();
  Legend();
  }



//Create a title
void Title() {
  String c = "Humble Interactive Simulation of Covid-19 Spread";
  fill(255, 255, 255);
  font = createFont("visitor1.ttf", 28);
  textFont(font);
  textSize(28);
  text(c, 25, 50);
}


//create a legend
void Legend() {
  //Name of Legend
  String a = "Color Legend";
  fill(255, 255, 255);
  textFont(font);
  textSize(20);
  text(a, 125, 400); 
  // Element 1 of legend - green square
  fill(0, 255, 0);
  rect(80, 425, 10, 10);
  fill(255, 255, 255);
  String g  = "Healthy Person/Covid-19 Negative";
  textSize(16);
  text(g, 100, 435);
  //Element 2 of legend - red square
  fill(255, 0, 0);
  rect(80, 445, 10, 10);
  fill(255, 255, 255);
  String r  = "Sick Person/Covid-19 Positive";
  textSize(16);
  text(r, 100, 455);
}


//Create End Screen
void EndScreen() {
  String e = "All people in your city are sick";
  fill(255, 0, 0);
  textFont(font);
  textSize(32);
  text(e, 100, 150);
}


class Person {
  //Poistion of the person 
  float xpos, ypos;
  //size of person
  int radius = 5;
  //Speed of movement
  float xspeed, yspeed;
  //Status of sickness and color represenatation
  boolean sick; 
  color colour = color(0, 255, 1);

  //Construct Person at a random location
  Person() {
    xpos = random(start_wCity, end_wCity);
    ypos = random(start_hCity, end_hCity);
  }
  
  //Move person around
  void Move() {
    //Movement speed is different all the time
    xspeed = random(-25, 25);
    yspeed = random(-25, 25);
    //Check if you go out of the bounds 
    if (xpos+xspeed>=end_wCity || xpos+xspeed<=start_wCity) {
      xspeed = -xspeed;
    }
    xpos = xpos + xspeed;
    if (ypos+yspeed>=end_hCity || ypos+yspeed<=start_hCity) {
      yspeed = -yspeed;
    }
    ypos = ypos + yspeed;
  }

//Check if neightbour is around to social distance and 
//if they are sick to get sick with a probability
  void CheckNeib(boolean neiSick, float xnei, float ynei) {
    // Calculate distance between self and neib
    float d = dist(xpos+radius, ypos+radius, xnei+radius, ynei+radius);
    
    //if they are too close to you move away
    if (d<=distaRadi) {
      //change direction if there is a person around
      xspeed = -xspeed;
      yspeed = -yspeed;
    } 
    
    //if they are sick and in raidus of spread and you arent 
    //maybe get sick
    if (d<=probRadius && neiSick == true && sick == false) {
      //calculate probability of getting sick
      float willSick = random(1);
      //if the chance is smaller than the probability geet sick
      if (willSick<(probability/100)) {
        sick = true;
        Sick=Sick+1;
        colour = color(255, 0, 0);
      }
    }
  }

  void display() {
    //change color if sick
    if (sick) {
      colour = color (255, 0, 0);
    }
    //draw person
    fill(colour);
    rect(xpos, ypos, radius, radius);
  }
}