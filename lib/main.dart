import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:review_anime/view/splash_screen.dart';

late final FirebaseApp app;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyDL9p558nM08D-MoJjWHBLVCQXwO70danw", 
    appId: "1:777907238321:android:10495e264ed22853683990" , 
    messagingSenderId: "777907238321", 
    projectId: "projek-mobile-f51c8"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: SplashScreen(),
    );
  }
}
