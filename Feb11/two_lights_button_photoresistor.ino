
//initialize used ports = easier to work with
//
int push_button = 12;
int light1 = 7;
int light2 = 6;
int pressed = 0;
int c = 0;
void setup() {
  // put your setup code here, to run once:

  pinMode(push_button, INPUT);
  pinMode(light1, OUTPUT);
  pinMode(light2, OUTPUT);
  pinMode(A0, INPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  int button_state = digitalRead(push_button); //button only has on and off options
  int photo_state = analogRead(A0); //photoresistor has a range of values and I want to know what it actually is
  Serial.println(analogRead(A0)); //print photoresistor values to check whats it is detecting
  //delay(1);
  if (button_state) //if the button is pushed
  {
    pressed = 1; //the state for pressed is recorded
    c++; //add a counter
    
  }
  if (c % 2 == 0) //all divisible by 2 with no remainder = off state
  {
    pressed = 0;
    
  }
  if (pressed)
  {
    analogWrite(light1, 200); //the lights will be bright
    analogWrite(light2, 200);
    if (photo_state > 850)
    {
      analogWrite(light1, 10); //the lights will be dim
      analogWrite(light2, 10);
    }
  }
  else //if the button is not pushed the lights will be off.
  {
    analogWrite(light1, 0);
    analogWrite(light2, 0);
    }
}
