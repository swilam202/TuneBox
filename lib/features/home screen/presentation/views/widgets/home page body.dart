import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:musicapp/features/home%20screen/presentation/views/widgets/list%20view%20item.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListViewItem();
            },
          ),
        ),
      ),
    );
  }
}
