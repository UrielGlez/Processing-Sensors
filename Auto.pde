
import android.os.Bundle;  // 1
import android.content.Intent;  // 2

import ketai.net.bluetooth.*;
import ketai.ui.*;
import ketai.net.*;

import ketai.sensors.*;
import ketai.camera.*;

boolean finalizado = true;
KetaiSensor sensor;
KetaiCamera camera;
PVector accelerometer;
float light, proximity;
KetaiLocation location; // 1
double longitude, latitude, altitude;

KetaiList connectionList;  // 4
String info = "";  // 5
boolean isConfiguring = true;
String UIText;

ArrayList<String> devices = new ArrayList<String>();
boolean isWatching = false;

void setup() {
  orientation(PORTRAIT);
  background(0, 128, 128);
  stroke(255);
    
  sensor = new KetaiSensor(this);
  camera = new KetaiCamera(this, 1280, 768, 30);
  sensor.start();
  sensor.list();
  accelerometer = new PVector();
  location = new KetaiLocation(this);
  sensor.enableProximity();
  sensor.enableLight();
  camera.setCameraID(1); 
  imageMode(CENTER);
  
  
}

void draw() {

}
