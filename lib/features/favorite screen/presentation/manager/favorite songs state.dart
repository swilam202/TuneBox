



import '../../../home screen/data/song model.dart';

abstract class FavoritePageState {}

class FavoritePageInitialState extends FavoritePageState {

}

class FavoritePageLoadingState extends FavoritePageState {}

class FavoritePageSuccessState extends FavoritePageState {
  List<Song> songs;
  List<int> indexes;
  FavoritePageSuccessState({required this.songs,required this.indexes});

}

class FavoritePageFailureState extends FavoritePageState {
  String errorMessage;
  FavoritePageFailureState({required this.errorMessage});
}