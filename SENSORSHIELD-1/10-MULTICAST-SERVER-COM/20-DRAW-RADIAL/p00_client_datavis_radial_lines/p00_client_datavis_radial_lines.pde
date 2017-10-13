/* CLIENT
 * oscP5multicast by andreas schlegel
 * example shows how to send osc via a multicast socket.
 * what is a multicast? http://en.wikipedia.org/wiki/Multicast
 * ip multicast ranges and uses:
 * 224.0.0.1 - 224.0.0.255 Reserved for special well-known multicast addresses.
 * 224.0.1.0 - 238.255.255.255 Globally-scoped (Internet-wide) multicast addresses.
 * 239.0.0.0 - 239.255.255.255 Administratively-scoped (local) multicast addresses.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import processing.pdf.*;


////// MULTICAST - OSC //////

import oscP5.*;
import netP5.*;
OscP5 oscP5;


////// CONTROL P5 //////

import controlP5.*;
ControlP5 cp5;
Accordion accordion;
color c = color(0, 160, 100);


//////////  VALUES FROM SERVER  //////////   

float lightValue; // LDR light
float forceValue; // FSR force
float flexValue; // FLEX
float pulseValue; // pouls
float distanceValue; // DISTANCE sonar sensor
float humidityValue; // humidity
float temperatureValue; // temp


//////////  VARIABLES OUTPUT  //////////

float mapLightValue;
float mapForceValue;
float mapFlexValue;
float mapPulseValue;
float mapDistanceValue;
float mapHumidityValue;
float mapTemperatureValue;

int deg = 0;



void setup() {
  size(1450, 1450);
  strokeWeight(1);
  smooth();
  background(255);

  // textes
  fill(0);
  text("LUMIÈRE", width/2 + 10, height/2); 
  text("PRESSION", width/2 + 90, height/2);
  text("FLEXION", width/2 + 180, height/2);
  text("DISTANCE", width/2 + 260, height/2); 
  text("TEMP", width/2 + 360, height/2);
  text("HUMD", width/2 + 440, height/2);
  text("POULS", width/2 + 560, height/2);
  noFill();

  gui();

  // create a new instance of oscP5 using a multicast socket (ethernet or wifi IP)
  oscP5 = new OscP5(this, "224.0.0.1", 7777);

  beginRecord(PDF, "plancheVis.pdf" );
}


void draw() {
  // draw with values from sensorShield
  dataVis();
}