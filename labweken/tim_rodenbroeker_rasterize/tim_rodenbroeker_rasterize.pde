// Code based on my rasterization-tutorial 
// https://timrodenbroeker.de/rasterize
// Enjoy! :-)
// Tim Rodenbröker 
// 2019 
import processing.serial.*; 
Serial myPort;






PImage img; 

void setup() {
  size(500, 500);
  img = loadImage("venus.jpg");
  img.resize(500, 500);
  
  
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('\n');
}



void draw() {
  
  
  int readValue = myPort.read();
  println(readValue);
  
  
  
  
  background(255);
  fill(0);
  noStroke();
  float tiles = mouseX/7;
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
