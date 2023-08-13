



import '../../../home screen/data/song model.dart';

abstract class FavoritePageState {}

class FavoritePageInitialState extends FavoritePageState {
 String message;
 FavoritePageInitialState({required this.message});
}

class FavoritePageLoadingState extends FavoritePageState {}

class FavoritePageSuccessState extends FavoritePageState {

  List<int> indexes;
  FavoritePageSuccessState({required this.indexes});

}

class FavoritePageFailureState extends FavoritePageState {
  String errorMessage;
  FavoritePageFailureState({required this.errorMessage});
}
