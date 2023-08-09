import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/features/home%20screen/presentation/manager/home%20page%20cubit.dart';

import '../../manager/search page cubit.dart';


class SearchInitial extends StatelessWidget {
  const SearchInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        child: Text('There is no songs try now'),
        onPressed: ()async{
         await  BlocProvider.of<SearchPageCubit>(context).loadData();
        // await  BlocProvider.of<HomePageCubit>(context).loadData();
        },
      ),
    );
  }
}
