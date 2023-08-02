import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/features/home%20screen/presentation/manager/home%20page%20state.dart';
import 'package:musicapp/features/search%20screen/presentation/manager/search%20page%20cubit.dart';

import '../manager/search page state.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchPageCubit,SearchPageState>(
        builder: (context,state){
          if(state is SearchPageSuccessState){
            return Center(child: Text('success'),);
          }
          else if(state is SearchPageFailureState){
            return Center(child: Text('failure'),);
          }
          else if(state is SearchPageInitialState){
            return Center(child: Text('initial'),);
          }
          else{
            return Center(child: Text('loading'),);
          }
        },
      ),
    );
  }
}
