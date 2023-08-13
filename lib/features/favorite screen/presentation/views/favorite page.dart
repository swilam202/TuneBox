import 'package:flutter/material.dart';

import 'widgets/favorite page body.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key, required});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoritePageBody(),
    );
  }
}
