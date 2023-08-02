import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../search screen/presentation/views/search page.dart';
import 'widgets/home page body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Uint8List data = Uint8List.;
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchPage(),),);
          },
          icon: const Icon(Icons.add),
        ),
        centerTitle: true,
      ),
      body: HomePageBody(),
    );
  }
}
