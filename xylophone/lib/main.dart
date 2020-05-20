import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main(){
  runApp(Xylophone());
}

class Xylophone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "XylophonePage",
      debugShowCheckedModeBanner: false,

      home: XylophonePage(),
    );
  }
}

class XylophonePage extends StatefulWidget {
  @override
  _XylophonePageState createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {

  void playSound(int number){
    final player = AudioCache();
    player.play('note$number.wav');
  }

  Expanded buildKey({Color color,int sound}){
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(sound);
        },
        color: color
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, sound:1),
              buildKey(color: Colors.blue, sound:2),
              buildKey(color: Colors.deepOrange, sound:3),
              buildKey(color: Colors.greenAccent, sound:4),
              buildKey(color: Colors.black, sound:5),
              buildKey(color: Colors.pinkAccent, sound:6),
            ],
          )
      ),
    );
  }
}
