abstract class SearchPageState {}

class SearchPageInitialState extends SearchPageState {
String message;
SearchPageInitialState({required this.message});
}

class SearchPageLoadingState extends SearchPageState {}

class SearchPageSuccessState extends SearchPageState {
  int length;
  SearchPageSuccessState({required this.length});
}

class SearchPageFailureState extends SearchPageState {
  String errorMessage;

  SearchPageFailureState({required this.errorMessage});
}
