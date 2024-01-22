import 'package:flutter/material.dart';


class NewRecording extends  StatefulWidget {
  const NewRecording({super.key});

  @override
  State<NewRecording> createState() => NewRecordingState();
}

class NewRecordingState extends State<NewRecording> {
  bool isRecording = false;
  String? audio;

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
              onPressed: () {
                setState(() {
                  isRecording = true;
                });
              },
              child: const Text('Record'),
            ) : SizedBox(),
            isRecording ? ElevatedButton (
              onPressed: () {
                setState(() {
                  isRecording = false;
                });
              },
              child: const Text('Stop'),
            ),
             isRecording ? ElevatedButton (
              onPressed: () {
                setState((){
                  isRecording = false;
                });
              },
              child: const Text('Play'),
            ),
             isRecording ? ElevatedButton (
              onPressed: () {
                setState(() {
                  isRecording = false;
                });
              },
              child: const Text('Save'),
            ),
          ],
        ),

      ),
    );
  }
}