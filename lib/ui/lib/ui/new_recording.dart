import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:just_audio/just_audio.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

class NewRecording extends StatefulWidget {
  const NewRecording({super.key});

  @override
  State<NewRecording> createState() => NewRecordingState();
}

class NewRecordingState extends State<NewRecording> {
  final record = AudioRecorder();
  final LocalStorage storage = LocalStorage('soundboard.json');

  // State variables
  String? audioPath;
  bool isRecording = false;
  bool hasRecorded = false;
  @override
  void initState() {
    super.initState();
    record.hasPermission();
    setupStorage();
  }

  void setupStorage() async {
    var value = storage.getItem('sounds');
    if (value == null) {
      storage.setItem('sounds', []);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Recording'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Title',
              ),
            ),
            !isRecording
                ? ElevatedButton(
                    onPressed: () async {
                      print("record me");
                      await record.start(
                          const RecordConfig(encoder: AudioEncoder.wav),
                          path: 'aFullPath/myFile.m4a');
                      // todo record audio here
                      setState(() {
                        isRecording = true;
                      });
                    },
                    child: const Text('Record'),
                  )
                : SizedBox(),
            isRecording
                ? ElevatedButton(
                    onPressed: () async {
                      audioPath = await record.stop();

                      setState(() {
                        isRecording = false;
                        hasRecorded = true;
                      });
                    },
                    child: const Text('Stop'),
                  )
                : SizedBox(),
            hasRecorded
                ? ElevatedButton(
                    onPressed: () async {
                      final player = AudioPlayer(); // Create a player
                      await player.setUrl(
                          audioPath!); // Schemes: (https: | file: | asset: )
                      player.play();
                    },
                    child: const Text('Play'),
                  )
                : SizedBox(),
            hasRecorded
                ? ElevatedButton(
                    onPressed: () async {
// Convert audio to usable format
                      final response = await http.get(Uri.parse(audioPath!));
                      final data = Uri.dataFromBytes(response.bodyBytes,
                              mimeType: 'audio/wav')
                          .toString();
// Save it locally

                      var value = storage.getItem('sounds');

                      final sounds = value as List;

                      sounds.add(data);

                      storage.setItem('sounds', sounds);

// Close this window and return to the previous screen

                      Navigator.of(context).pop();
                      setState(() {
                        isRecording = false;
                      });
                    },
                    child: const Text('Save'),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
