import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home screen/data/song model.dart';
import 'song details state.dart';

class SongDetailsCubit extends Cubit<SongDetailsState> {
  SongDetailsCubit() : super(SongDetailsInitialState());

  List<Song> songs = [];

  bool isFavorite = false;

  void getAllSongs(List<Song> list) {
    songs = list;
  }

  loadSong(int index) {
    index--;
    if (index < 0) {
      index = songs.length - 1;
    } else if (index >= songs.length) {
      index = 0;
    }
    emit(SongDetailsSuccessState(song: songs[index]));
  }
}
