import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/states handeling/loading state.dart';
import '../manager/search page cubit.dart';
import '../manager/search page state.dart';
import 'widgets/search fail.dart';
import 'widgets/search initial.dart';
import 'widgets/search success.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchPageCubit, SearchPageState>(
        builder: (context, state) {
          if (state is SearchPageSuccessState) {
            return SearchSuccess(length: state.length);
          } else if (state is SearchPageFailureState) {
            return const SearchFail();
          } else if (state is SearchPageInitialState) {
            return const SearchInitial();
          } else {
            return const LoadingState();
          }
        },
      ),
    );
  }
}
