import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int noteNumber) async {
    final player = AudioPlayer();
    await player.setSource(
      AssetSource('note$noteNumber.wav'),
    );
    await player.resume();
  }

  Expanded buildKey(
      {required Color color,
      required int soundNoteNumber,
      required int soundNumber}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playSound(soundNoteNumber);
        },
        child: Text('Note $soundNoteNumber'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.black, soundNoteNumber: 1, soundNumber: 1),
              buildKey(color: Colors.blue, soundNumber: 2, soundNoteNumber: 2),
              buildKey(color: Colors.white, soundNoteNumber: 3, soundNumber: 3),
              buildKey(color: Colors.red, soundNoteNumber: 4, soundNumber: 4),
              buildKey(
                  color: Colors.yellow, soundNoteNumber: 5, soundNumber: 5),
              buildKey(color: Colors.green, soundNoteNumber: 6, soundNumber: 6),
              buildKey(
                  color: Colors.orange, soundNoteNumber: 7, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
