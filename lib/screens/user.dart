import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/firebase_helper.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var username = '';

  @override
  void initState() {
    super.initState();
    _initUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        actions: [
          TextButton(
            onPressed: () {
              FirebaseHelper.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
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
            Center(
              child: Text(
                'Hello, $username!',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _initUsername() async {
    final email = FirebaseAuth.instance.currentUser?.email ?? '';
    setState(() {
      username = email;
    });
  }
}
