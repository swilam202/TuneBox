import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/core/database/sql%20database.dart';
import 'package:musicapp/features/favorite%20screen/presentation/manager/favorite%20song%20cubit.dart';
import 'package:musicapp/features/favorite%20screen/presentation/manager/favorite%20songs%20state.dart';

import 'favorite item.dart';


class FavoritePageBody extends StatefulWidget {
  const FavoritePageBody({super.key});

  @override
  State<FavoritePageBody> createState() => _FavoritePageBodyState();
}

class _FavoritePageBodyState extends State<FavoritePageBody> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FavoritePageCubit>(context).getSongs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<FavoritePageCubit,FavoritePageState>(
        builder: (context,state){
          if(state is FavoritePageSuccessState){
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context,index){

                return FavoriteItem(id: state.songs[index].id!);
              },
            );
          }
          else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
