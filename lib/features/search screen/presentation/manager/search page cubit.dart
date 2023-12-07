import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/database/sql database.dart';
import '../views/widgets/dialog button.dart';
import 'search page state.dart';

class SearchPageCubit extends Cubit<SearchPageState> {
  SearchPageCubit()
      : super(SearchPageInitialState(
            message: 'Try search for songs on your device'));

  SqlDB sqlDB = SqlDB();

  loadData(BuildContext context) async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      emit(SearchPageLoadingState());
      await sqlDB.deleteAll();
      try {
        await sqlDB.deleteAll();
        late List<SongModel> mp3songs;

        mp3songs = await OnAudioQuery.platform.querySongs();

        mp3songs =
            mp3songs.where((element) => element.data.endsWith('.mp3')).toList();

        for (int i = 0; i < mp3songs.length; i++) {
          sqlDB.insert({
            'title': mp3songs[i].title,
            'data': mp3songs[i].data,
            'artist': mp3songs[i].artist ?? 'Unknown',
            'song_id': mp3songs[i].id,
            'duration': mp3songs[i].duration ?? 0,
          }, 'songs');
        }

        emit(SearchPageSuccessState(length: mp3songs.length));
      } catch (e) {
        emit(SearchPageFailureState(errorMessage: e.toString()));
      }
    } else {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        title: 'The app needs storage permissions!',
        titlePadding:
            const EdgeInsets.only(top: 20, bottom: 20, right: 12, left: 12),
        content: Row(
          children: [
            DialogButton(
              color: Colors.red,
              onPressed: () => Navigator.of(context).pop(),
              text: "Don't allow",
            ),
            DialogButton(
              color: Colors.green,
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
              text: "Allow",
            ),
          ],
        ),
      );
    }
  }
}
