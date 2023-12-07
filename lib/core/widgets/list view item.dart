import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../features/home screen/data/song model.dart';
import '../../features/home screen/presentation/manager/home page cubit.dart';
import '../../features/song details screen/presentation/views/song details page.dart';
import 'get image.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.id});

  final int id;
  /*Future<QueryArtworkWidget>  lod(int id)async{
    return QueryArtworkWidget(id: id, type: ArtworkType.AUDIO);
  }*/
  @override
  Widget build(BuildContext context) {
    Song song = BlocProvider.of<HomePageCubit>(context)
        .songs
        .firstWhere((element) => element.id == id);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SongDetailsPage(
              id: id,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(8),

        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
               /* image: DecorationImage(
                  image: getImage(song.image),
                  fit: BoxFit.fill,
                  onError: (exception, stackTrace) => Icon(Icons.error),
                ),*/
              ),
              child: QueryArtworkWidget(id: song.songId,type: ArtworkType.AUDIO,),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title ?? 'No name',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    song.artist ?? 'Unknown',
                    style: const TextStyle(
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
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
