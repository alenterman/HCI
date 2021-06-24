const int echoPin = 6;
const int trigPin = 7;

void setup() {
  pinMode(echoPin, INPUT);
  pinMode(trigPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  // send a pulse
  digitalWrite(trigPin, LOW);
  delayMicroseconds(10);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // wait for the echo
  long duration = pulseIn(echoPin, HIGH);
  // convert the time into a distance, the speed of sound is 29 microseconds per centimeter,
  //the pulse traveled forth and back, so we divided the distance by 2
  int cm = duration / 29 / 2;
  Serial.println(cm);
  delay(250);
}
