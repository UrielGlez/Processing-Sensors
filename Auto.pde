
import android.os.Bundle;  
import android.content.Intent;  

import ketai.net.bluetooth.*;
import ketai.ui.*;
import ketai.net.*;

import ketai.sensors.*;
import ketai.camera.*;
import cassette.audiofiles.SoundFile;

KetaiSensor sensor;
KetaiCamera camera;
PImage bg;
PVector accelerometer;
float light, proximity;
KetaiLocation location;
PFont font;
SoundFile alarm;
double longitude, latitude, altitude;
KetaiList connectionList;  
String info = "";  
boolean isConfiguring = true;
String UIText = "";

ArrayList<String> devices = new ArrayList<String>();
boolean isWatching = false;
boolean intruso = false;

void setup() {
  orientation(PORTRAIT);
  stroke(255);
  
  background(255);
  bg = loadImage("topViewCar.png");
  sensor = new KetaiSensor(this);
  alarm = new SoundFile(this, "carAlarm.mp3"); 
  camera = new KetaiCamera(this, 1280, 768, 30);
  sensor.start();
  sensor.list();
  accelerometer = new PVector();
  location = new KetaiLocation(this);
  sensor.enableProximity();
  sensor.enableLight();
  camera.setCameraID(1); 
}

void draw() {
  background(255);
  imageMode(CORNERS);
  image(bg, 100, 100, 1000, 1400);
  textSize(50);
  textAlign(CENTER);
  fill(0, 153, 153);
  text("AVISO: ", width/2, 1500);  
  textSize(55);
  fill(0, 102, 153);
  textAlign(LEFT);
  text(UIText, 40, 1560, 1000, 1000);  
  if (intruso) {
    camera.start();
    if (camera.isStarted()) camera.savePhoto();
    delay(7000);
    intruso = false;
    camera.stop(); 
  }
}
