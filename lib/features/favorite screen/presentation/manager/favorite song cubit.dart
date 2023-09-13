import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/sql database.dart';
import '../../../home screen/data/song model.dart';
import '../../../home screen/presentation/manager/home page cubit.dart';
import 'favorite songs state.dart';

class FavoritePageCubit extends Cubit<FavoritePageState> {
  FavoritePageCubit()
      : super(FavoritePageInitialState(
            message: 'The favorite playlist is empty try add a song!'));

  SqlDB sqlDB = SqlDB();


  getSongs({required List<Song> songs}) async {
    emit(FavoritePageLoadingState());
    //List<Song> data = [];
    List<int> indexes = [];
    List query = await sqlDB.query('favorite');
     try {
      for (int i = 0; i < query.length; i++) {
        for (int j = 0; j < songs.length; j++) {
          if (query[i]['i'] == songs[j].id) {
            indexes.add(songs[j].id!);
            //data.add(songs[j]);
            break;
          }
        }

      }

      emit(FavoritePageSuccessState(indexes: indexes));
    } catch (e) {
      emit(FavoritePageFailureState(errorMessage: e.toString()));
    }
  }
}
