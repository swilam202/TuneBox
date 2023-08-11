

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:musicapp/core/database/sql%20database.dart';
import 'package:musicapp/features/home%20screen/presentation/manager/home%20page%20state.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';


import '../../../home screen/data/song model.dart';
import 'search page state.dart';

class SearchPageCubit extends Cubit<SearchPageState>{
  SearchPageCubit():super(SearchPageInitialState(message: 'Try search for songs on your device'));

  SqlDB sqlDB = SqlDB();
  loadData()async{
    emit(SearchPageLoadingState());
    await sqlDB.deleteAll();
    try{
      await sqlDB.deleteAll();
        late List<SongModel> mp3songs;

   // Permission.audio.request();
   // Permission.storage.request();
    print('recaling.........................');
    mp3songs = await OnAudioQuery.platform.querySongs();

    mp3songs = mp3songs.where((element) => element.data.endsWith('.mp3')).toList();
    for(int i = 0;i < mp3songs.length;i++){
      sqlDB.insert({
        'title': mp3songs[i].title,
        'data':mp3songs[i].data,
        'artist':mp3songs[i].artist ?? 'Unknown',
        'duration': mp3songs[i].duration ?? 0,
      },'songs');
 
    }



 






    print('success ++++++++++++++++++++++++-------------------------------');
    emit(SearchPageSuccessState(length: mp3songs.length));
    }
    catch(e){
      emit(SearchPageFailureState(errorMessage: e.toString()));
    }

  }

 /* void getBack(){
    emit(SearchPageInitialState());
  }
*/
}
