import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/search page cubit.dart';

class SearchSuccess extends StatelessWidget {
  const SearchSuccess({super.key, required this.length});

  final int length;

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
            Icons.check,
            size: 50,
            color: Colors.green,
          ),
          const SizedBox(height: 15),
          const Text(
            'Search success',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 28,
            ),
          ),
          Text(
            '$length songs were found',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
          OutlinedButton(
            child: const Text('Search again'),
            onPressed: () =>
                BlocProvider.of<SearchPageCubit>(context).loadData(context),
          ),
        ],
      ),
    );
  }
}
