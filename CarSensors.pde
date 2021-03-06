void onAccelerometerEvent(float x, float y, float z) {
  accelerometer.set(x, y, z);
  testSensorEvent();
}

void onLightEvent(float v) {
  light = v;
  testSensorEvent();
}

void onProximityEvent(float v) {
  proximity = v;
  testSensorEvent();
}

void onLocationEvent(double _latitude, double _longitude, double _altitude) {
  longitude = _longitude;
  latitude = _latitude;
  altitude = _altitude;
  testSensorEvent();
}

void onCameraPreviewEvent() { 
  camera.read();
}

void onSavePhotoEvent(String filename) {
  camera.addToMediaLibrary(filename);
}


void eventInTheCar(int event) {
  if (event < 0 || event > 5) return;
  String alerta = "";
  switch(event) { 
  case Eventos.PROXIMITY_EVENT:
    alerta = "POSIBLE INTRUSO HUSMEANDO";
    break;
  case Eventos.TOUCH_EVENT:
    alerta = "ALGUIEN INTENTA ABRIR O HA ROTO LOS CRISTALES";
    break;
  case Eventos.CAR_DISTURBANCE_EVENT:
    alerta = "PROBABLE IMPACTO O ROBO DE AUTOPARTES EXTERNAS";
    break;
  case Eventos.INTRUDER_EVENT:
    alerta = "INTRUSO EN EL AUTO";
    break;
  case Eventos.GPS_EVENT:
    alerta = "EL AUTOMOVIL ESTA EN MOVIMIENTO. POSIBLE ROBO";
  case Eventos.HIT:
    alerta = "GOLPE POR ALCANCE";
    break;
  default:
    UIText = "";
  }
  UIText = alerta;
  println("Se ha levantado la siguiente alerta: " + alerta + "\n Pero no hay dispositivo que nos escuche.");
}

class Eventos {
  static final int PROXIMITY_EVENT = 0;
  static final int TOUCH_EVENT = 1;
  static final int CAR_DISTURBANCE_EVENT = 2;
  static final int INTRUDER_EVENT = 3;
  static final int GPS_EVENT = 4;
  static final int HIT = 5;
}


void testSensorEvent() {
  
  if (touchIsStarted) {  
    eventInTheCar(Eventos.TOUCH_EVENT);
    alarm.play();
  } else if (accelerometer.x > 3.00 && accelerometer.z > 2.00) {
    eventInTheCar(Eventos.CAR_DISTURBANCE_EVENT);
    alarm.play();
  } else if (light > 80.0) {
    eventInTheCar(Eventos.INTRUDER_EVENT);
    alarm.play();
  } else if (proximity == 0) {
    intruso = true;
    eventInTheCar(Eventos.PROXIMITY_EVENT);
    alarm.play();
  } else if (latitude != 0 && longitude != 0 && altitude!=0 && accelerometer.x > 3.00 && accelerometer.z > 2.00) {
    eventInTheCar(Eventos.GPS_EVENT);
    alarm.play();
  }
}
