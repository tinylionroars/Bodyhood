// Code for sensing a switch status and writing the value to the serial port

int switchPin = 4;  // Switch connected to pin 4 
 
void setup() { 
  pinMode(switchPin, INPUT);  // Set pin 0 as an input 
  Serial.begin(9600);         // Start serial communication at 9600 bps
  Serial.println("Hello Computer"); 
} 
 
void loop() {
  Serial.println("Hello Computer");  
  if (digitalRead(switchPin) == HIGH) {  // If switch is ON, 
    Serial.write(1);                     // send 1 to Processing
    Serial.println(1);
  } else {                               // If the switch is not ON,
    Serial.write(0);                     // send 0 to Processing 
    Serial.println(0);
  }
  delay(100);                            // Wait 100 milliseconds 
} 
