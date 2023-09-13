import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
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
          Metadata metaData =
              await MetadataRetriever.fromFile(File(mp3songs[i].data));
          Uint8List? unit = metaData.albumArt;
          //String? encodedImage = encodeImage(unit);

          sqlDB.insert({
            'title': mp3songs[i].title,
            'data': mp3songs[i].data,
            'artist': mp3songs[i].artist ?? 'Unknown',
            'image': encodeImage(unit),
            'duration': mp3songs[i].duration ?? 0,
          }, 'songs');
        }

        emit(SearchPageSuccessState(length: mp3songs.length));
      } catch (e) {
        emit(SearchPageFailureState(errorMessage: e.toString()));
      }
    } else {
      Get.defaultDialog(
        backgroundColor: Colors.black,
        title: 'The app needs storage permissins!',
        titlePadding:
            const EdgeInsets.only(top: 16, bottom: 8, right: 12, left: 12),
        content: Row(
          children: [
            DialogButton(
                onPressed: () => Navigator.of(context).pop(),
                text: "Don't allow"),
            DialogButton(
                onPressed: () {
                  openAppSettings();
                },
                text: "Allow"),
          ],
        ),
      );
      //status = await Permission.storage.status;

      //status = await Permission.storage.request();
    }
  }

/* void getBack(){
    emit(SearchPageInitialState());
  }
*/
  String? encodeImage(Uint8List? data) {
    if (data == null) {
      return null;
    } else {
      String image = base64.encode(data);
      //print('+++++++++++++++++++++++++++++++encoded++++++++++++++++++++++++++++++');
      //print(image);
      //print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
      return image;
    }
  }
}
