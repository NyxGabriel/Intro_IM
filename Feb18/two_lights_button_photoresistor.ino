
//initialize used ports = easier to work with
//
int push_button = 12;
int light1 = 5;
int light2 = 6;
int pressed = 0;
int c = 0;
int map_light;
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
  
  //delay(1);
  map_light = map(photo_state, 0, 1023, 0, 255);
  map_light = constrain(map_light, 0, 255);
  Serial.println(map_light); //print photoresistor values to check whats it is detecting
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
    digitalWrite(light1, HIGH); //the lights will be bright
    analogWrite(light2, 200);
    if (map_light < 210  && map_light>180)
    {
      //the lights will be dim
      analogWrite(light2, 10);
      digitalWrite(light1,LOW);
    }
  }
  else //if the button is not pushed the lights will be off.
  {
    digitalWrite(light1, LOW);
    analogWrite(light2, 0);
  }
  if (map_light <= 180) {
    digitalWrite(light1, LOW); 
    blink(200, light2); // S
    blink(200, light2); 
    blink(200, light2); 
    blink(500, light2); //O
    blink(500, light2); 
    blink(500, light2); 
    blink(200, light2); // S
    blink(200, light2); 
    blink(200, light2);
    
  }
}

void blink(int sec, int light)
{
  digitalWrite(light, HIGH);
  delay(sec);
  digitalWrite(light, LOW);
  delay(sec);
}
