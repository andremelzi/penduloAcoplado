import processing.serial.*;

Serial myPort;
int xPos0 = 1;
int xPos1 = 1;

int lastxPos0 = 1;
int lastheight0 = 0;
int lastxPos1 = 1;
int lastheight1 = 0;

void setup () {
  size(900, 400);        

  myPort = new Serial(this, Serial.list()[5], 9600);
  myPort.bufferUntil('\n');
  background(0);
}

void draw () {

}

void serialEvent (Serial myPort) {

  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    int[] inString2 = int(split(inString," "));
    float[] inByte = float(inString2);
    
    inByte[0] = map(inByte[0], 500, 700, 0, height);
    inByte[1] = map(inByte[1], 500, 700, 0, height);

    stroke(127,34,255);
    strokeWeight(4);
    line(lastxPos0, lastheight0, xPos0, (height - inByte[0])); 
    lastxPos0 = xPos0;
    lastheight0 = int(height-inByte[0]);
    
    stroke(255,50,120);
    strokeWeight(4);
    line(lastxPos1, lastheight1, xPos1, (height - inByte[1]));
    lastxPos1 = xPos1;
    lastheight1 = int(height-inByte[1]);
    
    if (xPos0 >= width || xPos1 >= width) {
      xPos0 = 0;
      lastxPos0 = 0;
      xPos1 = 0;
      lastxPos1 = 0;
      background(0);
    } 
    else {
      xPos0 = xPos0 + 2;
      xPos1 = xPos1 + 2;
    }
  }
}
