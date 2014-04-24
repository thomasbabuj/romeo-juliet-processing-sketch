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
    System.out.println( !"".equals(rawLines[i]) );
    if( !"".equals(rawLines[i])) {
      String[] tmp = rawLines[i].split("#");
      lines.add( new Line (tmp[0], tmp[1].trim() ));              
    }
  }
  
  size(800,400);
  textFont(createFont ("Georgia", 24));
  drama = new Drama( lines );
}

void draw() {
  
  background(255);
  textAlign(CENTER);
  fill(0);
  
  text ("Click here for Drama", width/2, height/2);
}

void mousePressed() {
  
  //System.out.println("Thread running state = "+ drama.isRunning() );
  if (!drama.isRunning()) {
      System.out.println("Thread is not running");
      drama.start();
  } else {
    System.out.println("Not running");
  }
}
