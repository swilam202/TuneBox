import 'package:flutter/material.dart';


import '../../../home screen/data/song model.dart';
import 'widgets/songs details body.dart';



class SongDetailsPage extends StatelessWidget {
   const SongDetailsPage({super.key,required this.song});
  final Song song;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SongDetailsBody(song: song),
    );
  }
}
