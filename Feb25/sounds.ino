//#include <Keyboard.h>

#include "pitches.h"
#include <Servo.h>
Servo servo;

// Location of pins for all inputs and outputs
const int signal_out = 2;
const int signal_in = 3;
const int speakerPin = 9;
const int button = 12;

// Array for notes and index
int notes[] = {NOTE_B0, NOTE_C1 , NOTE_CS1 , NOTE_D1 , NOTE_DS1 , NOTE_E1  , NOTE_F1 , NOTE_FS1  , NOTE_G1 , NOTE_GS1  , NOTE_A1 , NOTE_AS1  , NOTE_B1  , NOTE_C2  , NOTE_CS2  , NOTE_D2   , NOTE_DS2  , NOTE_E2 , NOTE_F2 , NOTE_FS2  , NOTE_G2 , NOTE_GS2  , NOTE_A2  , NOTE_AS2  , NOTE_B2 , NOTE_C3 , NOTE_CS3 , NOTE_D3 , NOTE_DS3 , NOTE_E3  , NOTE_F3 , NOTE_FS3 , NOTE_G3 , NOTE_GS3 , NOTE_A3 , NOTE_AS3  , NOTE_B3 , NOTE_C4 , NOTE_CS4 , NOTE_D4 , NOTE_DS4 , NOTE_E4 , NOTE_F4 , NOTE_FS4 , NOTE_G4 , NOTE_GS4 , NOTE_A4 , NOTE_AS4 , NOTE_B4 , NOTE_C5  , NOTE_CS5 , NOTE_D5  , NOTE_DS5 , NOTE_E5  , NOTE_F5  , NOTE_FS5  , NOTE_G5   , NOTE_GS5  , NOTE_A5 , NOTE_AS5 , NOTE_B5 , NOTE_C6 , NOTE_CS6  , NOTE_D6  , NOTE_DS6 , NOTE_E6 , NOTE_F6 , NOTE_FS6 , NOTE_G6 , NOTE_GS6  , NOTE_A6  , NOTE_AS6 , NOTE_B6 , NOTE_C7 , NOTE_CS7 , NOTE_D7 , NOTE_DS7  , NOTE_E7 , NOTE_F7   , NOTE_FS7 , NOTE_G7  , NOTE_GS7 , NOTE_A7  , NOTE_AS7  , NOTE_B7  , NOTE_C8  , NOTE_CS8 , NOTE_D8 , NOTE_DS8};
int note;

//control of Ultrasonic sensor helper var
long duration;
long distance;

//Button into switch helper var
int count_b = 0;
int pressed = 0;

//Servo helper vars
int ser_direct = 10;


void setup() {
  //set up inputs and outputs; initialize serial monitor
  pinMode(button, INPUT);
  pinMode(signal_out, OUTPUT);
  pinMode(signal_in, INPUT);
  pinMode(speakerPin, 9);
  servo.attach(7);
  Serial.begin(9600);
}

void loop() {

  int button_state = digitalRead(button); //button state
  digitalWrite(signal_out, LOW); //restart ultrasonic
  delayMicroseconds(3);
  digitalWrite(signal_out, HIGH); //send ultrasonic sound
  delayMicroseconds(3);
  digitalWrite(signal_out, LOW); //stop ultrasonic sound
  duration = pulseIn(signal_in, HIGH); //get echo, measure distance
  distance = duration * 0.034 / 2; //calculate distance
  note = map(distance, 0, 400, 88, 0); //map distance to notes array index
  //Serial.println(note);
  note = constrain(note, 20, 88); //constrain map
  // Serial.println(note);
  Serial.println(distance); //print distance
  tone(speakerPin, notes[note], 100); //play tone correponding to this distance
  Serial.print("Note: "); //print note
  Serial.println(notes[note]);
  delay(10); //
  Serial.println(button_state);

  if (button_state) {
    for ( int i = 0 ; i <= 90 && i >= -90; i += ser_direct) { // goes from 0 degrees to 90 degrees and 0 to -90
      servo.write(i);
      Serial.println(i);
      if (i == 90 || i == -90) {
        ser_direct = -(ser_direct);
        break;
      }
      delay(1);
    }
  }
  noTone(speakerPin);
}
