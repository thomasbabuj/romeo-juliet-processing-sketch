/*  
    Drama class will be a thread that runs in the background and tells
    each of the speaker objects to read one line of text.
*/

public class Drama extends Thread {
  int current;
  ArrayList lines;
  boolean running;
  
  TTS romeo;
  TTS juliet;
  
  public Drama(ArrayList lines, TTS romeo, TTS juliet) {
    this.lines = lines;
    this.romeo = romeo;
    this.juliet = juliet;
    current = 0;
    running = false;    
  }
  
  public int getCurrent() {
    return current;
  }
  
  public Line getLines(int num) {
    if( num >= 0 && num < lines.size()) {
      return (Line)lines.get(num);
    } else {
      return null;
    }
  }
  
  public boolean isRunning() {
    return running;
  }
  
  public void run() {
    running = true;        
    
    for( int i=0; i< lines.size(); i++ ) {
      current = i;
      Line l = (Line)lines.get(i);
      if( "J".equals( l.speaker)) {
         juliet.speakLeft(l.text);
      } else if ( "R".equals( l.speaker )) {
         romeo.speakRight(l.text);
      }   
    }    
    running = false;
    //interrupt();
  }
}
    
    
