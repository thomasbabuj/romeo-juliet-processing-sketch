/*  
    Drama class will be a thread that runs in the background and tells
    each of the speaker objects to read one line of text.
*/

public class Drama extends Thread {
  int current;
  ArrayList lines;
  boolean running;
  
  public Drama(ArrayList lines) {
    this.lines = lines;
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
    
    System.out.println("I am running");
  
    for( int i=0; i< lines.size(); i++ ) {
      current = i;
      try {
      Line l = (Line)lines.get(i);
      System.out.println(l.text);
      delay(1);
      } catch(Exception e) {
        System.out.println("Exception " +e);
      }    
    }
    
    running = false;
    interrupt();
  }
}
    
    
