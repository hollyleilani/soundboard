import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var images = [
      Ink.image(
        image: NetworkImage('https://api.duniagames.co.id/api/content/upload/file/4357394631665030763.jpg'),
        child: InkWell(
          onTap: () async {
            print('ink well tap');
          }
        )),
      Ink.image(
        image: AssetImage('images/Hu_Tao_Birthday_Banner.jpg'),
        child: InkWell(
          onTap: () async {
            print('ink well tap');

            final player = AudioPlayer();                   // Create a player
            await player.setAsset("sounds/audio1.mp3");                 // Schemes: (https: | file: | asset: )
            player.play();                         
          }
        )), 
      Ink.image(
        image: NetworkImage('https://chrisweston.photography/wp-content/uploads/2020/06/77863219_s.jpg'),
        child: InkWell( 
          onTap: () async {
            print('ink well tap');
          }
        )),
      Ink.image(
        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPAs20rQvMVSjUzuR0JXM_bVtbOrXCgITnfA&usqp=CAU'),
        child: InkWell( 
          onTap: () async {
            print('ink well tap');
          }
        )), 
      Ink.image(
        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJqzDTT-fNcwWEb1wlQgjPK5bAHZlYJ75yX8LkWyCKfsvpihSO3V6JtZeYEEsQvhLV16M&usqp=CAU'),
        child: InkWell( 
          onTap: () async {
            print('ink well tap');
          }
        ))
    ];

   return GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: images,
);
  }
}
