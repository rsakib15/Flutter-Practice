import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(askMeApp());
}

class askMeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ask Me Anything",
      debugShowCheckedModeBanner: false,
      home: askMePage(),
    );
  }
}

class askMePage extends StatefulWidget {
  @override
  _askMePageState createState() => _askMePageState();
}

class _askMePageState extends State<askMePage> {
  var ballNumber = Random().nextInt(5)+1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Ask me Anything")
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: FlatButton(
          onPressed: () {
            print("I got clicked");
            setState(() {
              ballNumber = Random().nextInt(5)+1;
            });
          },
          child: Image.asset('images/ball$ballNumber.png')
        ),
      )
    );
  }
}

