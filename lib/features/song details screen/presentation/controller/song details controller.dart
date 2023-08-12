import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/core/database/sql%20database.dart';


class SongDetailsController extends GetxController{


  SqlDB sqlDB = SqlDB();
  RxBool isLiked = false.obs;
    Rx<AudioPlayer> player = AudioPlayer().obs;
      RxBool isPlaying = false.obs;
        RxInt autoMode = 1.obs;
          RxDouble sliderVal = 50000.0.obs;
          double v = 0.0;

    chekIfFavorite({required int songId})async{
      isLiked.value = false;
  List data = await sqlDB.query('favorite');
  print('data query $data ***************////////////////////----------------------------');
  print('song id $songId  ***************////////////////////----------------------------');
  for(int i = 0;i < data.length; i++){
    if(data[i]['id'] == songId){
        isLiked.value = true;
      break;
    }

  }
  }


onCh(double val)async{
  await player.value.seek(Duration(milliseconds: val.toInt(),),);
  sliderVal.value = val;
}





    void pausePlayer ()async{
    await player.value.pause();
    isPlaying.value = false;
    }


  playSong()async{
    if(isPlaying.value){

      await player.value.pause();
isPlaying.value = false;
    }
    else{
     await player.value.play();
isPlaying.value = true;
    }

  }

  switchMode(){
    if(autoMode.value > 2){
      autoMode.value = 0;
    }
    else{
      autoMode.value++;
    }
  }

}