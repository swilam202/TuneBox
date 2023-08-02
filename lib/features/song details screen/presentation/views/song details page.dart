import 'package:flutter/material.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/views/widgets/songs%20details%20body.dart';


class SongDetailsPage extends StatelessWidget {
  const SongDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SongDetailsBody(),
    );
  }
}
