/* 
  Added ttslib library and including in our script.
  
  1) Using TTS speak method
  
  2) Create a Drama thread and teach processing how to read Shakespreare script
  
  3) Adding more actors
  
*/

import guru.ttslib.*;

TTS tts;
Drama drama;

void setup() {
  
  size(800,400);
  textFont(createFont ("MyriadPro-Bold", 24));    

  String[] rawLines = loadStrings("Shakespeare_script.txt");  
  ArrayList lines = new ArrayList();
  
  for(int i=0; i<rawLines.length; i++) {   
    if( !"".equals(rawLines[i])) {
      String[] tmp = rawLines[i].split("#");
      lines.add( new Line (tmp[0], tmp[1].trim() ));              
    }
  }
  
  TTS romeo = new TTS();
  TTS juliet = new TTS();
  juliet.setPitchShift( 2.4 );  
  drama = new Drama( lines, romeo, juliet );
}

void draw() {
  background(255);
  textAlign(CENTER);
  fill(0);  
  
  if (!drama.isRunning()) {
    text ("Click here for Drama", width/2, height/2);
  } else {
    // Adding the for loop to display previous lines
    int current = drama.getCurrent();
    for( int i=-2; i<3; i++) {
      fill( abs(i) * 100 );
      Line l = drama.getLines(i + current);
      if (l != null ) {
         if ( "J".equals(l.speaker)) {
           textAlign(LEFT);
           text( l.text, 10, height/2+i*30 );
         } else {
           textAlign(RIGHT);
           text( l.text, width-10, height/2 +i *30);
         }
      }
    }
  }
  
}

void mousePressed() {    
  if (!drama.isRunning()) {      
      drama.start();
  } 
}
