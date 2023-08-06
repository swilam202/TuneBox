

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/features/favorite%20screen/presentation/manager/favorite%20songs%20state.dart';

import '../../../../core/database/sql database.dart';
import '../../../home screen/data/song model.dart';

class FavoritePageCubit extends Cubit<FavoritePageState>{
  FavoritePageCubit():super(FavoritePageInitialState());

  SqlDB sqlDB = SqlDB();
  getSongs()async{
    emit(FavoritePageLoadingState());
    List<Song> data = [];
    List items = await sqlDB.query('favorite');
    try{
      List songs = await  sqlDB.query('songs');
      for(int i = 0;i< items.length;i++){
        data.add(songs.firstWhere((element)=> element['id'] == items[i]['id']));
      }

      print('data: $data ////////////////////////////////////////');
      emit(FavoritePageSuccessState(songs: data));
    }catch(e){
      emit(FavoritePageFailureState(errorMessage: e.toString()));
    }
  }

}