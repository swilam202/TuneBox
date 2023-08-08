//import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/core/database/sql%20database.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/manager/song%20details%20cubit.dart';

import '../../../../home screen/data/song model.dart';



class SongDetailsControlRow extends StatefulWidget {
  SongDetailsControlRow({super.key, required this.song,});
  final Song song;

  @override
  State<SongDetailsControlRow> createState() => _SongDetailsControlRowState();
}

class _SongDetailsControlRowState extends State<SongDetailsControlRow> {
  //bool isPlaying = false;
SqlDB sqlDB = SqlDB();
  @override
  Widget build(BuildContext context) {
    final SongDetailsCubit songDetailsCubit = BlocProvider.of<SongDetailsCubit>(context);
   // final player = BlocProvider.of<SongDetailsCubit>(context).player;
    final dur = songDetailsCubit.player.setFilePath(widget.song.data!);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () async{
           await sqlDB.insert({
              'id': songDetailsCubit.songs[songDetailsCubit.index].id!
            }, 'favorite');
           print('pressed ----------------------------------');
          },
          icon: const Icon(
            Icons.favorite_border,
            size: 20,
          ),
        ),
        IconButton(
          onPressed: () async {
            await songDetailsCubit.player.pause();
            songDetailsCubit.isPlaying = false;
            songDetailsCubit.index--;
            songDetailsCubit.loadSong();
          },
          icon: const Icon(
            Icons.skip_previous_rounded,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: () async {
            await songDetailsCubit.playSong();
setState(() {
  songDetailsCubit.isPlaying = !songDetailsCubit.isPlaying;
});
          },
          icon: songDetailsCubit.isPlaying? Icon(Icons.pause,size: 40,):Icon(Icons.play_arrow,size: 40,),
        ),
        IconButton(
            onPressed: () async {

              await songDetailsCubit.player.pause();
              songDetailsCubit.isPlaying = false;
             if(songDetailsCubit.autoMode == 1){
               songDetailsCubit.index++;

             }
             else if(songDetailsCubit.autoMode == 2){
               Random r = Random();
               songDetailsCubit.index = r.nextInt( songDetailsCubit.songs.length) -1;

             }

              songDetailsCubit.loadSong();


            },
            icon: const Icon(
              Icons.skip_next_rounded,
              size: 40,
            )),
        IconButton(
          onPressed: () async{
            songDetailsCubit.switchMode();
           // songDetailsCubit.player.seekToNext()
            setState(() {
            });
          },
          icon:  Icon(
            songDetailsCubit.autoMode == 0? Icons.repeat_one:songDetailsCubit.autoMode == 1?Icons.repeat:Icons.shuffle,
            size: 20,
          ),
        ),
      ],
    );
  }

}
