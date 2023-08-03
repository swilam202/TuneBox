

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/manager/song%20details%20state.dart';

import '../../../home screen/data/song model.dart';

class SongDetailsCubit extends Cubit<SongDetailsState>{
  SongDetailsCubit():super(SongDetailsInitialState());

  List<Song> songs = [];
  AudioPlayer player = AudioPlayer();
  int index = 0;
  bool isPlaying = false;
  void getAllSongs(List<Song> list){
    songs = list;
  }

   loadSong(){
      if(index < 0){
        index = songs.length -1;
      }
      else if(index >= songs.length){

        index = 0;
      }
      emit(SongDetailsSuccessState(index: index, song: songs[index]));
      //return songs[index];


  }

    void pausePlayer ()async{
    await player.pause();
    isPlaying = false;
    }

  Icon getPlayICon(){
    if(isPlaying){
      return Icon(Icons.pause ,size: 40,);
    }
   else {
      return Icon(Icons.play_arrow,size: 40,);
    }
  }

  playSong()async{
    if(isPlaying){
      await player.pause();
      isPlaying = false;
    }
    else{
     await player.play();
      isPlaying = true;
    }

  }

}