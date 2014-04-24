/* 
  Added ttslib library and including in our script.
  
  1) Using TTS speak method
*/

import guru.ttslib.*;

TTS tts;

void setup() {
  // creating new tts object
  tts = new TTS();
}

void draw() {
 
}

void mousePressed() {
  tts.speak("Hello thomas, how are u doing");
}
