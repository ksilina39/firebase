import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import '../data/firebase_helper.dart';

const url = "https://us-central1-example-ed4df.cloudfunctions.net/stripePaymentIntentRequest";

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'HELLO',
                style: TextStyle(
                    fontSize: 34,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Войди или создай свой аккаунт',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/1.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                    hintText: 'email', icon: Icon(Icons.person)),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    hintText: 'password', icon: Icon(Icons.key)),
                obscureText: true,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final success = await FirebaseHelper.login(email, password);
                  if (success) {
                    Navigator.pushReplacementNamed(context, '/user');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Wrong email or password'),
                      ),
                    );
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                
                 onPressed: () => initPaymentSheet(context, email: "example@gmail.com", amount: 200000),
                
                child: const Text(
                  'Pay',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up');
                },
                child: const Text('Firstly here? Sign up!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
 Future<void> initPaymentSheet(context, {required String email, required int amount}) async {
    try {
      // 1. create payment intent on the server
      final response = await http.post(
          Uri.parse(
            url,
          ),
          body: {
            'email': email,
            'amount': amount.toString(),
          });

      final jsonResponse = jsonDecode(response.body);
      log(jsonResponse.toString());

      //2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: jsonResponse['paymentIntent'],
          merchantDisplayName: 'Flutter Stripe Store Demo',
          customerId: jsonResponse['customer'],
          customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
          style: ThemeMode.light,
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment completed!')),
      );
    } catch (e) {
			log(e.toString());
      if (e is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

}
