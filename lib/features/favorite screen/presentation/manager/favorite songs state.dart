import 'package:musicapp/features/home%20screen/data/song%20model.dart';

abstract class FavoritePageState {}

class FavoritePageInitialState extends FavoritePageState {
  String message;

  FavoritePageInitialState({required this.message});
}

class FavoritePageLoadingState extends FavoritePageState {}

class FavoritePageSuccessState extends FavoritePageState {
  List<Song> songs;

  FavoritePageSuccessState({required this.songs});
}

class FavoritePageFailureState extends FavoritePageState {
  String errorMessage;

  FavoritePageFailureState({required this.errorMessage});
}
