//This program uses a data set form all the Pokemon in the game PokemonGo
//and it shows how many pokemon there are from a few types. 
//The user is asked to select a type and then the number of pokemon with
//such first and second type are shown. When two types are eselected the
//number of pokemon with both types are shown.

//Nicole Dobreva, 14th April, Data Visualization Assigment
//Instructions:
//Choose a type of pokemon by pressing a button on the screen.
//Credit to ControlP5 for the GUI. 
//And to Rounak Banik for the dataset. 
//And to Kaggle for storing the dataset.

import controlP5.*;
ControlP5 cp5;

Table table; //Table to read the file
String type1; //Type of Pokemon
String type2; //Type of Pokemon
String type_old=" "; //Type of Pokemon
String type; //Type of Pokemon
int count1=0; //Counter for the same type
int count2=0;  //Counter for the same type
int count3=0;  //Counter for the same type

float numPoke; //Number of Pokemon
color c; //Color of graph

boolean pressed= false; //the button state
float fraction; //calculation varibale

void setup() { 
  size(1000, 800);

  cp5 = new ControlP5(this); //initalize GUI


  Buttons(cp5); //Create Buttons

  table = loadTable("pokemon.csv", "header"); //Load data into table
  //get number of pokemon the the table
  for (TableRow row : table.rows())
  {
    numPoke= int(row.getString("pokedex_number"));
  }
}

void draw() {
  background(0);
  
  //Title text
  fill(255,255,255);
  textSize(36);
  text("Pokemon Type Counter", 530,550);
  textSize(20);
  text("There are ", 555, 580);
  String n = nf(numPoke);
  text(n, 650,580);
  text("Pokemon in total.", 690,580);
  textSize(20);
  text("How many Pokemon with this first type?", 50, 50);
  text("How many Pokemon with this second type?", 50, 450);
  text("How many Pokemon with these both types?", 500, 50);

  //If buttons are pressed 
  if (pressed == true) {
    //read table and count types
    ReadData(table, type, type_old);
    //get the right color
    c = CheckType (type);
    //save the old type
    type_old = type;
  }
  //Create Graphs
  pie();
  Graph(numPoke, count1, c);
  pushMatrix();
  translate(0, 300);
  pie();
  Graph(numPoke, count2, c);
  popMatrix();
  pushMatrix();
  translate(450, 0);
  pie();
  Graph(numPoke, count3, c);
  popMatrix();
}
//Initial Graph Circle 
void pie() {
  fill(100, 100, 100);
  stroke(255, 255, 255);
  arc(190, 300, 160, 160, 0, 2*PI);
  textSize(14);
  text("All Pokemon", 150, 350);
}


//Graph data
void Graph(float numPoke, float count, color c) {
  //calcualte what percent of pokemon are this type
  float fraction = (count/numPoke);
  float deg = fraction*360;
  //turn into radiants 
  float rad_per =radians(deg);
  //Create Graph
  stroke(255, 255, 255);
  fill(c);
  arc(190, 300, 160, 160, 0, rad_per, PIE);
  String n=nf(count); //to show number 
  textSize(28);
  text(n, 300, 370);
  //Show you have finished 
  pressed=false;
}

//listen for events from buttons
public void controlEvent(ControlEvent theEvent) {
  //show button is prssed
  pressed=true;
  //get the type in the button pressed 
  type = theEvent.getController().getName();
}
//Count the number of pokemon from each desired type
void ReadData(Table table, String type, String type_old) {
  //restart counters 
  count1 =0;
  count2=0;
  count3=0;

  //for every element in the table
  for (TableRow row : table.rows())
  {
    //get the column that has the type 1
    type1= row.getString("type1");
    //find all matches 
    if (type.equals(type1)==true) {
      //increase counter
      count1++;
    }
  //get the column that has the type 2
    type2= row.getString("type2");
    //find all matches
    if (type.equals(type2)==true) {
      //increase counter
      count2++;
    }
    //if the current and old type match
    if (type.equals(type2)==true && type_old.equals(type1)==true) {
      //increase the counter
      count3++;
    }
  }
}
//Check the type of button pushed in order to create right color
color CheckType (String type) {
  color c = color(0, 0, 0);
  if (type.equals("fire")) {
    c = color(255, 0, 0);
  }
  if (type.equals("ice")) {
    c = color(0, 0, 255);
  }
  if (type.equals("grass")) {
    c = color(0, 115, 25);
  }
  if (type.equals("fairy")) {
    c = color(255, 182, 193);
  }
  if (type.equals("normal")) {
    c = color(220, 220, 220);
  }
  if (type.equals("rock")) {
    c = color(150, 75, 0);
  }
  if (type.equals("bug")) {
    c = color(0, 255, 0);
  }
  if (type.equals("psychic")) {
    c = color(241, 115, 234);
  }
  if (type.equals("dragon")) {
    c = color(4, 11, 133);
  }
  if (type.equals("flying")) {
    c = color(4, 11, 255);
  }
  if (type.equals("steel")) {
    c = color(0, 102, 102);
  }
  if (type.equals("ghost")) {
    c = color(51, 0, 102);
  }
  return c;
}

//Create buttoms from ControlP5 GUI
void Buttons(ControlP5 cp5) {
  //Colors for Fire button
  CColor Fire = new CColor();
  Fire.setBackground(color(255, 0, 0));
  //Fire Button
  cp5.addButton("fire").setPosition(150, 100).setColor(Fire).setId(1);

  //Colors for Ice
  CColor Ice = new CColor();
  Ice.setBackground(color(0, 0, 255));
  //Ice Button
  cp5.addButton("ice").setPosition(230, 100).setColor(Ice).setId(2);

  //Colors for Grass
  CColor Grass = new CColor();
  Grass.setBackground(color(0, 115, 25));
  //Grass Button
  cp5.addButton("grass").setPosition(310, 100).setColor(Grass).setId(3);

  //Colors for Fairy
  CColor Fairy = new CColor();
  Fairy.setBackground(color(255, 182, 193));
  //Fairy Button
  cp5.addButton("fairy").setPosition(390, 100).setColor(Fairy).setId(4);

  //Colors for Normal
  CColor Normal = new CColor();
  Normal.setBackground(color(220, 220, 220));
  //Norml Button
  cp5.addButton("normal").setPosition(150, 140).setColor(Normal).setId(5);

  //Colors for Rock
  CColor Rock = new CColor();
  Rock.setBackground(color(150, 75, 0));
  //Rock Button
  cp5.addButton("rock").setPosition(230, 140).setColor(Rock).setId(6);

  //Colors for Psychic
  CColor Psy = new CColor();
  Psy.setBackground(color(241, 115, 234));
  //psy Button
  cp5.addButton("psychic").setPosition(310, 140).setColor(Psy).setId(7);

  //Colors for dragon
  CColor Dragon = new CColor();
  Dragon.setBackground(color(4, 11, 133));
  //dragon Button
  cp5.addButton("dragon").setPosition(390, 140).setColor(Dragon).setId(8);

  //Colors for flying
  CColor flying = new CColor();
  flying.setBackground(color(4, 11, 255));
  //flying Button
  cp5.addButton("flying").setPosition(150, 180).setColor(flying).setId(9);

  //Colors for bug
  CColor Bug = new CColor();
  Bug.setBackground(color(0, 255, 0));
  //bug Button
  cp5.addButton("bug").setPosition(230, 180).setColor(Bug).setId(10);
  
  //Colors for steel
  CColor Steel = new CColor();
  Steel.setBackground(color(0, 102, 102));
  //bug Button
  cp5.addButton("steel").setPosition(310, 180).setColor(Steel).setId(11);
  
  //Colors for steel
  CColor Ghost = new CColor();
  Ghost.setBackground(color(51, 0, 102));
  //bug Button
  cp5.addButton("ghost").setPosition(390, 180).setColor(Ghost).setId(11);
}