import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/search page cubit.dart';


class SearchInitial extends StatelessWidget {
  const SearchInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        child: Text('There is no songs try now'),
        onPressed: ()=>BlocProvider.of<SearchPageCubit>(context).loadData(),
      ),
    );
  }
}
