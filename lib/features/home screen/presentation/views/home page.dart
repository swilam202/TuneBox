import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/sql database.dart';
import '../../../favorite screen/presentation/views/favorite page.dart';
import '../../../search screen/presentation/views/search page.dart';
import '../manager/home page cubit.dart';
import 'widgets/home page body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
          actions: [
            IconButton(
          onPressed: () async {
            await SqlDB().query('favorite');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FavoritePage(),
              ),
            );
          },
          icon:  Icon(
            Icons.favorite,
            color: Colors.teal[50],
          ),
        ),
        const SizedBox(width: 8),
       
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
            icon: const Icon(Icons.search),
            color: Colors.teal[50],
          ),
        ],
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async =>
            await BlocProvider.of<HomePageCubit>(context).loadData(),
      
        child: const HomePageBody(),
      ),
    );
  }
}
