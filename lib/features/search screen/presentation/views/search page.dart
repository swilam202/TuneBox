import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:musicapp/features/home%20screen/presentation/manager/home%20page%20state.dart';
import 'package:musicapp/features/search%20screen/presentation/manager/search%20page%20cubit.dart';
import 'package:musicapp/features/search%20screen/presentation/views/widgets/search%20fail.dart';
import 'package:musicapp/features/search%20screen/presentation/views/widgets/search%20initial.dart';
import 'package:musicapp/features/search%20screen/presentation/views/widgets/search%20loading.dart';
import 'package:musicapp/features/search%20screen/presentation/views/widgets/search%20success.dart';

import '../../../home screen/presentation/manager/home page cubit.dart';
import '../manager/search page state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchPageCubit, SearchPageState>(
        builder: (context, state) {
          if (state is SearchPageSuccessState) {
            return  SearchSuccess(length: state.length);
          } else if (state is SearchPageFailureState) {
            return const SearchFail();
          } else if (state is SearchPageInitialState) {
            return const SearchInitial();
          } else {
            return const SearchLoading();
          }
        },
      ),
    );
  }
}
