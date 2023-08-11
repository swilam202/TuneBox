/*import 'package:flutter/material.dart';

import '../../../../home screen/data/song model.dart';
import '../../../../song details screen/presentation/views/song details page.dart';


class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key,required this.song});
final Song song;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SongDetailsPage(index: index,)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Colors.grey,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.red,
                image:  DecorationImage(
                  image: getImage(song),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title ?? 'No name',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    song.artist ?? 'Unkown',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.play_arrow,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
  ImageProvider getImage(Song song){
    if(song.image != null){
      return MemoryImage(
          song.image!
      );
    }
    else{
      return AssetImage('assets/images/music.png');
    }
  }
}
*/