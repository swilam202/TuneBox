import 'package:flutter/material.dart';



class SongDetailsControlRow extends StatelessWidget {
  const SongDetailsControlRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,size: 20,),),
        IconButton(onPressed: (){}, icon: const Icon(Icons.skip_previous_rounded,size: 40,),),
        IconButton(onPressed: (){}, icon: const Icon(Icons.play_arrow,size: 40,),),
        IconButton(onPressed: (){}, icon: const Icon(Icons.skip_next_rounded,size: 40,),),
        IconButton(onPressed: (){}, icon: const Icon(Icons.repeat,size: 20,),),
      ],
    );
  }
}
