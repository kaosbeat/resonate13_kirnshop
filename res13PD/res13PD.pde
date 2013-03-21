/**
 * A sample Processing applet using libpd, illustrating all major features.
 * 
 * Based on RJ Marsan's YayProcessingPD (https://github.com/rjmarsan/YayProcessingPD).
 * 
 * @author Peter Brinkmann (peter.brinkmann@gmail.com)
 */

import org.puredata.processing.PureData;
boolean bd = true;
PureData pd;

public void setup() {
  pd = new PureData(this, 44100, 0, 2);
  pd.openPatch("res13.pd");
  pd.subscribe("foo");  // Uncomment if you want to receive messages sent to the receive symbol "foo" in Pd.
  pd.start();
}

public void draw() {
  background(0);
  fill(200, 0, 0);
  stroke(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 20, 20);
  pd.sendFloat("pitch", (float)mouseX / (float)width); // Send float message to symbol "pitch" in Pd.
  pd.sendFloat("volume", (float)mouseY / (float)height);
  
  println(float)mouseX / (float)width);
  
  
  
}

void mousePressed() {
  if(bd) {
    bd = false;
    pd.sendFloat("bdenable", 1);
  } else {
    bd = true;
    pd.sendFloat("bdenable", 0);

  }
}
// Implement methods like the following if you want to receive messages from Pd.
// You'll also need to subscribe to receive symbols you're interested if you want
// to receive messages.
/*
public void pdPrint(String s) {
  // Handle string s, printed by Pd
}*/

public void receiveBang(String source) {
  // Handle bang sent to symbol source in Pd
  println("bang!");
}
/*
public void receiveFloat(String source, float x) {
  // Handle float x sent to symbol source in Pd
}*/

public void receiveSymbol(String source, String sym) {
  // Handle symbol sym sent to symbol source in Pd
  println(sym);
}

