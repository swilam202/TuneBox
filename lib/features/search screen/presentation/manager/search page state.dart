abstract class SearchPageState {}

class SearchPageInitialState extends SearchPageState {

}

class SearchPageLoadingState extends SearchPageState {}

class SearchPageSuccessState extends SearchPageState {
}

class SearchPageFailureState extends SearchPageState {
  String errorMessage;

  SearchPageFailureState({required this.errorMessage});
}
