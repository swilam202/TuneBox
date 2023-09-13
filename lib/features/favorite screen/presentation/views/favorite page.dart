import 'package:flutter/material.dart';

import 'widgets/favorite page body.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key, required});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Favorite songs'),
        centerTitle: true,
        backgroundColor: Colors.teal[200],
      ),
      body: FavoritePageBody(),
    );
  }
}
