

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:get/get.dart';
import 'package:musicapp/core/database/sql%20database.dart';
import 'package:musicapp/features/home%20screen/presentation/manager/home%20page%20state.dart';
import 'package:musicapp/features/search%20screen/presentation/views/widgets/dialog%20button.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';


import '../../../home screen/data/song model.dart';
import 'search page state.dart';

class SearchPageCubit extends Cubit<SearchPageState>{
  SearchPageCubit():super(SearchPageInitialState(message: 'Try search for songs on your device'));

  SqlDB sqlDB = SqlDB();
  loadData(BuildContext context)async{
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
  emit(SearchPageLoadingState());
  await sqlDB.deleteAll();
  try{
    await sqlDB.deleteAll();
      late List<SongModel> mp3songs;
  
  Permission.audio.request();
  
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

else{
  
  Get.defaultDialog(

    backgroundColor: Colors.black,
    title: 'The app needs storage permissins!',
    titlePadding: const EdgeInsets.only(top: 16,bottom: 8,right: 12,left: 12),
    content: Row(
      children: [
      DialogButton(onPressed: ()=>Navigator.of(context).pop(), text: "Don't allow"),
      DialogButton(onPressed: (){openAppSettings();}, text: "Allow"),

      ],
    ),
  );
 //status = await Permission.storage.status;

 //status = await Permission.storage.request();
}

  }

 /* void getBack(){
    emit(SearchPageInitialState());
  }
*/
}
