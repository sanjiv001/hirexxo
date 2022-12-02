import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hirexxo/Add_screen/add_apartment.dart';
import 'package:hirexxo/screen/homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HireXXo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddApartment(),
    );
  }
}
