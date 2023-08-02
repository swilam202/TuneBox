import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:musicapp/features/home%20screen/presentation/manager/home%20page%20cubit.dart';
import 'package:musicapp/features/home%20screen/presentation/views/home%20page.dart';
import 'package:musicapp/song%20model.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import 'features/search screen/presentation/manager/search page cubit.dart';
import 'features/splash screen/presentation/views/splash page.dart';

//import 'features/splash screen/presentation/views/splash screen.dart';

//import 'fueatures/splash screen/presentation/views/splash screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomePageCubit()..loadData()),
        BlocProvider(create: (context)=>SearchPageCubit()..loadData()),
      ],
      child: MaterialApp(
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

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
//
//
// class HomePage extends StatefulWidget {
//    HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadSongs();
//   }
//   late List<SongModel> mp3songs;
//   List<Song> songs = [];
//   loadSongs()async{
//     Permission.audio.request();
//     Permission.storage.request();
//     print('recaling.........................');
//     mp3songs = await OnAudioQuery.platform.querySongs();
//
//     mp3songs = mp3songs.where((element) => element.data.endsWith('.mp3')).toList();
//   }
//
//   Uint8List? ima;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               ElevatedButton(
//                 onPressed: ()async{
//
//                   final metaData = await MetadataRetriever.fromFile(File(mp3songs[0].data));
//
//                  setState(() {
//                    ima = metaData.albumArt;
//                  });
//                  String data = AsciiDecoder().convert(ima!);
//                   print(data);
//                 },
//                 child: Text('press me'),
//               ),
//         ima == null ?  SizedBox(): SizedBox(height: 100,width:100,child: Image.memory(ima!),),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

