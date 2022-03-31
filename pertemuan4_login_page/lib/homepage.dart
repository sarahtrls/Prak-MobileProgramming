import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        leading: Icon(Icons.menu),
        title: Text('Selamat datang'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Text(
            'Ini adalah homepage',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
