//import 'package:audioplayers/audioplayers.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/core/database/sql%20database.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/controller/song%20details%20controller.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/manager/song%20details%20cubit.dart';

import '../../../../../slider cubit.dart';
import '../../../../home screen/data/song model.dart';



class SongDetailsControlRow extends StatefulWidget {
  SongDetailsControlRow({super.key, required this.song,required this.index});
  final Song song;
  final int index;


  @override
  State<SongDetailsControlRow> createState() => _SongDetailsControlRowState();
}

class _SongDetailsControlRowState extends State<SongDetailsControlRow> {
  //bool isPlaying = false;
  SongDetailsController controller = Get.put(SongDetailsController());
SqlDB sqlDB = SqlDB();


@override
  void initState() {
    // TODO: implement initState
    super.initState();

    //controller.chekIfFavorite(songId: widget.song.id!);
  }



  @override
  Widget build(BuildContext context) {
    final SongDetailsCubit songDetailsCubit = BlocProvider.of<SongDetailsCubit>(context);
   // final player = BlocProvider.of<SongDetailsCubit>(context).player;
    final dur = controller.player.value.setFilePath(widget.song.data!);
controller.chekIfFavorite(songId: widget.song.id!);
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () async{
          if(controller.isLiked == false){
            await sqlDB.insert({
              'id': songDetailsCubit.songs[songDetailsCubit.index].id!,
              'i': widget.index,
            }, 'favorite');
            controller.isLiked.value = !(controller.isLiked.value);
          }
          else{
            await sqlDB.delete(widget.song.id!);
            controller.isLiked.value = !(controller.isLiked.value);
          }

           print('pressed ----------------------------------');
          },
          icon:  Icon(
            controller.isLiked.value == true? Icons.favorite:Icons.favorite_border,
            size: 20,
            color: Colors.green,
          ),
        ),
        IconButton(
          onPressed: () async {
            await controller.player.value.pause();
            controller.isPlaying.value = false;
            songDetailsCubit.index--;
            BlocProvider.of<SliderCubit>(context).prog(0.0);
            songDetailsCubit.loadSong();
          },
          icon: const Icon(
            Icons.skip_previous_rounded,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: () async {
            await controller.playSong();

          },
          icon: controller.isPlaying.value? Icon(Icons.pause,size: 40,):Icon(Icons.play_arrow,size: 40,),
        ),
        IconButton(
            onPressed: () async {

              await controller.player.value.pause();
              controller.isPlaying.value = false;
              //controller.sliderVal.value = 0.0;
              BlocProvider.of<SliderCubit>(context).prog(0.0);
             if(controller.autoMode.value == 1){
               songDetailsCubit.index++;

             }
             else if(controller.autoMode.value == 2){
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
            controller.switchMode();
           // songDetailsCubit.player.seekToNext()
            setState(() {
            });
          },
          icon:  Icon(
            controller.autoMode.value == 0? Icons.repeat_one:controller.autoMode.value == 1?Icons.repeat:Icons.shuffle,
            size: 20,
            color: Colors.green,
          ),
        ),
      ],
    )
 );
     }

}
