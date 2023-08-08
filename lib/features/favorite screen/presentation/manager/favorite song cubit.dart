

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/features/favorite%20screen/presentation/manager/favorite%20songs%20state.dart';

import '../../../../core/database/sql database.dart';
import '../../../home screen/data/song model.dart';

class FavoritePageCubit extends Cubit<FavoritePageState>{
  FavoritePageCubit():super(FavoritePageInitialState());

  SqlDB sqlDB = SqlDB();
  getSongs({required List<Song> songs})async{
    emit(FavoritePageLoadingState());
    List<Song> data = [];
    List<int> indexes = [];
    List query = await sqlDB.query('favorite');
    print('favorite: $query ++++++++++++*************-----------------');
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

      print('data: $data ////////////////////////////////////////');
      emit(FavoritePageSuccessState(songs: data,indexes: indexes));
    }catch(e){
      emit(FavoritePageFailureState(errorMessage: e.toString()));
    }
  }

}