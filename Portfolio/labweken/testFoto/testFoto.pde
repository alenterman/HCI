import processing.serial.*;
PImage diy;
Serial myPort;
String sensorReading="";

void setup() {
  size(400, 400);
  myPort = new Serial(this, Serial.list()[2], 9600); // instead of 5, choose what ever serial port the Arduino connects to
  myPort.bufferUntil('\n');
  diy= loadImage("diy.png");
  imageMode(CENTER);
}

void draw() {
  background(0);
  image(diy,width/2,height/2,val,val);
  if(arduino.available()>0){
    serialIn=arduino.read();
    printIn(serialIn);   
  }
  val=int(map(serialIn,0,50,100,500));
  //text("Sensor Reading: " + sensorReading, 20, 20);
  //ellipse(width/2, height/2, float(sensorReading), float(sensorReading));
}

void serialEvent (Serial myPort) {
  sensorReading = myPort.readStringUntil('\n');
}
