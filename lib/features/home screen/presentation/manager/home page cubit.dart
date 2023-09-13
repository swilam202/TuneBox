import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/sql database.dart';
import '../../data/song model.dart';
import 'home page state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit()
      : super(HomePageInitialState(message: 'There is no songs try now'));

  SqlDB sqlDB = SqlDB();
  List<Song> songs = [];

  loadData() async {
    emit(HomePageLoadingState());

    try {
      List query = await sqlDB.query('songs');

      for (int i = 0; i < query.length; i++) {
        songs.add(Song(
          id: query[i]['id'],
          artist: query[i]['artist'],
          data: query[i]['data'],
          title: query[i]['title'],
          image: decodeImage(query[i]['image']),
          duration: query[i]['duration'],
        ));
      }

      emit(HomePageSuccessState(songs: songs));
    } catch (e) {
      emit(HomePageFailureState(errorMessage: e.toString()));
    }
  }

  Uint8List? decodeImage(String? data) {
    if (data == null) {
      return null;
    } else {
      Uint8List? image = base64.decode(data);
      return image;
    }
  }
}
