import 'package:flutter/material.dart';
import 'package:flutterpractice/screens/login_page.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase login app',
      home: LoginPage(),
    );
  }
}
