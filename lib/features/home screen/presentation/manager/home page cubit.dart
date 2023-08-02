

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:musicapp/core/database/sql%20database.dart';
import 'package:musicapp/features/home%20screen/data/song%20model.dart';
import 'package:musicapp/features/home%20screen/presentation/manager/home%20page%20state.dart';

class HomePageCubit extends Cubit<HomePageState>{
  HomePageCubit():super(HomePageInitialState(message: 'There is no songs try now'));

  SqlDB sqlDB = SqlDB();
  loadData()async{
    emit(HomePageLoadingState());

    try{
      List query = await sqlDB.query();
      List<Song> songs = [];

      for(int i = 0;i < query.length;i++){
        var metaData = await MetadataRetriever.fromFile(File(query[i]['data']));
        Uint8List? unit = metaData.albumArt;
        songs.add(Song(
          artist: query[i]['artist'],
          data: query[i]['data'],
          title: query[i]['title'],
            image: unit,

        ));

      }
      emit(HomePageSuccessState(songs: songs));
      print('query: $query');
  }
  catch(e){
      emit(HomePageFailureState(errorMessage: e.toString()));
  }

}

}
