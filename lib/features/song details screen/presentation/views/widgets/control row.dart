import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/database/sql database.dart';
import '../../../../home screen/data/song model.dart';
import '../../controller/song details controller.dart';
import '../../manager/song details cubit/song details cubit.dart';

class SongDetailsControlRow extends StatelessWidget {
  const SongDetailsControlRow({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    final SongDetailsController controller = Get.put(SongDetailsController());
    final SqlDB sqlDB = SqlDB();
    final SongDetailsCubit songDetailsCubit =
        BlocProvider.of<SongDetailsCubit>(context);

    final dur = controller.player.value.setFilePath(song.data!);

    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () async {
              if (controller.isLiked.value == false) {
                await sqlDB.insert({
                  'id': song.id!,
                  'i': song.id!,
                }, 'favorite');
                controller.isLiked.value = !(controller.isLiked.value);
              } else {
                await sqlDB.delete(song.id!);
                controller.isLiked.value = !(controller.isLiked.value);
              }
            },
            icon: Icon(
              controller.isLiked.value == true
                  ? Icons.favorite
                  : Icons.favorite_border,
              size: 20,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () async {
              await controller.player.value.pause();
              controller.isPlaying.value = false;

              songDetailsCubit.loadSong(song.id! - 1);
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
            icon: Icon(
              controller.isPlaying.value ? Icons.pause : Icons.play_arrow,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () async {
              await controller.player.value.pause();
              controller.isPlaying.value = false;

              if (controller.autoMode.value == 1) {
                songDetailsCubit.loadSong(song.id! + 1);
              } else if (controller.autoMode.value == 2) {
                Random r = Random();
                songDetailsCubit
                    .loadSong(r.nextInt(songDetailsCubit.songs.length) - 1);
              } else if (controller.autoMode.value == 0) {
                songDetailsCubit.loadSong(song.id!);
              }
            },
            icon: const Icon(
              Icons.skip_next_rounded,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {
              controller.switchMode();
            },
            icon: Icon(
              controller.autoMode.value == 0
                  ? Icons.repeat_one
                  : controller.autoMode.value == 1
                      ? Icons.repeat
                      : Icons.shuffle,
              size: 20,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
