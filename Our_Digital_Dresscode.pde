/* Creative Programming 2015 Challenge 2
by Nina Boelsums

Before I run the code, I run a script named telcookies.sh to count the number of stored cookies on my laptop, 
this number is saved in the file named cookies.txt.
I run this script every second, using the command $ watch -n1 sh telcookies.sh , 
so cookies.txt gets updated every second too.

This code reads the data from the file and translates the number of new cookies into a value written to the servos.
This makes the servos turn. By turning the servos, strings pull the openings in the dress further open,
and by that making the dress more revealing.

*/

import cc.arduino.*; 
import processing.serial.*; 
import org.firmata.*;

Arduino arduino; // Names the attached Arduino "arduino".

int[] data; // Array in which the data in a file will be saved.
int lastcookiecount = 0; // Used to store the previous number of cookies.
int cookiecount;
int newcookies;

BufferedReader reader;
String line;

void setup(){
  frameRate(1); // Checks the file with cookies for updates every second. 
                // The servos turn for one second because of this frame rate.

  arduino = new Arduino(this, Arduino.list()[0], 57600); // Recognizes the arduino.
  arduino.pinMode(9, Arduino.SERVO); // Reads that a servo motor is attached to pin 9 on the arduino.
}

void draw(){ 
  reader = createReader("cookies.txt");
  try{line = reader.readLine();
  }
  
  catch(IOException e){
    e.printStackTrace();
    line= null;
  }
  
  if(line == null){
    noLoop();
  }
  
  else{
    String[] cookies = split(line, TAB);
    //Places the data from cookies.txt in an array.
    cookiecount = in(cookies[0]);
    //Calculates how many new cookies were stored.
    newcookies = cookiecount - lastcookiecount;
    lastcookiecount = cookiecount;
  }
  
  arduino.ServoWrite(9, 95+newcookies);
  println(newcookies);
}