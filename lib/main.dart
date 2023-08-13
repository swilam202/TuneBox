import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'core/database/sql database.dart';
import 'features/favorite screen/presentation/manager/favorite song cubit.dart';
import 'features/home screen/presentation/manager/home page cubit.dart';
import 'features/search screen/presentation/manager/search page cubit.dart';
import 'features/song details screen/presentation/manager/slider cubit/slider cubit.dart';
import 'features/song details screen/presentation/manager/song details cubit/song details cubit.dart';
import 'features/splash screen/presentation/views/splash page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SqlDB sqlDB = SqlDB();
  await sqlDB.db;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageCubit()..loadData()),
        BlocProvider(create: (context) => SearchPageCubit()),
        BlocProvider(create: (context) => SongDetailsCubit()),
        BlocProvider(create: (context) => FavoritePageCubit()),
        BlocProvider(create: (context) => SliderCubit()),
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
