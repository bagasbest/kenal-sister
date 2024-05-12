import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kenalsister/screens/home_screen.dart';
import 'package:kenalsister/screens/login_screen.dart';
import 'package:kenalsister/screens/onboarding_screen.dart';
import 'package:kenalsister/widget/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSplash = true;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3)).then((_) {
      setState(() {
        isSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /// cek apakah pengguna sudah login sebelumnya atau belum, jika sudah langsung masuk ke homepage, jika belum masuk ke login
    User? user = FirebaseAuth.instance.currentUser;
    if (isSplash) {
      return Container(
        color: Colors.white,
        child: Center(
          child:   ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/icon_apk_master.jpg',
              height: 220,
              width: 310,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    } else {
      if (user != null) {
        return HomeScreen(isUpdate: true);
      } else {
        return OnboardingScreen();
      }
    }
  }
}