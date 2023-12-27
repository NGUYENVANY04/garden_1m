import 'dart:math';
import 'package:garden_1m/data/dataTempApi.dart';
import 'package:garden_1m/data/datafirebase.dart';
import 'package:garden_1m/home.dart';
// import 'package:garden_1m/widget/hiu_widget/widget_Hiu.dart';
import 'package:garden_1m/widget/temp_widget/widget_temp.dart';
import 'package:garden_1m/widget/widget_ppm/widget_ppm.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAq0gpKpof7Dx4oDyyIIhRPJn8mkGXegiE',
        appId: '1:617154543219:web:8bf3f5bec039ce10713406',
        messagingSenderId: '617154543219',
        projectId: 'garden-1m',
        authDomain: 'garden-1m.firebaseapp.com',
        databaseURL: 'https://garden-1m-default-rtdb.firebaseio.com',
        storageBucket: 'garden-1m.appspot.com',
      ),
    );
    print("Khong co ngoai le");
  } catch (e) {
    print(e.toString());
  }

  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Temperature>(
          create: (_) => Temperature(),
          child: const InfoWidgetTemp(),
        ),
        ChangeNotifierProvider<DataFirebase>(
          create: (_) => DataFirebase(),
          child: const InfoWidgetPpm(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: MyHome(),
        ),
      ),
    );
  }
}
