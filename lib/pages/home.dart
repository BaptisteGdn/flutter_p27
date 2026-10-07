import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final seed = Random().nextInt(100000);
    final avatarUrl = 'https://api.dicebear.com/9.x/avataaars/png?seed=$seed';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
        ),
        title: Image.asset('assets/x-logo.png', height: 30),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
    );
  }
}