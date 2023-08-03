//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../home screen/data/song model.dart';



class SongDetailsControlRow extends StatelessWidget {
   SongDetailsControlRow({super.key,required this.song});
  final player = AudioPlayer();

  final Song song;
  @override
  Widget build(BuildContext context) {
    final dur = player.setFilePath(song.data!);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,size: 20,),),
        IconButton(onPressed: (){}, icon: const Icon(Icons.skip_previous_rounded,size: 40,),),
        IconButton(onPressed: ()async{
          await player.play();
        }, icon: const Icon(Icons.play_arrow,size: 40,),),
        IconButton(onPressed: (){}, icon: const Icon(Icons.skip_next_rounded,size: 40,),),
        IconButton(onPressed: (){}, icon: const Icon(Icons.repeat,size: 20,),),
      ],
    );
  }
}
