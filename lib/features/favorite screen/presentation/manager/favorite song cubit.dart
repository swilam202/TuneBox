

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/features/favorite%20screen/presentation/manager/favorite%20songs%20state.dart';

import '../../../../core/database/sql database.dart';
import '../../../home screen/data/song model.dart';

class FavoritePageCubit extends Cubit<FavoritePageState>{
  FavoritePageCubit():super(FavoritePageInitialState(message: 'The favorite playlist is empty try add a song!'));

  SqlDB sqlDB = SqlDB();
  getSongs({required List<Song> songs})async{
    emit(FavoritePageLoadingState());
    List<Song> data = [];
    List<int> indexes = [];
    List query = await sqlDB.query('favorite');
    try{

      for(int i = 0;i< query.length;i++){

        for(int j = 0;j<songs.length;j++){
          if(query[i]['id'] == songs[j].id){
            indexes.add(query[i]['i']);
            data.add(songs[j]);
            break;
          }
        }

      }


      emit(FavoritePageSuccessState(indexes: indexes));
    }catch(e){
      emit(FavoritePageFailureState(errorMessage: e.toString()));
    }
  }

}