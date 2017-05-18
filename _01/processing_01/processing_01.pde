// Read data from the serial port and change the color of a rectangle 
// when a switch connected to the board is pressed and released
 
import processing.serial.*; 
 
Serial port;                             // Create object from Serial class 
int val;                                 // Data received from the serial port 
int preVal;
 
void setup() { 
  size(200, 200); 
  frameRate(10); 
  
  //printArray(Serial.list());
  // Open the port that the board is connected to and use the same speed (9600 bps) 
  String portName = Serial.list()[0]; // replace this number with the port you are using
  port = new Serial(this, portName, 9600); 
} 

void draw() { 
  if (0 < port.available()) {    // If data is available,
    //println("reading");
    val = port.read();                   // read it and store it in val
  }
  //print(val);
  background(255);                       // Set background to white
  if (val == 0)  {     // If the serial value is 0 & isn't the same as the last frame
    fill(0);                             // set fill to black
  } else {                               // If the serial value is not 0,
    fill(204);                           // set fill to light gray
  } 
  rect(50, 50, 100, 100);
  
  preVal = val;                          // Previous frame value
}