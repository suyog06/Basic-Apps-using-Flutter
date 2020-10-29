import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());


//this function plays different audio files inside buildKey function
class XylophoneApp extends StatelessWidget {
  void playSound(int a){
    final player = AudioCache();
    player.play('note$a.wav');
  }


  //created a function to omit recursive code of expanded widget!!!
  Expanded buildKey({Color color , int a}){
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: (){
          playSound(a);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:<Widget>[
                buildKey(color: Colors.red, a : 1),
                buildKey(color: Colors.orange, a : 2),
                buildKey(color: Colors.yellow, a : 3),
                buildKey(color: Colors.teal, a : 4),
                buildKey(color: Colors.green, a : 5),
                buildKey(color: Colors.blue, a : 6),
                buildKey(color: Colors.purple, a : 7),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
