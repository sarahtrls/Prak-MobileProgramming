
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //Warna yang digunakan ARGB jadi tambahkan FF didepan kode warna
      backgroundColor: Color(0xfff4f4f4),
      body: Stack(children: [Container(
        height: 300,
        decoration: BoxDecoration(color: Colors.red),
      
      ),
      Container(child: SingleChildScrollView(child: Column
      (crossAxisAlignment: CrossAxisAlignment.start,
      children: [SizedBox(
        height: size.height*0.07,
      ),
      Padding(padding: EdgeInsets.only(left: 20),
      child: Text('Welcome to stack!', 
      style: TextStyle(fontSize: 28, fontWeight: 
      FontWeight.w600, color: Colors.white),),)
      ],),),),
      Container(margin: EdgeInsets.only(top: 100),
      height: 800,
      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13),
                          topRight: Radius.circular(13)),
                    ),
      ),
      ]),
    );
  }
}