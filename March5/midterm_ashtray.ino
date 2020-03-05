int LED_right = 2;
int LED_left = 12;
int left_sen  = 10;
int right_sen = 9;
int fan = 5;
int sens_covered = 0;
int multi_covered = 0;
int ishand = 0;

void setup() {
  // put your setup code here, to run once:
  pinMode(A5, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
  pinMode(left_sen, INPUT);
  pinMode(right_sen, INPUT);
  pinMode(LED_right, OUTPUT);
  pinMode(LED_left, OUTPUT);
  pinMode(fan, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  // read values from sensors
  //photoresistors
  int phs1 = analogRead(A1);
  int phs2 = analogRead(A2);
  int phs3 = analogRead(A3);
  int phs4 = analogRead(A4);
  int phs5 = analogRead(A5);

  //pressure sensors
  int lefts = digitalRead(left_sen);
  int rights = digitalRead(right_sen);

  //control fan
  ishand = handon(phs1, phs2, phs3, phs4, phs5);
  if (ishand == 0)
  {
    analogWrite(fan, 255);
  }
  else
  {
    analogWrite(fan, 0);
  }

  //turn on LED for each side of the hand
  direct;
}

//Function that checks if any sensor of comibantion of sensors is dimmed,
//and returns it to the main loop to turn on the fan
int handon (int phs1, int phs2, int phs3, int phs4, int phs5)
{
  if ((phs1 < 420) && (phs2 > 420 || phs3 > 420 || phs4 > 420 || phs5 > 420))
  {
    sens_covered = 1;
  }
  if ((phs2 < 420) && (phs1 > 420 || phs3 > 420 || phs4 > 420 || phs5 > 420))
  {
    sens_covered = 2;
  }
  if ((phs3 < 420) && (phs1 > 420 || phs2 > 420 || phs4 > 420 || phs5 > 420))
  {
    sens_covered = 3;
  }
  if ((phs4 < 420) && (phs1 > 420 || phs2 > 420 || phs3 > 420 || phs5 > 420))
  {
    sens_covered = 4;
  }
  if ((phs5 < 420) && (phs1 > 420 || phs2 > 420 || phs3 > 420 || phs4 > 420))
  {
    sens_covered = 5;
  }
  if ((phs1 < 420 && phs2 < 420) && (phs2 > 420 || phs3 > 420 || phs5 > 420))
  {
    multi_covered = 1;
  }
  if ((phs1 < 420 && phs2 < 420) && (phs2 > 420 || phs3 > 420 || phs5 > 420))
  {
    multi_covered = 1;
  }
  if ((phs3 < 420 && phs2 < 420) && (phs1 > 420 || phs3 > 420 || phs5 > 420))
  {
    multi_covered = 2;
  }
  if ((phs3 < 420 && phs4 < 420) && (phs1 > 420 || phs2 > 420 || phs5 > 420))
  {
    multi_covered = 3;
  }
  if ((phs5 < 420 && phs4 < 420) && (phs1 > 420 || phs2 > 420 || phs3 > 420))
  {
    multi_covered = 4;
  }
  if ((phs1 < 420 && phs2 < 420 && phs3 < 420) && (phs4 > 420 || phs5 > 420))
  {
    multi_covered = 5;
  }
  if ((phs2 < 420 && phs3 < 420 && phs4 < 420) && (phs1 > 420 || phs5 > 420))
  {
    multi_covered = 6;
  }
  if ((phs3 < 420 && phs4 < 420 && phs5 < 420) && (phs1 > 420 || phs2 > 420))
  {
    multi_covered = 7;
  }
  if ((phs1 < 420 && phs2 < 420 && phs3 < 420) && (phs5 > 420 || phs4 > 420))
  {
    multi_covered = 8;
  }
}

//Function to check direction of hand
//and turns on respective LED
void direct(int lefts, int rights)
{
  if (lefts == 1)
  {
    digitalWrite(LED_left, HIGH);
  }
  if (rights == 1)
  {
    digitalWrite(LED_right, HIGH);
  }
  if (lefts == 0)
  {
    digitalWrite(LED_left, LOW);
  }
  if (rights == 0)
  {
    digitalWrite(LED_right, LOW);
  }
}
// Checks
//  Serial.print("A0:");
//  Serial.println(phs1);
//  delay(10);
//  Serial.print("A1:");
//  Serial.println(phs2);
//  delay(10);
//  Serial.print("A2:");
//  Serial.println(phs3);
//  delay(10);
//  Serial.print("A3:");
//  Serial.println(phs4);
//  delay(10);
//  Serial.print("A4:");
//  Serial.println(phs5);
//  delay(10);
//  Serial.print("Left sensor ");
//  Serial.println(lefts);
//  delay(10);
//  Serial.print("RIght sensor ");
//  Serial.println(rights);
//  delay(10);
