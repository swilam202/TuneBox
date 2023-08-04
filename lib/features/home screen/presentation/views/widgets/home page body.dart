import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/manager/song%20details%20cubit.dart';


import 'package:on_audio_query/on_audio_query.dart';

import '../../manager/home page cubit.dart';
import '../../manager/home page state.dart';
import 'list view item.dart';

class HomePageBody extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomePageCubit,HomePageState>(
        builder: (context,state){
          if(state is HomePageSuccessState){

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Expanded(
                child: ListView.builder(
                  itemCount: state.songs.length,
                  itemBuilder: (context, index) {
                    BlocProvider.of<SongDetailsCubit>(context).pausePlayer();

                    BlocProvider.of<SongDetailsCubit>(context).getAllSongs(state.songs);
                    return ListViewItem(index: index);
                  },
                ),
              ),
            );
          }
          else if(state is HomePageInitialState){
            return Center(child: Text(state.message),);
          }
          else if(state is HomePageFailureState){
            return Center(child: Text(state.errorMessage),);
          }
          else{
            return const Center(child:  CircularProgressIndicator(),);
          }
        },
      )
    );
  }
}


