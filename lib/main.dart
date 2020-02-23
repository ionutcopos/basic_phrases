import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> words = <String>[
    'Vorbesti engleza?',
    'Buna seara',
    'Salut',
    'Cum esti?',
    'Te rog',
    'Multumesc',
    'Bine ati venit',
    'Ce faci'
  ];

  final List<String> sounds = <String>[
    'res/doyouspeakenglish.mp3',
    'res/goodevening.mp3',
    'res/hello.mp3',
    'res/howareyou.mp3',
    'res/please.mp3',
    'res/thanks.mp3',
    'res/welcome.mp3',
    'res/whatsup.mp3'
  ];
  Timer timer;

  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Basic Phrases',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: <Widget>[
          for (int i = 0; i < words.length; i++)
            Container(
              padding: EdgeInsets.all(16.0),
              child: FlatButton(
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                child: Text(
                  words[i],
                ),
                onPressed: () {
                  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
                  audioPlayer.open(
                    sounds[i],
                  );
                  audioPlayer.play();
                },
              ),
            ),
        ],
      ),
    );
  }
}
