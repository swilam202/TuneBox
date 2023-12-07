import 'package:flutter/material.dart';

import 'widgets/favorite page body.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite songs'),
        centerTitle: true,

      ),
      body: const FavoritePageBody(),
    );
  }
}
