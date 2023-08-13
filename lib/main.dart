import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:get/get.dart';
import 'package:musicapp/features/favorite%20screen/presentation/manager/favorite%20song%20cubit.dart';
import 'package:musicapp/features/home%20screen/presentation/manager/home%20page%20cubit.dart';
import 'package:musicapp/features/home%20screen/presentation/views/home%20page.dart';
import 'package:musicapp/slider%20cubit.dart';
//import 'package:musicapp/features/song%20details%20screen/presentation/manager/song%20details%20cubit.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import 'core/database/sql database.dart';
import 'features/search screen/presentation/manager/search page cubit.dart';
import 'features/song details screen/presentation/manager/song details cubit/song details cubit.dart';
import 'features/splash screen/presentation/views/splash page.dart';

//import 'features/splash screen/presentation/views/splash screen.dart';

//import 'fueatures/splash screen/presentation/views/splash screen.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

     SqlDB sqlDB = SqlDB();
  sqlDB.db;
  runApp(const MyApp());


 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomePageCubit()..loadData()),
        BlocProvider(create: (context)=>SearchPageCubit()),
        BlocProvider(create: (context)=>SongDetailsCubit()),
        BlocProvider(create: (context)=>FavoritePageCubit()),
        BlocProvider(create: (context)=>SliderCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(46, 46, 46, 1.0),
          brightness: Brightness.dark,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

