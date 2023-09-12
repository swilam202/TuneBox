import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/list view item.dart';
import '../../../../../core/widgets/states handeling/errror state.dart';
import '../../../../../core/widgets/states handeling/inital state.dart';
import '../../../../../core/widgets/states handeling/loading state.dart';
import '../../../../home screen/presentation/manager/home page cubit.dart';
import '../../manager/favorite song cubit.dart';
import '../../manager/favorite songs state.dart';

class FavoritePageBody extends StatefulWidget {
  const FavoritePageBody({super.key});

  @override
  State<FavoritePageBody> createState() => _FavoritePageBodyState();
}

class _FavoritePageBodyState extends State<FavoritePageBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FavoritePageCubit>(context)
        .getSongs(songs: BlocProvider.of<HomePageCubit>(context).songs);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<FavoritePageCubit, FavoritePageState>(
        builder: (context, state) {
          if (state is FavoritePageSuccessState) {
            return ListView.builder(
              itemCount: state.songs.length,
              itemBuilder: (context, index) {
                return ListViewItem(
                  song: state.songs[index],
                  //index: state.indexes[index]
                  );
              },
            );
          } else if (state is FavoritePageFailureState) {
            return ErrorState(errorMessage: state.errorMessage);
          } else if (state is FavoritePageInitialState) {
            return InitialState(
              message: state.message,
            );
          } else {
            return const LoadingState();
          }
        },
      ),
    );
  }
}
