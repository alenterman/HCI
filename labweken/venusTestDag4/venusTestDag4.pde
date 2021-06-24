//Bron:
//https://www.youtube.com/watch?v=XO8u0Y75FRk


import processing.serial.*;
Serial myPort;
PImage img;
String readValue;

void setup() {
 size(500, 500);
 img = loadImage("venus.jpg");
 img.resize(500, 500);
 
 myPort = new Serial(this, Serial.list()[2], 9600); // instead of 5, choose what ever serial port the Arduino connects to
 myPort.bufferUntil('\n');
}

void draw() {
  

  println(readValue);
  
  background(255);
  fill(0);
  noStroke();

  float tiles = float(readValue)*2;
  
  float tileSize = width/tiles;
  translate(tileSize/2,tileSize/2);
  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      color c = img.get(int(x*tileSize),int(y*tileSize));
      float size = map(brightness(c),0,255,tileSize,0);    
      ellipse(x*tileSize, y*tileSize, size, size);
    }
  }
  
  
}

void serialEvent (Serial myPort) {
 readValue = myPort.readStringUntil('\n');

}
