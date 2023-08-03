//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/manager/song%20details%20cubit.dart';

import '../../../../home screen/data/song model.dart';



class SongDetailsControlRow extends StatelessWidget {
  SongDetailsControlRow({super.key, required this.song,});
  final Song song;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
   // final player = BlocProvider.of<SongDetailsCubit>(context).player;
    final dur = BlocProvider.of<SongDetailsCubit>(context).player.setFilePath(song.data!);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
            size: 20,
          ),
        ),
        IconButton(
          onPressed: () async {
            await BlocProvider.of<SongDetailsCubit>(context).player.pause();
            BlocProvider.of<SongDetailsCubit>(context).index--;
            BlocProvider.of<SongDetailsCubit>(context).loadSong();
          },
          icon: const Icon(
            Icons.skip_previous_rounded,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: () async {
            await BlocProvider.of<SongDetailsCubit>(context).playSong();
          },
          icon: StatefulBuilder(
            builder: (context,set){
              if(BlocProvider.of<SongDetailsCubit>(context).isPlaying){
                return Icon(Icons.add);
              }
                  else{
                return Icon(Icons.minimize);
              }
            },
          ),
        ),
        IconButton(
            onPressed: () async {
              await BlocProvider.of<SongDetailsCubit>(context).player.pause();
              BlocProvider.of<SongDetailsCubit>(context).index++;
              BlocProvider.of<SongDetailsCubit>(context).loadSong();
            },
            icon: const Icon(
              Icons.skip_next_rounded,
              size: 40,
            )),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.repeat,
            size: 20,
          ),
        ),
      ],
    );
  }
}
