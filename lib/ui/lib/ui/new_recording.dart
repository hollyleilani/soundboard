import 'package:flutter/material.dart';
import 'package:record/record.dart';


class NewRecording extends  StatefulWidget {
  const NewRecording({super.key});

  @override
  State<NewRecording> createState() => NewRecordingState();
}

class NewRecordingState extends State<NewRecording> {
  bool isRecording = false;
  String? audio;
  final record = AudioRecorder();

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
            !isRecording ? ElevatedButton(
              onPressed: () async {
                print("record me");
                await record.start(const RecordConfig(encoder: AudioEncoder.wav), path: 'aFullPath/myFile.m4a');
                // todo record audio here
                setState(() {
                  isRecording = true;
                });
              },
              child: const Text('Record'),
            ) : SizedBox(),
            isRecording ? ElevatedButton (
              onPressed: () async {
                final path = await record.stop();

                setState(() {
                  isRecording = false;
                });
              },
              child: const Text('Stop'),
            ) : SizedBox(),
             isRecording ? ElevatedButton (
              onPressed: () async {
                setState((){
                  isRecording = false;
                });
              },
              child: const Text('Play'),
            ): SizedBox(),
             isRecording ? ElevatedButton (
              onPressed: () {
                setState(() {
                  isRecording = false;
                });
              },
              child: const Text('Save'),
            ): SizedBox(),
          ],
        ),

      ),
    );
  }
}