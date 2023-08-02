import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/search page cubit.dart';

class SearchFail extends StatelessWidget {
  const SearchFail({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.close,
            size: 30,
            color: Colors.red,
          ),
          const Text(
            'Search failed please try again',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 28,
            ),
          ),
          OutlinedButton(
            child: const Text('Search again'),
            onPressed: () =>
                BlocProvider.of<SearchPageCubit>(context).loadData(),
          ),
        ],
      ),
    );
  }
}
