import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:musicapp/core/database/sql%20database.dart';
import 'package:musicapp/features/favorite%20screen/presentation/views/favorite%20page.dart';
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
        leading: IconButton(
          onPressed: ()async{
           await SqlDB().deleteDb();
           await SqlDB().initDatabase();
          },
          icon: const Icon(Icons.delete),
        ),
        actions: [
          IconButton(
            onPressed: ()async{
              await SqlDB().query('favorite');
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FavoritePage(),),);
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
        centerTitle: true,
      ),
      body: HomePageBody(),
    );
  }
}
