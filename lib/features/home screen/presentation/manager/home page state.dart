abstract class HomePageState {}

class HomePageInitialState extends HomePageState {
  String message;

  HomePageInitialState({required this.message});
}

class HomePageLoadingState extends HomePageState {}

class HomePageSuccessState extends HomePageState {
  List songs;

  HomePageSuccessState({required this.songs});
}

class HomePageFailureState extends HomePageState {
  String errorMessage;

  HomePageFailureState({required this.errorMessage});
}
