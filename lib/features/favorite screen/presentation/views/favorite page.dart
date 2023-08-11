

import 'package:flutter/material.dart';
import 'package:musicapp/features/favorite%20screen/presentation/views/widgets/favorite%20page%20body.dart';


class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key,required});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoritePageBody(),
    );
  }
}
