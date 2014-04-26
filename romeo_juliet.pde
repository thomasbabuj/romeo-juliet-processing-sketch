/* 
  Added ttslib library and including in our script.
  
  1) Using TTS speak method
  
  2) Create a Drama thread and teach processing how to read Shakespreare script
  
*/

import guru.ttslib.*;

TTS tts;
Drama drama;

void setup() {
  
  tts = new TTS();

  String[] rawLines = loadStrings("Shakespeare_script.txt");
  
  ArrayList lines = new ArrayList();
  
  for(int i=0; i<rawLines.length; i++) {   
    if( !"".equals(rawLines[i])) {
      String[] tmp = rawLines[i].split("#");
      lines.add( new Line (tmp[0], tmp[1].trim() ));              
    }
  }
  
  size(800,400);
  textFont(createFont ("MyriadPro-Bold", 24));
  drama = new Drama( lines );
}

void draw() {
  
  background(255);
  textAlign(CENTER);
  fill(0);  
  text ("Click here for Drama", width/2, height/2);
}

void mousePressed() {    
  if (!drama.isRunning()) {      
      drama.start();
  } 
}
