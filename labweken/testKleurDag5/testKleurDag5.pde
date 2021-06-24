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
  
  if (float(readValue) < 6){
    fill(250, 81, 62);
  } 
  else if ((float(readValue) > 5) && (float(readValue) < 11)){
    fill(250, 81, 62, 50);
  }
  else  if ((float(readValue) >10) && (float(readValue) < 18)){
    fill(247, 244, 67);
  }
  else  if ((float(readValue) >17) && (float(readValue) < 23)){
    fill(247, 244, 67, 50);
  }
  
  //if (float(readValue) < 15){
  //  fill(247, 244, 67);
  //} else if (float(readValue) < 20 ){
  //  fill(247, 244, 67, 50);
  //}
  
  //if (float(readValue) < 25){
  //  fill(117, 224, 101);
  //} else if (float(readValue) < 30 ){
  //  fill(117, 224, 101, 50);
  //}
  
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
