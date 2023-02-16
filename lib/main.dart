import 'package:firebase/screens/login.dart';
import 'package:firebase/screens/sign_up.dart';
import 'package:firebase/screens/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'data/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51MbnZPBbdsc0ypZ9vH8VSxEsCVg2uiele5oiSXT0GCcljapnoiTyrAkxDXYM4A5nrA77iAlz46hmBgPzCKmbiwj900R1wi1aCk";
  await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      title: 'Sign in/up',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/sign_up': (context) => SignUpScreen(),
        '/user': (context) => const ProfileScreen(),
        }
    );
  }
}

