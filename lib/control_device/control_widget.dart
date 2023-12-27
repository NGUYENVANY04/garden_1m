import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ControlDevice extends StatefulWidget {
  const ControlDevice({Key? key}) : super(key: key);

  @override
  State<ControlDevice> createState() => _ControlDeviceState();
}

class _ControlDeviceState extends State<ControlDevice> {
  bool stateFan = true;
  bool stateMotor = true;
  bool log = false;
  final refcontrol = FirebaseDatabase.instance.ref();

  // ignore: non_constant_identifier_names
  void Log() {
    setState(() {
      log = !log;
    });
  }

  void controlFan() {
    setState(() {
      stateFan = !stateFan;
      refcontrol.child("state").update({
        "fan": stateFan,
      });
    });
  }

  void controlMotor() {
    setState(() {
      stateMotor = !stateMotor;
      refcontrol.child("state").update({
        "motor": stateMotor,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return log
        ? Column(
            children: [
              Container(
                // color: Colors.black12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: stateFan
                              ? const Color.fromARGB(255, 227, 117, 117)
                              : Colors.grey,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            controlFan(); // quat
                          },
                          child: Text(
                            stateFan ? "ON" : "OFF",
                            style: const TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 20, 14, 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30.0),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: stateMotor
                              ? const Color.fromARGB(255, 227, 117, 117)
                              : Colors.grey,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            controlMotor(); //bowm
                          },
                          child: Text(
                            stateMotor ? "ON" : "OFF",
                            style: const TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 20, 14, 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Log();
                },
                icon: const Icon(
                  Icons.expand_less_sharp,
                  size: 40,
                ),
              ),
            ],
          )
        : IconButton(
            onPressed: () {
              Log();
            },
            icon: const Icon(
              Icons.expand_more,
              size: 40,
            ),
          );
  }
}
