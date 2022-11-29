import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hirexxo/screen/botton_navigation_bar.dart';
import 'package:hirexxo/screen/homescreen.dart';
import 'package:hirexxo/screen/welcome_screen.dart';

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
      home: HomeScreen(),
    );
  }
}
