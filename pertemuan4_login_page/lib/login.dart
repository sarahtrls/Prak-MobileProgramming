import 'package:flutter/material.dart';
import 'homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: ListView(
                physics: const ClampingScrollPhysics(),
                children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 150),
                child: Image.asset('assets/images/logo.png', height: 70),
              ),
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Praktikum Labkom',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 30, right: 20),
                child: Column(children: <Widget>[
                  Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Email",
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 158, 21, 12)))),
                    ),
                  ),
                  Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Password",
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 158, 21, 12)))),
                    ),
                  )
                ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 40, right: 60, left: 60),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[900],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: Text('Masuk'),
                ),
              ),
              Container(
                child: TextButton(
                  child: Text('Belum punya akun? Daftar disini',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      textAlign: TextAlign.center),
                  onPressed: () {},
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 90, right: 60, left: 60),
                  child: Text(
                    "version 1.1",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    textAlign: TextAlign.center,
                  ))
            ])));
  }
}
