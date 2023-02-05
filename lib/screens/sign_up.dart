import 'package:flutter/material.dart';

import '../data/firebase_helper.dart';


class SignUpScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordAgainController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                decoration: const InputDecoration(hintText: 'Email'),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: true,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _passwordAgainController,
                decoration: const InputDecoration(hintText: 'Password again'),
                obscureText: true,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final passwordAgain = _passwordAgainController.text;
                  if (password == passwordAgain) {
                    final success = await FirebaseHelper.signUp(email, password);
                    if (success) {
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Something went wrong'),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Passwords are not the same'),
                      ),
                    );
                  }
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
