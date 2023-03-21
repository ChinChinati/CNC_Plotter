import java.awt.event.KeyEvent;
import javax.swing.JOptionPane;
import processing.serial.*;

Serial port = null;

String portname = null;
boolean streaming = false;
float speed = 0.001;
String[] gcode;
int i = 0;

void openSerialPort(){
  if (portname == null) return;
  if (port != null) port.stop();
  
  port = new Serial(this, portname, 9600);
  
  port.bufferUntil('\n');
}

void selectSerialPort(){
  String result = (String) JOptionPane.showInputDialog(frame,
    "Select the COM port on the Arduino board",
    "Select serial port",
    JOptionPane.QUESTION_MESSAGE,
    null,
    Serial.list(),
    0);
    
  if (result != null) {
    portname = result;
    openSerialPort();
  }
}

void setup(){
  size(500, 120);
  openSerialPort();
}

void draw(){
  background(0);  
  fill(255);
  int y = 24, dy = 12;
  text("Run your CNC machine..", 12, y); y += dy;
  text("p: select serial port", 12, y); y += dy;
  text("g: select G-code file", 12, y); y += dy;
  text("x: stop your CNC machine", 12, y); y += dy;
  y = height - dy;
  text("Powered by SriTu Hobby", 12, y); y -= dy;
  text("current serial port: " + portname, 12, y); y -= dy;
}

void keyPressed(){
  
  if (!streaming) {
    if (key == 'p') selectSerialPort();
  }
  
  if (!streaming && key == 'g') {
    gcode = null; i = 0;
    File file = null; 
    println("Loading file...");
    selectInput("Select a file to process:", "fileSelected", file);
  }
  
  if (key == 'x') streaming = false;
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    gcode = loadStrings(selection.getAbsolutePath());
    if (gcode == null) return;
    streaming = true;
    stream();
  }
}

void stream(){
  if (!streaming) return;
  
  while (true) {
    if (i == gcode.length) {
      streaming = false;
      return;
    }
    
    if (gcode[i].trim().length() == 0) i++;
    else break;
  }
  
  println(gcode[i]);
  port.write(gcode[i] + '\n');
  i++;
}

void serialEvent(Serial p){
  String s = p.readStringUntil('\n');
  println(s.trim());
  
  if (s.trim().startsWith("ok")) stream();
  if (s.trim().startsWith("error")) stream(); // XXX: really?
}
