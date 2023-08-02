import 'package:flutter/material.dart';
import 'package:musicapp/features/home%20screen/presentation/views/widgets/list%20view%20item.dart';


class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context,index){
              return ListViewItem();
            },
          ),
        ),
      ),
    );
  }
}
