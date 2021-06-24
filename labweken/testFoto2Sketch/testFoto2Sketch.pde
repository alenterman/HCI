import processing.serial.*;  
PImage PB_100;
PImage PB_CB;
Serial myPort;  
String data="" ;
int distance;
float transparency = 1;
float increase = 2;
int white = 255;
 
 
void setup() {
  size(595, 842); // size of processing window
  PB_100 = loadImage("diy.png");
  PB_CB = loadImage("foto2.png");
  
  PB_100.resize(595, 842);
  PB_CB.resize(595, 842);
  
  background(255);
  
 
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('\n');
}

 
void draw() {
  
  int readValue = myPort.read();
  println(readValue);
  
  transparency=map(readValue, 3, 45, 0, 255);
  
  println(distance);
  image(PB_100, 0, 0); // 100
  
  tint(white, transparency);
  image(PB_CB, 0, 0); // CB
  
  transparency = transparency + increase;
  
  if (distance >= 150) {
    
    if (transparency <= 0) {   
    increase = increase * -1;
  }
  }
  
  if (distance <= 149) {
    
    if (transparency >=255) {   
    increase = increase * -1;
  }
  }
}

void serialEvent(Serial myPort) {
 
  data=myPort.readStringUntil('\n');
  distance=int(trim(data));
}
