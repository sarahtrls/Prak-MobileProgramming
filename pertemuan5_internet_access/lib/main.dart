import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  void iniState() {
    getData();
    super.initState();
  }

  String kelurahan = "";
  String kecamatan = "";
  String provinsi = "";

  Future<List> getData() async {
    final response = await http
        .get(Uri.parse("https://nbc.vanmason.web.id/service/kodepos/16437"));

    var data = json.decode(response.body);

    if (mounted) {
      setState(() {
        kelurahan = data['kodepos'][0]['kelurahan'];
        kecamatan = data['kodepos'][0]['kecamatan'];
        provinsi = data['kodepos'][0]['provinsi'];
      });
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Kelurahan"),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(kelurahan),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text("Kecamatan"),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(kecamatan),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text("Provinsi"),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(provinsi),
              Padding(padding: EdgeInsets.only(top: 40)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    getData();
                  },
                  child: Text("Refresh Data"))
            ],
          ),
        ),
      ),
    );
  }
}
