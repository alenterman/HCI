import processing.serial.*;
Serial myPort;
String sensorReading="";
void setup() {
  size(400, 400);
  myPort = new Serial(this, Serial.list()[2], 9600); // instead of 5, choose what ever
  //serial port the Arduino connects to
    myPort.bufferUntil('\n');
}
void draw() {
  background(255);
  fill(0);
  text("Sensor Reading: " + sensorReading, 20, 20);
  ellipse(width/2, height/2, float(sensorReading), float(sensorReading));
}
void serialEvent (Serial myPort) {
  sensorReading = myPort.readStringUntil('\n');
}
