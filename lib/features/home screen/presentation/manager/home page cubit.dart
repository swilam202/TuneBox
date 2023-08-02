

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/core/database/sql%20database.dart';
import 'package:musicapp/features/home%20screen/presentation/manager/home%20page%20state.dart';

class HomePageCubit extends Cubit<HomePageState>{
  HomePageCubit():super(HomePageInitialState(message: 'There is no songs try now'));

  SqlDB sqlDB = SqlDB();
  loadData()async{
    emit(HomePageLoadingState());

    try{
      List query = await sqlDB.query();
      emit(HomePageSuccessState(songs: query));
  }
  catch(e){
      emit(HomePageFailureState(errorMessage: e.toString()));
  }

}

}
