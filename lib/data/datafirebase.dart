import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class DataFirebase extends ChangeNotifier {
  DataFirebase() : super() {
    readSoilMoisture();
    readHumindityIndoor();
  }
  final refData = FirebaseDatabase.instance.ref(); // call firebase
  int humidityIndoor = 20;
  int soilMoisture = 20;

  readHumindityIndoor() {
    refData.child("HumindityIndoor").onValue.listen((event) {
      humidityIndoor = event.snapshot.value as int;
      notifyListeners();
    });
  }

  readSoilMoisture() {
    refData.child("soil_moisture").onValue.listen((event) {
      soilMoisture = event.snapshot.value as int;
      notifyListeners();
    });
  }
}
