import '../../../home screen/data/song model.dart';

abstract class SongDetailsState {}

class SongDetailsInitialState extends SongDetailsState {

}

class SongDetailsLoadingState extends SongDetailsState {}

class SongDetailsSuccessState extends SongDetailsState {
 Song song;
 int index;
 SongDetailsSuccessState({required this.index,required this.song});
}

class SongDetailsFailureState extends SongDetailsState {
  String errorMessage;

  SongDetailsFailureState({required this.errorMessage});
}
