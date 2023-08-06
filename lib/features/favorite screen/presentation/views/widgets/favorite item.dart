import 'package:flutter/material.dart';


class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key,required this.id});
final int id;
  @override
  Widget build(BuildContext context) {
    return Text(id.toString(),style: TextStyle(fontSize: 30,color: Colors.white,),);
  }
}
