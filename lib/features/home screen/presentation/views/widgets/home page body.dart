import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/list view item.dart';
import '../../../../../core/widgets/states handeling/errror state.dart';
import '../../../../../core/widgets/states handeling/inital state.dart';
import '../../../../../core/widgets/states handeling/loading state.dart';
import '../../../../song details screen/presentation/controller/song details controller.dart';
import '../../../../song details screen/presentation/manager/song details cubit/song details cubit.dart';
import '../../manager/home page cubit.dart';
import '../../manager/home page state.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        if (state is HomePageSuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListView.builder(
              itemCount: state.songs.length,
              itemBuilder: (context, index) {
                SongDetailsController().pausePlayer();
                  //print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
                  //print('name: ${state.songs[index].title}');
                  //print('id: ${state.songs[index].id}');
                  //print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');   
                BlocProvider.of<SongDetailsCubit>(context)
                    .getAllSongs(state.songs);
                return ListViewItem(id: state.songs[index].id!);
              },
            ),
          );
        } else if (state is HomePageInitialState) {
          return InitialState(message: state.message);
        } else if (state is HomePageFailureState) {
          return ErrorState(errorMessage: state.errorMessage);
        } else {
          return const LoadingState();
        }
      },
    ),);
  }
}
