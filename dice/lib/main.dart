import "package:flutter/material.dart";
import "dart:math";

void main(){
  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dice",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DiceAppPage(),
    );
  }
}

class DiceAppPage extends StatefulWidget {
  @override
  _DiceAppPageState createState() => _DiceAppPageState();
}

class _DiceAppPageState extends State<DiceAppPage> {
  var leftDiceNumber = Random().nextInt(5)+1;
  var rightDiceNumber = Random().nextInt(5)+1;

  void suffleDice(){
    setState(() {
      leftDiceNumber = Random().nextInt(5)+1;
      rightDiceNumber = Random().nextInt(5)+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Dice Game"),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  suffleDice();
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              )
            ),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  suffleDice();
                },
                child: Image.asset('images/dice$rightDiceNumber.png'),
              )
            )
          ],
        ),
      ),
    );
  }
}

