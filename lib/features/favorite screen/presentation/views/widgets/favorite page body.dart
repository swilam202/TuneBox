import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/core/database/sql%20database.dart';
import 'package:musicapp/features/favorite%20screen/presentation/manager/favorite%20song%20cubit.dart';
import 'package:musicapp/features/favorite%20screen/presentation/manager/favorite%20songs%20state.dart';
import 'package:musicapp/features/home%20screen/presentation/manager/home%20page%20cubit.dart';
import 'package:musicapp/features/home%20screen/presentation/views/widgets/list%20view%20item.dart';

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
    BlocProvider.of<FavoritePageCubit>(context).getSongs(songs: BlocProvider.of<HomePageCubit>(context).songs);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<FavoritePageCubit,FavoritePageState>(
        builder: (context,state){
          if(state is FavoritePageSuccessState){
            return ListView.builder(
              itemCount: state.songs.length,
              itemBuilder: (context,index){

                return ListViewItem(index: state.indexes[index]);
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
