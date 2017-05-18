/**
 *  On Raspberry Pi: increase your GPU memory, to avoid
 *  OpenGL error 1285 at top endDraw(): out of memory
 */

// GPIO numbers refer to different phyiscal pins on various boards
// On the Raspberry Pi GPIO 4 is physical pin 7 on the header
// see setup.png in the sketch folder for wiring details

import gohai.glvideo.*;
import processing.io.*;

GLMovie video;
GLMovie wait;

void setup() {
  size(1280, 720, P2D);
  video = new GLMovie(this, "UnravelGlitchHarsh.mp4");
  video.loop();
  
  wait = new GLMovie(this, "WAITING--Syn.mp4");
  wait.loop();
  
  GPIO.pinMode(4, GPIO.INPUT);
}

void draw() {
  video.read();
  // sense the input pin
  if (GPIO.digitalRead(4) == GPIO.HIGH) {
    image(wait, 0, 0, width, height);
  } else {
    image(video, 0, 0, width, height);
  }    
}